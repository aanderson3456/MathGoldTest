# Vibe Code Mode & Tournament Hall of Fame: Architectural Handover

## 1. Feature Vision
"Vibe Code Mode" bridges the gap between human intuition and algorithmic strategy. Rather than forcing players to write Python code from scratch to compete against the AI, players can simply *play the game manually*. The system observes their moves, infers the underlying heuristics (their "vibes"), and generates a valid Python strategy script. 

Once generated, players can save and submit their strategy to a continuous, asynchronous **Snakey Tournament**, competing for the top spot on the **Hall of Fame** leaderboard.

---

## 2. Core Components & Architecture

### A. The "Vibe" Tracker (Frontend - Angular)
- **State Recording**: We need to modify `snakey.ts` to record a trajectory of `[board_state, chosen_move]` tuples during manual play.
- **Vibe Submission**: When the player finishes a game (or a set number of turns), a new button "Generate Vibe Code" sends this trajectory payload to the backend.

### B. The Vibe-to-Code Compiler (Backend - FastAPI + LLM)
- **LLM Integration**: The FastAPI backend (`main.py`) will require an endpoint (e.g., `/api/generate-vibe-code`) that interfaces with an LLM (like Gemini or a fine-tuned model from the Kaggle class).
- **Prompt Engineering**: The prompt will pass the game rules, the target shape, and the recorded `[state, action]` tuples. It will ask the LLM to output a `get_move(board_state, current_turn)` Python function that generalizes the player's behavior (e.g., "prioritize placing pieces adjacent to existing ones", "actively block the opponent's 3-in-a-row").
- **Code Delivery**: The generated Python code is returned to the frontend and injected directly into the existing Python AI Strategy Editor, allowing the user to tweak it before submission.

### C. The Tournament Engine (Backend / Database)
- **Strategy Database**: Implement a lightweight database (e.g., SQLite via SQLAlchemy) to store:
  - `Strategy ID`
  - `Author Name`
  - `Python Code`
  - `ELO Rating` / `Win-Loss Record`
- **Submission Endpoint**: `/api/submit-strategy` to save the strategy to the database.
- **Asynchronous Matchmaker**: A background worker (using `asyncio` or `Celery`) that continuously selects pairs of saved strategies and runs auto-play matches head-to-head in a sandboxed environment.
- **Rank Update**: After each background match, the worker updates the ELO ratings of the two strategies.

### D. The Hall of Fame (Frontend - Angular)
- **Leaderboard UI**: A new panel or modal in `snakey.html` that fetches the top strategies from `/api/leaderboard`.
- **Live Updating**: Poll the leaderboard endpoint every few seconds to show shifting ranks as the background tournament engine processes matches.
- **Spectate Mode**: Allow users to click on a leaderboard entry and watch a replay of its most recent tournament match.

---

## 3. Implementation Phases & Milestones

### Phase 1: Trajectory Recording & LLM Generation
1. Update `snakey.ts` to capture `(board, move)` history during PvP or Player vs AI.
2. Build the `/api/generate-vibe-code` endpoint in `main.py`.
3. Add UI controls to trigger the generation and load the result into the Python textarea.

### Phase 2: Database & Submission
1. Set up a SQLite database and models for `Strategy` and `MatchResult`.
2. Create the `/api/submit-strategy` endpoint.
3. Add the "Submit to Tournament" UI flow in the Angular frontend.

### Phase 3: The Tournament Worker
1. Build the background evaluation loop.
2. **Crucial Security Note**: Because we are executing user-submitted (or LLM-generated) Python code in bulk, the `exec()` function currently used in `main.py` is no longer safe. We must wrap the match execution in a strict sandbox (e.g., a locked-down Docker container or WASM environment) to prevent malicious code from breaking the tournament engine.
3. Implement standard ELO calculation logic.

### Phase 4: Leaderboard & Polish
1. Expose the `/api/leaderboard` endpoint.
2. Build the "Hall of Fame" UI component, replacing the basic "Victory Achieved!" card.

---

## 4. Known Challenges & "Gotchas"
- **Sandboxing**: Executing untrusted Python code in a continuous loop is the biggest technical hurdle. Do not deploy the tournament engine to the open internet without addressing `exec()` vulnerabilities.
- **LLM Latency**: Generating code from a long list of moves might be slow. The UI should have a nice loading state (e.g., "Analyzing your vibes...").
- **Determinism**: If strategies rely on `random.choice()`, tournament results will have high variance. The ELO system will need enough matches to smooth this out.

*End of Handover Document.*
