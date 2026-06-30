# Instructions

- Following Playwright test failed.
- Explain why, be concise, respect Playwright best practices.
- Provide a snippet of code with the fix, if possible.

# Test info

- Name: strategy-autoplay.spec.ts >> Snakey Auto-Play Test Suite >> User runs auto-play with default strategy (loses), edits strategy/shape (wins)
- Location: tests/strategy-autoplay.spec.ts:4:7

# Error details

```
Error: expect(locator).toBeVisible() failed

Locator:  locator('#win-status')
Expected: visible
Received: hidden
Timeout:  60000ms

Call log:
  - Expect "toBeVisible" with timeout 60000ms
  - waiting for locator('#win-status')
    122 × locator resolved to <div id="win-status" class="status-card" _ngcontent-ng-c1029626530="">…</div>
        - unexpected value "hidden"

```

```yaml
- banner:
  - heading "SNAKEY" [level=1]
  - button "Back"
  - paragraph: Harary's Polyomino Achievement Game
  - paragraph:
    - text: Inspired by
    - link "Numberphile & Sophie Maclean":
      - /url: https://www.youtube.com/watch?v=ouTE-GYGIA8
- main:
  - heading "Target Polyomino" [level=3]
  - combobox:
    - option "Monomino (n=1)"
    - option "Domino (n=2)"
    - option "Straight Tromino (n=3)"
    - option "L-Tromino (n=3)"
    - option "Straight Tetromino (n=4)"
    - option "T-Tetromino (n=4)"
    - option "L-Tetromino (n=4)"
    - option "S-Tetromino (n=4)"
    - option "Boxy (n=4, Loser!)"
    - option "F-Pentomino (n=5)" [selected]
    - option "Snakey Hexomino (n=6, Unsolved)"
  - heading "Game Mode" [level=3]
  - combobox:
    - option "Player vs Player"
    - option "Player (Maker) vs AI (Random)"
    - option "Player (Maker) vs AI (Optimal)"
    - option "Player (Maker) vs AI (Custom Python)"
    - option "AI (Random) vs Player (Breaker)"
    - option "AI (Optimal) vs Player (Breaker)"
    - option "AI (Custom Python) vs Player (Breaker)"
    - option "AI (Custom Python) vs AI (Optimal)" [selected]
    - option "AI (Optimal) vs AI (Custom Python)"
    - option "AI (Optimal) vs AI (Optimal)"
  - heading "Game Rules" [level=3]
  - paragraph:
    - strong: Maker
    - text: tries to build the target shape.
    - strong: Breaker
    - text: tries to prevent it. Turns alternate. Maker goes first.
  - heading "Maker Color" [level=3]
  - textbox "Choose Maker Color":
    - /placeholder: "e.g. #99FF00 or yellow"
    - text: "#FFA500"
  - heading "Breaker Color" [level=3]
  - textbox "Choose Breaker Color":
    - /placeholder: "e.g. red or #FF0000"
    - text: "#FF0000"
  - button "🏆 START COMPETE MODE"
  - button "Reset Game"
  - button "🏳️ Surrender"
  - button "Show Paving Strategy"
  - text: "Current Turn Maker TARGET: Pentomino F"
  - img
  - text: 🏆 HALL OF FAME LEADERBOARD Refresh No strategies yet 💡 Click a row to load its code into the editor! ⚡ LIVE MATCH FEED Waiting for matches...
  - heading "Python AI Strategy" [level=3]
  - button "Show API Info"
  - textbox: "def get_move(board_state, current_turn): import random occupied = set(f\"{c['x']},{c['y']}\" for c in board_state) valid = [{\"x\":x, \"y\":y} for x in range(20) for y in range(20) if f\"{x},{y}\" not in occupied] return random.choice(valid) if valid else None"
  - button "Test Strategy"
  - button "🎥 Start Vibe Recording"
  - checkbox "Include previous strategy in prompt"
  - text: Include previous strategy in prompt
  - heading "Tournament Submission" [level=4]
  - textbox "Strategy Author/Name"
  - button "🏆 Submit to Tournament"
  - button "Stop Auto-Play"
  - text: "--- Live Execution Logs ---"
```

# Test source

```ts
  1  | import { test, expect } from '@playwright/test';
  2  | 
  3  | test.describe('Snakey Auto-Play Test Suite', () => {
  4  |   test('User runs auto-play with default strategy (loses), edits strategy/shape (wins)', async ({ page }) => {
  5  |     test.setTimeout(120000); // 2 minutes
  6  | 
  7  |     // 1. Open the app
  8  |     await page.goto('/');
  9  | 
  10 |     // 2. Select Custom Python vs AI Optimal game mode
  11 |     await page.locator('#game-mode').selectOption('ai_custom_vs_ai_optimal');
  12 | 
  13 |     // 3. Inject a terrible random strategy so Maker loses
  14 |     const badStrategy = `def get_move(board_state, current_turn):
  15 |     import random
  16 |     occupied = set(f"{c['x']},{c['y']}" for c in board_state)
  17 |     valid = [{"x":x, "y":y} for x in range(20) for y in range(20) if f"{x},{y}" not in occupied]
  18 |     return random.choice(valid) if valid else None
  19 | `;
  20 |     await page.locator('textarea').fill(badStrategy);
  21 | 
  22 |     // 4. Click "Start Auto-Play Match"
  23 |     const autoPlayBtn = page.getByRole('button', { name: /Start Auto-Play Match/ });
  24 |     await autoPlayBtn.click();
  25 | 
  26 |     // 5. Wait for game over and assert loss (Breaker wins)
> 27 |     await expect(page.locator('#win-status')).toBeVisible({ timeout: 60000 });
     |                                               ^ Error: expect(locator).toBeVisible() failed
  28 |     await expect(page.locator('#winner-name')).toHaveText('BREAKER WINS!', { timeout: 10000 });
  29 | 
  30 |     // 6. The student edits the strategy!
  31 |     // To guarantee a win against the Optimal AI in a simple test, 
  32 |     // we'll change the target shape to "Monomino". The Maker wins if they place ANY piece.
  33 |     // The Python strategy will place a piece and win instantly.
  34 |     const goodStrategy = `def get_move(board_state, current_turn):
  35 |     valid = [{"x":x, "y":y} for x in range(20) for y in range(20) if f"{x},{y}" not in board_state]
  36 |     return valid[0] if valid else None
  37 | `;
  38 |     await page.locator('textarea').fill(goodStrategy);
  39 |     
  40 |     // Changing the shape will reset the game.
  41 |     await page.locator('#shape-selector').selectOption('Monomino');
  42 | 
  43 |     // 6. Run auto-play again with the new conditions
  44 |     await autoPlayBtn.click();
  45 | 
  46 |     // 7. Assert Maker wins!
  47 |     await expect(page.locator('#win-status')).toBeVisible({ timeout: 5000 });
  48 |     await expect(page.locator('#winner-name')).toHaveText('MAKER WINS!', { timeout: 5000 });
  49 |   });
  50 | });
  51 | 
```