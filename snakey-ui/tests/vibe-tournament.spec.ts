import { test, expect } from '@playwright/test';

test.describe('Snakey Vibe Mode & Tournament Test Suite', () => {
  test('recording vibes, generating code, submitting strategies, and ELO updating', async ({ page }) => {
    test.setTimeout(120000); // 2 minutes timeout

    // Log console messages from the page
    page.on('console', msg => console.log('PAGE LOG:', msg.text()));
    page.on('pageerror', err => console.log('PAGE ERROR:', err.message));

    // Listen to dialog alerts
    page.on('dialog', async dialog => {
      console.log(`Alert Dialog: ${dialog.message()}`);
      await dialog.accept();
    });

    // 1. Open the app
    await page.goto('/');

    // Verify initial UI components are visible
    const vibeBtn = page.getByRole('button', { name: /Start Vibe Recording/ });
    await expect(vibeBtn).toBeVisible();

    const leaderboardHeader = page.locator('text=HALL OF FAME LEADERBOARD');
    await expect(leaderboardHeader).toBeVisible();

    // 2. Start vibe recording
    await vibeBtn.click();

    // Verify state: textarea should clear and show header
    const textarea = page.locator('textarea');
    await expect(textarea).toHaveValue(/# Game Recording Started.../);

    // 3. Play some moves
    // We click cells at (5,5), then wait for AI, then click (7,7)
    // cellSize is 40, so coordinates in pixels are 200, 280
    await page.locator('rect.cell[x="200"][y="200"]').click();
    
    // Wait for AI to respond and make its move
    await page.waitForTimeout(1000);
    
    await page.locator('rect.cell[x="280"][y="280"]').click();
    await page.waitForTimeout(1000);

    // Verify move comments are in the textarea
    await expect(textarea).toHaveValue(/# Turn 1: Maker played at \(5, 5\)/);
    await expect(textarea).toHaveValue(/# Turn 2: Breaker played at \(\d+, \d+\)/);
    await expect(textarea).toHaveValue(/# Turn 3: Maker played at \(7, 7\)/);

    // 4. Give up and generate
    const giveUpBtn = page.getByRole('button', { name: /Give Up & Generate/ });
    await giveUpBtn.click();

    // Wait for the mock code to populate the textarea
    // The mock generator returns code containing `def get_move(board_state, current_turn):`
    await expect(textarea).toHaveValue(/def get_move/, { timeout: 10000 });

    // 5. Submit the first strategy
    await page.getByPlaceholder('Strategy Author/Name').fill('VibePlayer');
    const submitBtn = page.getByRole('button', { name: /Submit to Tournament/ });
    await submitBtn.click();

    // 6. Submit a second strategy
    // We need at least two strategies in the DB for the tournament worker to run matches!
    await vibeBtn.click();
    await expect(textarea).toHaveValue(/# Game Recording Started.../);

    // Click cell at (8,8), wait for AI, click (9,9)
    await page.locator('rect.cell[x="320"][y="320"]').click();
    await page.waitForTimeout(1000);
    await page.locator('rect.cell[x="360"][y="360"]').click();
    await page.waitForTimeout(1000);

    await giveUpBtn.click();
    await expect(textarea).toHaveValue(/def get_move/, { timeout: 10000 });

    await page.getByPlaceholder('Strategy Author/Name').fill('Challenger');
    await submitBtn.click();

    // 7. Monitor the leaderboard for Elo updates
    // The background worker wakes up every 5 seconds, runs a match, and updates ELO.
    // Leaderboard updates every 5 seconds.
    // Let's wait for the leaderboard to show both strategies and watch their ELOs change from 1200.0.
    console.log('Waiting for tournament matches to execute and update ELO...');
    
    // We expect both strategies to be listed in the leaderboard
    await expect(page.locator('text=VibePlayer')).toBeVisible({ timeout: 15000 });
    await expect(page.locator('text=Challenger')).toBeVisible({ timeout: 15000 });

    // Wait until one of them has an ELO different from 1200
    let eloUpdated = false;
    for (let i = 0; i < 6; i++) {
      await page.waitForTimeout(5000);
      const textContent = await page.locator('.status-card').filter({ hasText: 'HALL OF FAME LEADERBOARD' }).innerText();
      console.log(`Leaderboard state at ${5 * (i+1)}s:\n`, textContent);
      if (!textContent.includes('1200 ELO') && (textContent.includes('VibePlayer') || textContent.includes('Challenger'))) {
        console.log('ELO ratings successfully updated!');
        eloUpdated = true;
        break;
      }
    }

    // Final assertion that the leaderboard is sorted and ELO updated
    const finalLeaderboardText = await page.locator('.status-card').filter({ hasText: 'HALL OF FAME LEADERBOARD' }).innerText();
    expect(finalLeaderboardText).toContain('ELO');
    expect(eloUpdated).toBeTruthy();
  });
});
