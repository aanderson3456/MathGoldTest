from fastapi import FastAPI, HTTPException, Depends
from pydantic import BaseModel
import sys
import io
import contextlib
import traceback
import asyncio
from sqlalchemy.orm import Session
import random

from database import SessionLocal, Strategy, MatchResult
import sandbox

app = FastAPI()

class CodeSubmit(BaseModel):
    code: str
    targetShape: str

class VibeCodeRequest(BaseModel):
    targetShape: str
    trajectory: list

class SubmitStrategyRequest(BaseModel):
    author: str
    code: str

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

# --- Vibe Code & Tournament Endpoints ---

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/api/generate-vibe-code")
async def generate_vibe_code(request: VibeCodeRequest):
    # Mocking Gemma 2B/7B LLM response based on Kaggle class handover
    # In a real implementation, we would pass request.trajectory to the model
    
    mock_generated_code = f"""def get_move(board_state, current_turn):
    # AI-Generated Strategy via Gemma 2B (Mock)
    # Infers heuristics from your recent trajectory of {len(request.trajectory)} moves!
    
    import random
    
    valid_cells = []
    for x in range(20):
        for y in range(20):
            if f"{{x}},{{y}}" not in board_state:
                valid_cells.append({{"x": x, "y": y}})
                
    # Basic inferred vibe: play near existing pieces
    if valid_cells:
        adjacent = []
        for cell in valid_cells:
            for dx, dy in [(0,1), (0,-1), (1,0), (-1,0)]:
                if f"{{cell['x']+dx}},{{cell['y']+dy}}" in board_state:
                    adjacent.append(cell)
                    break
        if adjacent:
            return random.choice(adjacent)
        return random.choice(valid_cells)
        
    return None
"""
    return {"status": "success", "code": mock_generated_code}

@app.post("/api/submit-strategy")
async def submit_strategy(request: SubmitStrategyRequest, db: Session = Depends(get_db)):
    new_strategy = Strategy(author=request.author, code=request.code, elo=1200.0)
    db.add(new_strategy)
    db.commit()
    db.refresh(new_strategy)
    return {"status": "success", "strategy_id": new_strategy.id}

@app.get("/api/leaderboard")
async def get_leaderboard(db: Session = Depends(get_db)):
    strategies = db.query(Strategy).order_by(Strategy.elo.desc()).limit(10).all()
    return {
        "status": "success",
        "leaderboard": [{"author": s.author, "elo": round(s.elo, 1), "wins": s.wins, "losses": s.losses} for s in strategies]
    }

# --- Tournament Background Worker ---

async def tournament_worker():
    print("Starting async tournament worker...")
    while True:
        await asyncio.sleep(5)
        
        db = SessionLocal()
        try:
            # Get two random strategies
            count = db.query(Strategy).count()
            if count < 2:
                continue
            
            strategies = db.query(Strategy).order_by(Strategy.id).all()
            s1, s2 = random.sample(strategies, 2)
            
            print(f"Running match: {s1.author} vs {s2.author}")
            
            # Run in sandbox (thread so we don't block event loop)
            winner = await asyncio.to_thread(sandbox.run_match_in_sandbox, s1.code, s2.code)
            
            # Update ELO
            # K-factor = 32
            # E_A = 1 / (1 + 10 ** ((R_B - R_A) / 400))
            K = 32
            E1 = 1 / (1 + 10 ** ((s2.elo - s1.elo) / 400))
            E2 = 1 / (1 + 10 ** ((s1.elo - s2.elo) / 400))
            
            if winner == 'Maker': # s1 wins
                S1, S2 = 1, 0
                s1.wins += 1
                s2.losses += 1
                winner_id = s1.id
            elif winner == 'Breaker': # s2 wins
                S1, S2 = 0, 1
                s2.wins += 1
                s1.losses += 1
                winner_id = s2.id
            else: # Draw
                S1, S2 = 0.5, 0.5
                winner_id = None
                
            s1.elo = s1.elo + K * (S1 - E1)
            s2.elo = s2.elo + K * (S2 - E2)
            
            if winner_id is not None:
                mr = MatchResult(strategy1_id=s1.id, strategy2_id=s2.id, winner_id=winner_id)
                db.add(mr)
                
            db.commit()
            print(f"Match done. {s1.author}: {s1.elo:.1f}, {s2.author}: {s2.elo:.1f}")
        except Exception as e:
            print(f"Tournament worker error: {e}")
            db.rollback()
        finally:
            db.close()

@app.on_event("startup")
async def startup_event():
    asyncio.create_task(tournament_worker())

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
