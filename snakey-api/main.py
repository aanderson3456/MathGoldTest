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
    previous_strategy: str | None = None

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
async def evaluate_strategy(submission: CodeSubmit, db: Session = Depends(get_db)):
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
        
        # Simulate matches
        vibe_player = db.query(Strategy).filter(Strategy.author == 'VibePlayer').first()
        challenger = db.query(Strategy).filter(Strategy.author == 'Challenger').first()
        
        vs_vibe = "Error"
        vs_challenger = "Error"
        
        # Use targetShape from submission if it exists, otherwise default
        target_shape = getattr(submission, 'targetShape', 'Pentomino_F')
        
        if vibe_player:
            winner = await asyncio.to_thread(sandbox.run_match_in_sandbox, user_code, vibe_player.code, target_shape)
            vs_vibe = "Win" if winner == "Maker" else ("Loss" if winner == "Breaker" else "Draw")
            
        if challenger:
            winner = await asyncio.to_thread(sandbox.run_match_in_sandbox, user_code, challenger.code, target_shape)
            vs_challenger = "Win" if winner == "Maker" else ("Loss" if winner == "Breaker" else "Draw")

        return {
            "status": "success", 
            "message": "Strategy evaluated successfully. It returned a valid move format.",
            "test_move": test_move,
            "vs_vibe": vs_vibe,
            "vs_challenger": vs_challenger,
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
    
    prev_str = ""
    if request.previous_strategy:
        # Limit to first 20 lines
        lines = request.previous_strategy.split('\n')[:20]
        prev_str = "\n    # Building upon previous strategy snippet:\n"
        for line in lines:
            prev_str += f"    # {line}\n"
    
    mock_generated_code = f"""def get_move(board_state, current_turn):
    # AI-Generated Strategy via Gemma 2B (Mock)
    # Infers heuristics from your recent trajectory of {len(request.trajectory)} moves!{prev_str}
    
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
        "leaderboard": [{"id": s.id, "author": s.author, "elo": round(s.elo, 1), "wins": s.wins, "losses": s.losses} for s in strategies]
    }

@app.get("/api/recent-matches")
async def get_recent_matches(db: Session = Depends(get_db)):
    results = db.query(MatchResult).order_by(MatchResult.id.desc()).limit(5).all()
    matches = []
    for r in results:
        s1 = db.query(Strategy).filter(Strategy.id == r.strategy1_id).first()
        s2 = db.query(Strategy).filter(Strategy.id == r.strategy2_id).first()
        winner = db.query(Strategy).filter(Strategy.id == r.winner_id).first() if r.winner_id else None
        
        s1_name = s1.author if s1 else "Unknown"
        s2_name = s2.author if s2 else "Unknown"
        winner_name = winner.author if winner else "Draw"
        
        matches.append({
            "id": r.id,
            "maker": s1_name,
            "breaker": s2_name,
            "winner": winner_name
        })
    return {"status": "success", "matches": matches}

@app.get("/api/strategy/{strategy_id}")
async def get_strategy(strategy_id: int, db: Session = Depends(get_db)):
    strategy = db.query(Strategy).filter(Strategy.id == strategy_id).first()
    if not strategy:
        raise HTTPException(status_code=404, detail="Strategy not found")
    return {
        "status": "success",
        "strategy": {
            "id": strategy.id,
            "author": strategy.author,
            "code": strategy.code,
            "elo": round(strategy.elo, 1)
        }
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
    db = SessionLocal()
    try:
        count = db.query(Strategy).count()
        if count < 5:
            existing = {s.author for s in db.query(Strategy).all()}
            personalities = [
                {
                    "author": "VibePlayer",
                    "code": """def get_move(board_state, current_turn):
    import random
    valid_cells = []
    for x in range(20):
        for y in range(20):
            if f"{x},{y}" not in board_state:
                valid_cells.append({"x": x, "y": y})
    if valid_cells:
        adjacent = []
        for cell in valid_cells:
            for dx, dy in [(0,1), (0,-1), (1,0), (-1,0)]:
                if f"{cell['x']+dx},{cell['y']+dy}" in board_state:
                    adjacent.append(cell)
                    break
        if adjacent:
            return random.choice(adjacent)
        return random.choice(valid_cells)
    return None
"""
                },
                {
                    "author": "Challenger",
                    "code": """def get_move(board_state, current_turn):
    import random
    grid_size = 20
    valid_cells = []
    for x in range(grid_size):
        for y in range(grid_size):
            if f"{x},{y}" not in board_state:
                valid_cells.append({"x": x, "y": y})
    if not valid_cells:
        return None
    maker_adjacent = []
    for cell in valid_cells:
        is_adj = False
        for dx, dy in [(0,1), (0,-1), (1,0), (-1,0), (1,1), (-1,-1), (1,-1), (-1,1)]:
            tx, ty = cell['x'] + dx, cell['y'] + dy
            if board_state.get(f"{tx},{ty}") == 'Maker':
                is_adj = True
                break
        if is_adj:
            maker_adjacent.append(cell)
    if maker_adjacent:
        return random.choice(maker_adjacent)
    center = grid_size // 2
    valid_cells.sort(key=lambda c: (c["x"]-center)**2 + (c["y"]-center)**2)
    return valid_cells[0]
"""
                },
                {
                    "author": "Elder",
                    "code": """def get_move(board_state, current_turn):
    import random
    grid_size = 20
    opponent = "Maker" if current_turn.lower() == "breaker" else "Breaker"
    opp_cells = []
    valid_cells = []
    for x in range(grid_size):
        for y in range(grid_size):
            owner = board_state.get(f"{x},{y}")
            if not owner:
                valid_cells.append({"x": x, "y": y})
            elif owner.lower() == opponent.lower():
                opp_cells.append((x, y))
    if not valid_cells:
        return None
    if opp_cells:
        block_candidates = []
        for (ox, oy) in opp_cells:
            for dx, dy in [(0,1), (0,-1), (1,0), (-1,0), (1,1), (1,-1), (-1,1), (-1,-1)]:
                bx, by = ox + dx, oy + dy
                if 0 <= bx < grid_size and 0 <= by < grid_size:
                    if f"{bx},{by}" not in board_state:
                        block_candidates.append({"x": bx, "y": by})
        if block_candidates:
            return random.choice(block_candidates)
    center = grid_size // 2
    valid_cells.sort(key=lambda c: (c["x"]-center)**2 + (c["y"]-center)**2)
    return valid_cells[0]
"""
                },
                {
                    "author": "Goldfish",
                    "code": """def get_move(board_state, current_turn):
    import random
    grid_size = 20
    valid_cells = []
    for x in range(grid_size):
        for y in range(grid_size):
            if f"{x},{y}" not in board_state:
                valid_cells.append({"x": x, "y": y})
    if not valid_cells:
        return None
    
    last_move_key = list(board_state.keys())[-1] if board_state else None
    if last_move_key:
        lx, ly = map(int, last_move_key.split(','))
        adj_to_last = []
        for dx, dy in [(0,1), (0,-1), (1,0), (-1,0), (1,1), (-1,-1), (1,-1), (-1,1)]:
            ax, ay = lx + dx, ly + dy
            if 0 <= ax < grid_size and 0 <= ay < grid_size and f"{ax},{ay}" not in board_state:
                adj_to_last.append({"x": ax, "y": ay})
        if adj_to_last:
            return random.choice(adj_to_last)
            
    return random.choice(valid_cells)
"""
                },
                {
                    "author": "RandomJitter",
                    "code": """def get_move(board_state, current_turn):
    import random
    grid_size = 20
    has_pieces = False
    min_x, max_x, min_y, max_y = grid_size, 0, grid_size, 0
    for k in board_state:
        x, y = map(int, k.split(','))
        has_pieces = True
        min_x, max_x = min(min_x, x), max(max_x, x)
        min_y, max_y = min(min_y, y), max(max_y, y)
    valid_cells = []
    if has_pieces:
        for x in range(max(0, min_x - 2), min(grid_size, max_x + 3)):
            for y in range(max(0, min_y - 2), min(grid_size, max_y + 3)):
                if f"{x},{y}" not in board_state:
                    valid_cells.append({"x": x, "y": y})
    if not valid_cells:
        for x in range(grid_size):
            for y in range(grid_size):
                if f"{x},{y}" not in board_state:
                    valid_cells.append({"x": x, "y": y})
    if valid_cells:
        return random.choice(valid_cells)
    return None
"""
                }
            ]
            for p in personalities:
                if p["author"] not in existing:
                    new_s = Strategy(author=p["author"], code=p["code"], elo=1200.0)
                    db.add(new_s)
            db.commit()
            print("Successfully seeded default personalities.")
    except Exception as e:
        print(f"Error seeding database: {e}")
        db.rollback()
    finally:
        db.close()
    asyncio.create_task(tournament_worker())

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
