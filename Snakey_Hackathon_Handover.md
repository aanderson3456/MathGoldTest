# Snakey: Kaggle Hackathon Handover Document

## 1. Project Overview
This project is an open-source, interactive playground for the game **Snakey** (a topological game played on a grid, akin to Go or Tic-Tac-Toe but on a dynamic board). It is being built as a prototype submission for a Kaggle hackathon. 

The goal of the platform is to allow users (and specifically Kaggle competitors) to:
1. Play the game manually as Maker or Breaker against built-in AI models.
2. See the actual Python code driving the AI in the browser.
3. Edit the Python strategy directly in the browser to compete against the Optimal AI in an "Auto-Play Match".

## 2. Architecture & File Structure
The project is built as a split-stack web application:
- **Frontend (`snakey-ui/`)**: Built using Angular 17 and D3.js. It renders the game grid, manages turn state, handles all the game mode selections, and features an editable `<textarea>` for Python code alongside a live execution log console.
  - Key file: `snakey-ui/src/app/snakey.ts` (Handles game logic, minimax algorithm UI state, and API communication).
  - Key file: `snakey-ui/src/app/snakey.html` (The UI layout).
- **Backend (`snakey-api/`)**: A Python FastAPI server. It acts as the "game engine" for custom Python strategies.
  - Key file: `snakey-api/main.py` (Contains the `/api/get-move` endpoint which safely redirects `stdout` to capture live print statements from the user's Python code and returns the computed move).

## 3. Core Features Implemented So Far
- **D3.js Interactive Grid**: Renders the game board, highlights invalid/valid placements, and draws paving strategies.
- **Dynamic Game Modes**: Supports PvP, Player vs AI (Optimal/Random), and AI vs AI auto-play battles.
- **Python Minimax AI**: We translated the Optimal Minimax algorithm (Alpha-Beta pruning) from TypeScript into Python. This Python code is dynamically injected into the UI editor as the default strategy.
- **Live Execution Engine**: The UI passes the custom Python code to the backend. The backend executes the code on the current board state and passes back both the computed move and any `print()` logs, which are streamed into a black terminal window in the UI.
- **Auto-Play Loop**: An interactive mode where the Custom Python AI and the Optimal AI battle it out automatically with a 500ms delay, allowing users to watch their heuristic strategies unfold.

## 4. How to Run the Environment
If you need to spin the environment back up to test changes:
1. **Backend**: 
   ```bash
   cd snakey-api
   source venv/bin/activate
   python3 main.py
   ```
2. **Frontend**: 
   ```bash
   cd snakey-ui
   npm run start
   ```
The frontend will proxy API requests (`/api/*`) to the backend running on port 8000. Access the UI at `http://localhost:4200`.

## 5. Next Steps / To-Do List
The student has been testing the game and will likely have feedback. Future work in this next session may include:
- **Heuristic Improvements**: Adding machine learning or RL-based heuristics (from the Kaggle class) to optimize the tree search beyond standard Alpha-Beta pruning.
- **UI Polish**: Enhancing the visual flair of the Auto-Play match (e.g., animations for the winning move).
- **Security & Sandboxing**: If taking this to production, the Python execution in `main.py` needs strict sandboxing (e.g., Docker integration) rather than standard `exec()`.
- **Kaggle Submission Prep**: Packaging the codebase into a clean, reproducible state for the hackathon judges (e.g., Dockerizing the frontend and backend).

---
**Agent Instructions**: When resuming this session, read this document to understand the codebase. Prioritize changes to `snakey.ts`, `snakey.html`, and `main.py` when expanding the game's capabilities.
