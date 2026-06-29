import json
import os
from google import genai
from google.genai import types

def run_evaluation():
    # Force use of Developer API
    os.environ["GOOGLE_GENAI_USE_VERTEXAI"] = "False"
    client = genai.Client()
    
    with open("artifacts/traces/generated_traces.json", "r") as f:
        traces = json.load(f)["eval_cases"]
        
    with open("tests/eval/eval_config.yaml", "r") as f:
        import yaml
        config = yaml.safe_load(f)
        
    metrics = {m["name"]: m["prompt_template"] for m in config["custom_metrics"]}
    
    results = {
        m: {"total": 0, "pass": 0, "fail": 0} for m in metrics.keys()
    }
    
    print("Evaluating cases...")
    for case in traces:
        case_id = case["eval_case_id"]
        print(f"\nCase: {case_id}")
        
        prompt_data = json.dumps(case["prompt"])
        response_data = case["responses"][0]["response"]["parts"][0]["text"]
        
        for metric_name, template in metrics.items():
            prompt_text = template.replace("{prompt}", prompt_data).replace("{response}", response_data)
            
            resp = client.models.generate_content(
                model="gemini-3.5-flash",
                contents=prompt_text,
                config=types.GenerateContentConfig(
                    response_mime_type="application/json",
                )
            )
            
            try:
                eval_result = json.loads(resp.text)
                score = eval_result.get("score", 1)
                explanation = eval_result.get("explanation", "Failed to parse")
            except Exception as e:
                score = 1
                explanation = f"Error parsing output: {e}"
                
            results[metric_name]["total"] += 1
            if score >= 4:
                results[metric_name]["pass"] += 1
                status = "PASS"
            else:
                results[metric_name]["fail"] += 1
                status = "FAIL"
                
            print(f"  [{metric_name}] {status} (Score: {score}) - {explanation}")
            
    print("\nEvaluation Summary")
    print("==================")
    for m, stats in results.items():
        print(f"{m}: {stats['pass']}/{stats['total']} Passed")

if __name__ == "__main__":
    run_evaluation()
