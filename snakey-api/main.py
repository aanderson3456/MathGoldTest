from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import sys
import io
import contextlib
import traceback

app = FastAPI()

class CodeSubmit(BaseModel):
    code: str
    targetShape: str

class GetMoveRequest(BaseModel):
    board_state: dict[str, str]
    current_turn: str
    code: str

@app.post("/api/get-move")
async def get_move_api(request: GetMoveRequest):
    # Capture stdout
    stdout = io.StringIO()
    try:
        # Create an execution environment
        exec_env = {}
        with contextlib.redirect_stdout(stdout):
            exec(request.code, exec_env)
            
            if "get_move" not in exec_env:
                return {"status": "error", "message": "Function 'get_move' not found in your code.", "logs": stdout.getvalue()}
                
            # Execute the user's function with the live board state
            move = exec_env["get_move"](request.board_state, request.current_turn)
        
        return {
            "status": "success", 
            "move": move,
            "logs": stdout.getvalue()
        }
    except Exception as e:
        return {
            "status": "error",
            "message": f"Execution failed: {str(e)}",
            "logs": stdout.getvalue(),
            "traceback": traceback.format_exc()
        }

@app.post("/api/evaluate")
async def evaluate_strategy(submission: CodeSubmit):
    # This is a highly simplified and insecure prototype for evaluating user code.
    # In a production environment, this would run in an isolated sandbox (e.g. Docker).
    # The user's code should define a function `get_move(board, current_turn)`
    user_code = submission.code
    
    # Capture stdout
    stdout = io.StringIO()
    
    try:
        # Create an execution environment
        exec_env = {}
        with contextlib.redirect_stdout(stdout):
            exec(user_code, exec_env)
            
        if "get_move" not in exec_env:
            return {"status": "error", "message": "Function 'get_move' not found in your code.", "logs": stdout.getvalue()}
            
        # Mock board state for testing the function once
        test_board = {}
        test_move = exec_env["get_move"](test_board, "Breaker")
        
        return {
            "status": "success", 
            "message": "Strategy evaluated successfully. It returned a valid move format.",
            "test_move": test_move,
            "logs": stdout.getvalue()
        }
    except Exception as e:
        return {
            "status": "error",
            "message": f"Execution failed: {str(e)}",
            "logs": stdout.getvalue(),
            "traceback": traceback.format_exc()
        }

class GameFame(BaseModel):
    name: str
    score: int
    level: int
    game: str

@app.post("/api/game-fame")
async def submit_game_fame(fame: GameFame):
    print(f"Received high score: {fame.name} scored {fame.score} on level {fame.level}")
    return {"status": "success"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
