import json
import asyncio
import os
from google.adk.apps import App
from google.adk.runners import InMemoryRunner
from google.adk.events.request_input import RequestInput
from google.genai import types

# Import the root agent
from app.agent import root_agent

async def generate_traces():
    app = App(name="app", root_agent=root_agent)
    runner = InMemoryRunner(app=app)
    
    dataset_path = "tests/eval/datasets/basic-dataset.json"
    with open(dataset_path, "r") as f:
        dataset = json.load(f)
        
    out_cases = []
    
    for case in dataset["eval_cases"]:
        case_id = case["eval_case_id"]
        prompt_data = case["prompt"]
        text_input = prompt_data["parts"][0]["text"]
        
        app = App(name="app", root_agent=root_agent)
        runner = InMemoryRunner(app=app)
        
        session = await runner.session_service.create_session(app_name="app", user_id="test_user")
        
        content = types.Content(role=prompt_data["role"], parts=[types.Part.from_text(text=text_input)])
        
        final_output_dict = None
        
        async for event in runner.run_async(
            user_id="test_user",
            session_id=session.id,
            new_message=content
        ):
            if hasattr(event, "output") and event.output is not None:
                if isinstance(event.output, dict) and "status" in event.output:
                    final_output_dict = event.output
        
        # Serialize to Eval dataset format (single-turn)
        out_case = {
            "eval_case_id": case_id,
            "prompt": prompt_data,
            "responses": [
                {
                    "response": {
                        "role": "model",
                        "parts": [{"text": json.dumps(final_output_dict)}]
                    }
                }
            ]
        }
        out_cases.append(out_case)
        print(f"Generated trace for {case_id}")

    os.makedirs("artifacts/traces", exist_ok=True)
    with open("artifacts/traces/generated_traces.json", "w") as f:
        json.dump({"eval_cases": out_cases}, f, indent=2)

if __name__ == "__main__":
    asyncio.run(generate_traces())
