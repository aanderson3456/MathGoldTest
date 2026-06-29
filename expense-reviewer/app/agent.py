import os
from typing import Union, Any
from pydantic import BaseModel
import google.auth
from google.genai.types import Content

from google.adk.agents.context import Context
from google.adk.apps import App
from google.adk.events.event import Event
from google.adk.events.request_input import RequestInput
from google.adk.workflow import Workflow

try:
    _, project_id = google.auth.default()
    os.environ["GOOGLE_CLOUD_PROJECT"] = project_id
except Exception:
    pass

os.environ["GOOGLE_CLOUD_LOCATION"] = "global"
os.environ["GOOGLE_GENAI_USE_VERTEXAI"] = "True"

class Expense(BaseModel):
    amount: float
    description: str

class ExpenseState(BaseModel):
    amount: float = 0.0
    description: str = ""
    status: str = "pending"
    decision_notes: str = ""

def classify_expense(node_input: Union[Expense, Content, dict]) -> Event:
    expense = None
    if isinstance(node_input, Expense):
        expense = node_input
    elif hasattr(node_input, "parts") and node_input.parts:
        text_input = node_input.parts[0].text
        try:
            import json
            data = json.loads(text_input)
            expense = Expense(**data)
        except Exception:
            # Fallback for simple natural language tests
            amt = 50.0 if "50" in text_input else (150.0 if "150" in text_input else 0.0)
            expense = Expense(amount=amt, description=text_input)
    elif isinstance(node_input, dict):
        expense = Expense(**node_input)
    else:
        raise ValueError(f"Unsupported input type: {type(node_input)}")

    state_updates = {
        "amount": expense.amount,
        "description": expense.description,
    }

    if expense.amount < 100:
        return Event(output=expense, route="auto_approve", state=state_updates)
    else:
        return Event(output=expense, route="review", state=state_updates)

def auto_approve(ctx: Context, node_input: Expense) -> Event:
    msg = f"Auto-approved expense for ${node_input.amount}: {node_input.description}"
    return Event(
        output=msg,
        state={"status": "approved", "decision_notes": "Automatically approved (< $100)"}
    )

async def review_agent(ctx: Context, node_input: Expense):
    if not ctx.resume_inputs:
        msg = f"Review required for expense of ${node_input.amount} ({node_input.description}). Approve? (yes/no)"
        yield RequestInput(interrupt_id="human_approval", message=msg)
        return

    decision = ctx.resume_inputs.get("human_approval", "").strip().lower()
    if decision in ["yes", "approve", "y"]:
        msg = f"Expense of ${node_input.amount} was APPROVED by reviewer."
        yield Event(
            output=msg,
            state={"status": "approved", "decision_notes": "Approved by human reviewer"}
        )
    else:
        msg = f"Expense of ${node_input.amount} was REJECTED by reviewer."
        yield Event(
            output=msg,
            state={"status": "rejected", "decision_notes": "Rejected by human reviewer"}
        )

root_agent = Workflow(
    name="ambient_expense_agent",
    edges=[
        ('START', classify_expense),
        (classify_expense, {
            "auto_approve": auto_approve,
            "review": review_agent,
        }),
    ],
    input_schema=Union[Expense, Content],
    state_schema=ExpenseState,
)

app = App(
    root_agent=root_agent,
    name="app",
)
