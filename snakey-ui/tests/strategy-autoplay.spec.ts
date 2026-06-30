import { test, expect } from '@playwright/test';

test.describe('Snakey Auto-Play Test Suite', () => {
  test('User runs auto-play with default strategy (loses), edits strategy/shape (wins)', async ({ page }) => {
    test.setTimeout(120000); // 2 minutes

    // 1. Open the app
    await page.goto('/');

    // 2. Select Custom Python vs AI Optimal game mode
    await page.locator('#game-mode').selectOption('ai_custom_vs_ai_optimal');

    // 3. Inject a terrible random strategy so Maker loses
    const badStrategy = `def get_move(board_state, current_turn):
    import random
    occupied = set(f"{c['x']},{c['y']}" for c in board_state)
    valid = [{"x":x, "y":y} for x in range(20) for y in range(20) if f"{x},{y}" not in occupied]
    return random.choice(valid) if valid else None
`;
    await page.locator('textarea').fill(badStrategy);

    // 4. Click "Start Auto-Play Match"
    const autoPlayBtn = page.getByRole('button', { name: /Start Auto-Play Match/ });
    await autoPlayBtn.click();

    // 5. Wait for game over and assert loss (Breaker wins)
    await expect(page.locator('#win-status')).toBeVisible({ timeout: 60000 });
    await expect(page.locator('#winner-name')).toHaveText('BREAKER WINS!', { timeout: 10000 });

    // 6. The student edits the strategy!
    // To guarantee a win against the Optimal AI in a simple test, 
    // we'll change the target shape to "Monomino". The Maker wins if they place ANY piece.
    // The Python strategy will place a piece and win instantly.
    const goodStrategy = `def get_move(board_state, current_turn):
    valid = [{"x":x, "y":y} for x in range(20) for y in range(20) if f"{x},{y}" not in board_state]
    return valid[0] if valid else None
`;
    await page.locator('textarea').fill(goodStrategy);
    
    // Changing the shape will reset the game.
    await page.locator('#shape-selector').selectOption('Monomino');

    // 6. Run auto-play again with the new conditions
    await autoPlayBtn.click();

    // 7. Assert Maker wins!
    await expect(page.locator('#win-status')).toBeVisible({ timeout: 5000 });
    await expect(page.locator('#winner-name')).toHaveText('MAKER WINS!', { timeout: 5000 });
  });
});
