# Instructions

- Following Playwright test failed.
- Explain why, be concise, respect Playwright best practices.
- Provide a snippet of code with the fix, if possible.

# Test info

- Name: strategy-autoplay.spec.ts >> Snakey Auto-Play Test Suite >> User runs auto-play with default strategy (loses), edits strategy/shape (wins)
- Location: tests/strategy-autoplay.spec.ts:4:7

# Error details

```
Error: expect(locator).toHaveText(expected) failed

Locator:  locator('#winner-name')
Expected: "BREAKER WINS!"
Received: " MAKER WINS!"
Timeout:  10000ms

Call log:
  - Expect "toHaveText" with timeout 10000ms
  - waiting for locator('#winner-name')
    24 × locator resolved to <div id="winner-name" class="status-value" _ngcontent-ng-c3711817607=""> MAKER WINS!</div>
       - unexpected value " MAKER WINS!"

```

```yaml
- text: MAKER WINS!
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
  27 |     await expect(page.locator('#win-status')).toBeVisible({ timeout: 60000 });
> 28 |     await expect(page.locator('#winner-name')).toHaveText('BREAKER WINS!', { timeout: 10000 });
     |                                                ^ Error: expect(locator).toHaveText(expected) failed
  29 | 
  30 |     // 6. The student edits the strategy!
  31 |     // To guarantee a win against the Optimal AI in a simple test, 
  32 |     // we'll change the target shape to "Monomino". The Maker wins if they place ANY piece.
  33 |     // The Python strategy will place a piece and win instantly.
  34 |     await page.locator('#shape-selector').selectOption('Monomino');
  35 |     
  36 |     // Changing the shape should reset the game. Let's make sure the win-status is hidden.
  37 |     await expect(page.locator('#win-status')).toBeHidden();
  38 | 
  39 |     // 6. Run auto-play again with the new conditions
  40 |     await autoPlayBtn.click();
  41 | 
  42 |     // 7. Assert Maker wins!
  43 |     await expect(page.locator('#win-status')).toBeVisible({ timeout: 5000 });
  44 |     await expect(page.locator('#winner-name')).toHaveText('MAKER WINS!', { timeout: 5000 });
  45 |   });
  46 | });
  47 | 
```