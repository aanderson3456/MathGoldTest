# MathGold / Snakey: Testing Phase Handover

Welcome to the **Testing & QA Phase** for the MathGold Snakey project! 
This document summarizes the recently deployed "Vibe Code Mode" and "Tournament Hall of Fame" features. It serves as context for the next AI agent or human tester analyzing screenshots and verifying functionality.

---

## 1. System Architecture

* **Frontend (Angular)**: Located in `snakey-ui/`. Runs via `npm run start` (currently active).
* **Backend (FastAPI)**: Located in `snakey-api/`. Runs via `uvicorn main:app` on port 8000.
* **Database (SQLite)**: A local `tournament.db` file managed by SQLAlchemy models (`Strategy`, `MatchResult`).

## 2. Vibe Code Mode (Interactive Recording)

The system now features an interactive mode to capture human gameplay "vibes" and convert them into Python heuristics.

* **UI Flow**: The player clicks **"🎥 Start Vibe Recording"**. The Python Strategy text area clears out and displays a recording header.
* **Live Streaming**: As the player clicks cells on the grid, the frontend (`snakey.ts`) appends the move history directly into the text area as Python comments (e.g., `# Turn 1: Maker played at (10, 10)`).
* **LLM Trigger**: Once the game naturally ends (win/loss), or if the player clicks **"🛑 Give Up & Generate"**, the recorded trajectory is POSTed to `/api/generate-vibe-code`.
* **Iterative Strategy**: If the **"Include previous strategy in prompt"** checkbox is ticked, the first 20 lines of the code currently in the editor are attached to the prompt, allowing the LLM to refine an existing script rather than starting from scratch.
* **Mock LLM**: Currently, the backend mocks a Gemma 2B response that returns a basic proximity-based strategy script.

## 3. Tournament Engine & Hall of Fame

* **Submission**: Users can enter a name and click **"🏆 Submit to Tournament"** to save their Python strategy to the SQLite database.
* **Background Worker**: `main.py` runs a continuous `asyncio` task (`tournament_worker`) that wakes up every 5 seconds, selects two random strategies from the database, and pits them against each other.
* **Docker Sandboxing**: To prevent arbitrary code execution vulnerabilities, the tournament worker relies on `sandbox.py`, which writes the two scripts to a temp directory and evaluates them using `docker run python:3.10-slim`.
* **Live Leaderboard**: The Angular UI polls `/api/leaderboard` every 5 seconds. The Hall of Fame dynamically updates ELO rankings based on the background match results.

## 4. Testing Objectives for the Next Agent

If you are the next AI agent analyzing screenshots and debugging, please focus on:
1. **UI Layout & Glitches**: Ensure the new recording buttons, checkboxes, and the Hall of Fame panel render correctly without overlapping or breaking the flex layouts.
2. **State Management**: Verify that the "Start Vibe Recording" properly clears previous state, and that the Python text area correctly displays the live streaming comments.
3. **Backend Logs**: If any strategies fail to evaluate, inspect the Docker sandbox logs or Uvicorn output for syntax errors or timeouts (max 5 seconds per match).
4. **Elo Updates**: Ensure the leaderboard numbers are shifting dynamically and correctly sorting by highest Elo.

---
*End of Handover*
