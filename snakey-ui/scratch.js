const { chromium } = require('playwright');
(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage();
  page.on('console', msg => console.log('PAGE LOG:', msg.text()));
  await page.goto('http://localhost:4200/');
  await page.locator('#game-mode').selectOption('ai_custom_vs_ai_optimal');
  const badStrategy = `def get_move(board_state, current_turn):
    import random
    occupied = set(f"{c['x']},{c['y']}" for c in board_state)
    valid = [{"x":x, "y":y} for x in range(20) for y in range(20) if f"{x},{y}" not in occupied]
    return random.choice(valid) if valid else None
`;
  await page.locator('textarea').fill(badStrategy);
  await page.getByRole('button', { name: /Start Auto-Play Match/ }).click();
  await page.locator('#win-status').waitFor({ state: 'visible', timeout: 60000 }).catch(e => console.log('timeout waiting for win-status part 1'));
  const winner1 = await page.locator('#winner-name').textContent();
  console.log('PART 1 WINNER IS:', winner1);

  await page.locator('#shape-selector').selectOption('Monomino');
  
  const goodStrategy = `def get_move(board_state, current_turn):
    valid = [{"x":x, "y":y} for x in range(20) for y in range(20) if f"{x},{y}" not in board_state]
    return valid[0] if valid else None
`;
  await page.locator('textarea').fill(goodStrategy);
  await page.getByRole('button', { name: /Start Auto-Play Match/ }).click();

  await page.locator('#win-status').waitFor({ state: 'visible', timeout: 60000 }).catch(e => console.log('timeout waiting for win-status part 2'));
  const winner2 = await page.locator('#winner-name').textContent();
  console.log('PART 2 WINNER IS:', winner2);
  
  await browser.close();
})();
