// --- CRYPTO CONFIG & ARITHMETIC ---
const K = [1, 2, 3, 0];
const W = [0, 1, 2, 3];
const regNames = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];
const valueLabels = ['00', '01', '10', '11'];
const valueColors = ['#334155', '#0ea5e9', '#f97316', '#a855f7'];

// Game State
let isGameMode = false;
let gameLevel = 1;
let lives = 3;
let totalScore = 0;
let gameOver = false;
let levelComplete = false;
let gameBeaten = false;

let hashesUsed = 0;
let hashBudget = 10;
let wastedHashesList = [];

// Interactive State
let inputState = [0, 0, 0, 0, 0, 0, 0, 0];
let gridStates = [];

// Fractal Grid State
const fractalCanvas = document.getElementById('fractal-canvas');
const fractalPanel = document.getElementById('fractal-panel');
const fractalTooltip = document.getElementById('fractal-tooltip');
let cycleLengths = null;
let cycleLengthsRoundCount = 0;
let canvasContext = null;
let blinkState = true;
let blinkInterval = null;

// DOM Elements
const btnGameMode = document.getElementById('btn-game-mode');
const btnReset = document.getElementById('btn-reset');
const btnHash = document.getElementById('btn-hash');
const btnNextLevel = document.getElementById('btn-next-level');
const btnRestart = document.getElementById('btn-restart');
const btnVictoryRestart = document.getElementById('btn-victory-restart');

const panelNormal = document.getElementById('panel-normal');
const panelGame = document.getElementById('panel-game');

const hudLevel = document.getElementById('hud-level');
const hudLives = document.getElementById('hud-lives');
const hudTargetDesc = document.getElementById('hud-target-desc');
const hudProb = document.getElementById('hud-prob');
const hudScore = document.getElementById('hud-score');
const hudHashes = document.getElementById('hud-hashes');
const hudWasteCount = document.getElementById('hud-waste-count');
const hudWasteBin = document.getElementById('hud-waste-bin');

const modalSuccess = document.getElementById('modal-success');
const modalSuccessDesc = document.getElementById('modal-success-desc');
const modalGameover = document.getElementById('modal-gameover');
const modalVictory = document.getElementById('modal-victory');
const modalFinalScore = document.getElementById('modal-final-score');

const wiresGroup = document.getElementById('wires-group');
const nodesGroup = document.getElementById('nodes-group');

// --- CRYPTO ROUND FUNCTIONS (Fin 4) ---
function xor(x, y) { return x ^ y; }
function and(x, y) { return x & y; }
function not(x) { return 3 - x; }

function rot1(x) {
  if (x === 1) return 2;
  if (x === 2) return 1;
  return x;
}

function ch(e, f, g) {
  return xor(and(e, f), and(not(e), g));
}

function maj(a, b, c) {
  return xor(xor(and(a, b), and(a, c)), and(b, c));
}

function sig0(a) { return xor(rot1(a), a); }
function sig1(e) { return xor(rot1(e), e); }

function computeRound(state, rKey, rWord) {
  const [a, b, c, d, e, f, g, h] = state;
  const T1 = (h + sig1(e) + ch(e, f, g) + rKey + rWord) % 4;
  const T2 = (sig0(a) + maj(a, b, c)) % 4;
  
  return [
    (T1 + T2) % 4,
    a,
    b,
    c,
    (d + T1) % 4,
    e,
    f,
    g
  ];
}

function getNumRounds() {
  if (gameLevel === 1) return 1;
  if (gameLevel === 2) return 2;
  if (gameLevel === 3) return 3;
  return 4;
}

function stateToInt(state) {
  return (state[0] << 14) | (state[1] << 12) | (state[2] << 10) | (state[3] << 8) |
         (state[4] << 6) | (state[5] << 4) | (state[6] << 2) | state[7];
}

function intToState(val) {
  return [
    (val >> 14) & 3,
    (val >> 12) & 3,
    (val >> 10) & 3,
    (val >> 8) & 3,
    (val >> 6) & 3,
    (val >> 4) & 3,
    (val >> 2) & 3,
    val & 3
  ];
}

function nonceToState(nonceStr) {
  const state = [];
  for (let i = 0; i < 8; i++) {
    const label = nonceStr.substring(i * 2, i * 2 + 2);
    state.push(valueLabels.indexOf(label));
  }
  return state;
}

function recomputeAll() {
  const numRounds = getNumRounds();
  gridStates = [ [...inputState] ];
  let current = [...inputState];
  for (let r = 0; r < numRounds; r++) {
    current = computeRound(current, K[r], W[r]);
    gridStates.push(current);
  }
  updateDiagram();
  if (gameLevel >= 2) {
    drawFractal();
  }
}

// --- DIAGRAM DRAWING (SVG) ---
function getRegisterX(colIndex) {
  return 75 + colIndex * 90;
}

function getRegisterY(rowIndex) {
  return 60 + rowIndex * 110;
}

function initDiagram() {
  const numRounds = getNumRounds();
  const svg = document.getElementById('wiring-svg');
  if (svg) {
    const computedHeight = 120 + numRounds * 110;
    svg.setAttribute('height', computedHeight);
    svg.setAttribute('viewBox', `0 0 800 ${computedHeight}`);
  }

  // Clear groups
  wiresGroup.innerHTML = '';
  nodesGroup.innerHTML = '';

  // 1. Draw Wires (Links between rows)
  for (let r = 0; r < numRounds; r++) {
    for (let c = 0; c < 8; c++) {
      let targetCol = c;
      let isFeedback = false;

      // Define SHA wiring mapping
      if (c === 0) { targetCol = 1; } // a -> b
      else if (c === 1) { targetCol = 2; } // b -> c
      else if (c === 2) { targetCol = 3; } // c -> d
      else if (c === 3) { targetCol = 4; isFeedback = true; } // d -> e (addition feedback)
      else if (c === 4) { targetCol = 5; } // e -> f
      else if (c === 5) { targetCol = 6; } // f -> g
      else if (c === 6) { targetCol = 7; } // g -> h
      else if (c === 7) { targetCol = 0; isFeedback = true; } // h -> a (T1 feedback)

      const line = document.createElementNS("http://www.w3.org/2000/svg", "path");
      line.setAttribute("id", `wire-${r}-${c}`);
      line.setAttribute("class", isFeedback ? "wire-line wire-feedback" : "wire-line");
      
      const x1 = getRegisterX(c);
      const y1 = getRegisterY(r) + 16;
      const x2 = getRegisterX(targetCol);
      const y2 = getRegisterY(r + 1) - 16;
      
      const controlY = y1 + 55;
      const dPath = `M ${x1} ${y1} C ${x1} ${controlY}, ${x2} ${controlY}, ${x2} ${y2}`;
      
      line.setAttribute("d", dPath);
      line.setAttribute("stroke", "#223");
      line.setAttribute("stroke-width", isFeedback ? "3" : "1.5");
      line.setAttribute("opacity", "0.4");
      
      wiresGroup.appendChild(line);
    }
  }

  // 2. Draw Row Labels
  for (let r = 0; r <= numRounds; r++) {
    const text = document.createElementNS("http://www.w3.org/2000/svg", "text");
    text.setAttribute("x", "12");
    text.setAttribute("y", getRegisterY(r) + 5);
    text.setAttribute("class", "row-label");
    text.textContent = r === 0 ? "Input (R0)" : r === numRounds ? `Hash (R${numRounds})` : `Round ${r}`;
    nodesGroup.appendChild(text);
  }

  // 3. Draw Nodes (Registers)
  for (let r = 0; r <= numRounds; r++) {
    for (let c = 0; c < 8; c++) {
      const g = document.createElementNS("http://www.w3.org/2000/svg", "g");
      g.setAttribute("transform", `translate(${getRegisterX(c)}, ${getRegisterY(r)})`);
      
      const circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
      circle.setAttribute("id", `node-circle-${r}-${c}`);
      circle.setAttribute("class", "svg-node");
      circle.setAttribute("r", "14");
      circle.setAttribute("fill", valueColors[0]);
      circle.setAttribute("stroke", "#ffffff");
      circle.setAttribute("stroke-width", "1");

      if (r === 0) {
        circle.addEventListener("click", () => cycleInputRegister(c));
      }

      const text = document.createElementNS("http://www.w3.org/2000/svg", "text");
      text.setAttribute("id", `node-text-${r}-${c}`);
      text.setAttribute("class", "node-text");
      text.setAttribute("text-anchor", "middle");
      text.setAttribute("alignment-baseline", "middle");
      text.setAttribute("dy", "3");
      text.textContent = regNames[c].toUpperCase() + ":00";

      g.appendChild(circle);
      g.appendChild(text);
      nodesGroup.appendChild(g);
    }
  }
}

function updateDiagram() {
  const numRounds = getNumRounds();
  for (let r = 0; r <= numRounds; r++) {
    const rowValues = gridStates[r];
    for (let c = 0; c < 8; c++) {
      const val = rowValues[c];
      const color = valueColors[val];
      const label = valueLabels[val];

      const circle = document.getElementById(`node-circle-${r}-${c}`);
      const text = document.getElementById(`node-text-${r}-${c}`);

      if (circle) {
        circle.setAttribute("fill", color);
        // Highlight active target nodes in green/gold when game mode is won
        if (levelComplete && r === numRounds && isGameNodeTarget(c)) {
          circle.setAttribute("stroke", "#22c55e");
          circle.setAttribute("stroke-width", "3");
        } else {
          circle.setAttribute("stroke", r === 0 ? "#ffffff" : "#445");
          circle.setAttribute("stroke-width", r === 0 ? "2" : "1");
        }
      }
      if (text) {
        text.textContent = `${regNames[c].toUpperCase()}:${label}`;
      }

      // Update wire color that flows from this node
      if (r < numRounds) {
        const wire = document.getElementById(`wire-${r}-${c}`);
        if (wire) {
          wire.setAttribute("stroke", color);
          wire.setAttribute("opacity", val === 0 ? "0.3" : "0.85");
          wire.setAttribute("stroke-width", val > 0 ? "2.5" : "1.5");
        }
      }
    }
  }
}

function isGameNodeTarget(colIndex) {
  if (gameLevel <= 4) return colIndex === 0;
  if (gameLevel === 5) return colIndex === 0 || colIndex === 1;
  if (gameLevel === 6) return colIndex === 0 || colIndex === 1 || colIndex === 4;
  return colIndex === 0 || colIndex === 1 || colIndex === 4 || colIndex === 5; // Level 7 and 8
}

function cycleInputRegister(colIndex) {
  if (gameOver || levelComplete || gameBeaten) return;
  inputState[colIndex] = (inputState[colIndex] + 1) % 4;
  recomputeAll();
}

// --- GAME LOGIC ---
function toggleGameMode() {
  isGameMode = !isGameMode;
  if (isGameMode) {
    btnGameMode.textContent = "🚪 Exit Game Mode";
    btnGameMode.classList.remove("primary-btn");
    btnGameMode.classList.add("secondary-btn");
    panelNormal.classList.add("hidden");
    panelGame.classList.remove("hidden");
    startGame();
  } else {
    btnGameMode.textContent = "🎮 Enter Game Mode";
    btnGameMode.classList.remove("secondary-btn");
    btnGameMode.classList.add("primary-btn");
    panelNormal.classList.remove("hidden");
    panelGame.classList.add("hidden");
    exitGame();
    initDiagram();
    recomputeAll();
  }
}

function startGame() {
  gameLevel = 1;
  totalScore = 0;
  gameBeaten = false;
  resetLevelState();
}

function exitGame() {
  inputState = [0, 0, 0, 0, 0, 0, 0, 0];
  recomputeAll();
}

function resetLevelState() {
  lives = 3;
  gameOver = false;
  levelComplete = false;
  showMiningSuccess = false;
  hashesUsed = 0;
  wastedHashesList = [];
  
  if (gameLevel === 1) hashBudget = 8;
  else if (gameLevel === 2) hashBudget = 8;
  else if (gameLevel === 3) hashBudget = 12;
  else if (gameLevel === 4) hashBudget = 16;
  else if (gameLevel === 5) hashBudget = 24;
  else if (gameLevel === 6) hashBudget = 32;
  else if (gameLevel === 7) hashBudget = 48;
  else hashBudget = 64; // Level 8

  inputState = [0, 0, 0, 0, 0, 0, 0, 0];
  
  // Synchronize Level Selector buttons active class
  const buttons = document.querySelectorAll('.level-btn');
  buttons.forEach(btn => {
    if (parseInt(btn.getAttribute('data-level')) === gameLevel) {
      btn.classList.add('active');
    } else {
      btn.classList.remove('active');
    }
  });

  // Fractal Panel Visibility and Blink timer
  if (blinkInterval) {
    clearInterval(blinkInterval);
    blinkInterval = null;
  }

  if (gameLevel >= 2) {
    if (fractalPanel) fractalPanel.classList.remove('hidden');
    blinkInterval = setInterval(() => {
      blinkState = !blinkState;
      drawFractal();
    }, 500);
  } else {
    if (fractalPanel) fractalPanel.classList.add('hidden');
  }

  initDiagram();
  updateHUD();
  recomputeAll();
  
  modalSuccess.classList.add("hidden");
  modalGameover.classList.add("hidden");
  modalVictory.classList.add("hidden");
}

function updateHUD() {
  hudLevel.textContent = gameLevel;
  hudLives.textContent = '❤️'.repeat(lives) + '💀'.repeat(3 - lives);
  hudScore.textContent = totalScore;
  hudHashes.textContent = `${hashesUsed} / ${hashBudget}`;
  
  // Target Description and probabilities
  let desc = "";
  let prob = "";
  if (gameLevel === 1) {
    desc = "Mine a block in <strong>1 Round</strong> where register <strong>a</strong> is <strong>00</strong>";
    prob = "25.0%";
  } else if (gameLevel === 2) {
    desc = "Mine a block in <strong>2 Rounds</strong> where register <strong>a</strong> is <strong>00</strong> (avalanche effect starts!)";
    prob = "25.0%";
  } else if (gameLevel === 3) {
    desc = "Mine a block in <strong>3 Rounds</strong> where register <strong>a</strong> is <strong>00</strong>";
    prob = "25.0%";
  } else if (gameLevel === 4) {
    desc = "Mine a block in <strong>4 Rounds</strong> where register <strong>a</strong> is <strong>00</strong> (full 4-round mixing!)";
    prob = "25.0%";
  } else if (gameLevel === 5) {
    desc = "Mine a block in <strong>4 Rounds</strong> where registers <strong>a, b</strong> are both <strong>00</strong>";
    prob = "6.25%";
  } else if (gameLevel === 6) {
    desc = "Mine a block in <strong>4 Rounds</strong> where registers <strong>a, b, e</strong> are all <strong>00</strong>";
    prob = "1.56%";
  } else if (gameLevel === 7) {
    desc = "Mine a block in <strong>4 Rounds</strong> where registers <strong>a, b, e, f</strong> are all <strong>00</strong>";
    prob = "0.39%";
  } else {
    desc = "Explore the state space! Mine a block where registers <strong>a, b, e</strong> are all <strong>00</strong>";
    prob = "1.56%";
  }
  
  hudTargetDesc.innerHTML = desc;
  hudProb.textContent = prob;
  
  // Wasted list
  hudWasteCount.textContent = `${wastedHashesList.length} wasted hashes`;
  hudWasteBin.innerHTML = '';
  wastedHashesList.forEach(nonce => {
    const span = document.createElement("span");
    span.className = "nonce-tag";
    span.textContent = nonce;
    hudWasteBin.appendChild(span);
  });
}

function hashState() {
  if (gameOver || levelComplete || gameBeaten) return;

  hashesUsed++;
  const nonceString = inputState.map(x => valueLabels[x]).join('');
  const isTargetHit = checkTargetCondition();

  if (isTargetHit) {
    levelComplete = true;
    const efficiencyBonus = Math.max(1, hashBudget - hashesUsed);
    totalScore += efficiencyBonus + (gameLevel * 5);
    
    modalSuccessDesc.innerHTML = `Block mined on attempt <strong>${hashesUsed}</strong>!<br>Efficiency Bonus: <strong>+${efficiencyBonus} pts</strong>`;
    modalSuccess.classList.remove("hidden");
    
    // Add success glow to output row
    recomputeAll();
  } else {
    if (!wastedHashesList.includes(nonceString)) {
      wastedHashesList.push(nonceString);
    }
    
    if (hashesUsed >= hashBudget) {
      lives--;
      if (lives <= 0) {
        gameOver = true;
        modalGameover.classList.remove("hidden");
      } else {
        alert("Mining pool Timeout! Re-routing hash power. Lost a life.");
        hashesUsed = 0;
        wastedHashesList = [];
      }
    }
    updateHUD();
  }
}

// --- FRACTAL GRID DRAWING & LOGIC ---
const finalFractalImg = new Image();
finalFractalImg.src = 'fractal_final.png';
finalFractalImg.onload = () => {
  if (gameLevel >= 2) drawFractal();
};

function getCycleColorRGB(length) {
  if (length === 1) return [255, 255, 255]; // fixed point — white glow
  if (length <= 4) return [251, 191, 36];   // gold — tiny cycles
  if (length <= 50) return [249, 115, 22];  // orange — short cycles
  if (length <= 500) return [14, 165, 233]; // cyan — medium cycles
  if (length <= 15000) return [168, 85, 247]; // purple — large orbits
  return [49, 46, 129];                     // indigo — giant orbits
}

function runNRounds(state, n) {
  let curr = [...state];
  for (let r = 0; r < n; r++) {
    curr = computeRound(curr, K[r % 4], W[r % 4]);
  }
  return curr;
}

function computeAllCycleLengths(numRounds) {
  if (cycleLengths && cycleLengthsRoundCount === numRounds) return;
  cycleLengths = new Int32Array(65536);
  cycleLengthsRoundCount = numRounds;
  const visited = new Uint8Array(65536);
  
  for (let i = 0; i < 65536; i++) {
    if (visited[i]) continue;
    
    const path = [];
    let curr = i;
    while (!visited[curr]) {
      visited[curr] = 1;
      path.push(curr);
      curr = stateToInt(runNRounds(intToState(curr), numRounds));
    }
    
    const len = path.length;
    for (let j = 0; j < len; j++) {
      cycleLengths[path[j]] = len;
    }
  }
}

function drawFractal() {
  if (gameLevel < 2) return;
  
  if (!canvasContext) {
    canvasContext = fractalCanvas.getContext('2d');
  }
  
  const numRounds = getNumRounds();
  computeAllCycleLengths(4); // Always display the full 4-round "crazy" fractal
  
  // 3D perspective rotation: tilted at Level 2, straightens to head-on at Level 8
  const levelRotations = [0, 0, 15, 11, 7, 5, 3, 1.5, 0];
  const rot = levelRotations[gameLevel] || 0;
  const wrapper = fractalCanvas.parentElement;
  if (wrapper) {
    wrapper.style.transform = rot > 0
      ? `perspective(600px) rotateY(${rot}deg) rotateZ(${rot * 0.3}deg)`
      : '';
    if (gameLevel >= 2 && gameLevel < 8) {
      wrapper.classList.add('emerging');
    } else {
      wrapper.classList.remove('emerging');
    }
  }
  
  // Dynamic title per level
  const titleEl = document.getElementById('fractal-title');
  const subtitleEl = document.getElementById('fractal-subtitle');
  if (titleEl) {
    if (gameLevel < 8) {
      titleEl.textContent = `4-Round State-Space Map (Preview)`;
    } else {
      titleEl.textContent = 'State-Space Fractal Map (65,536 States)';
    }
  }
  if (subtitleEl) {
    if (gameLevel === 2) {
      subtitleEl.textContent = 'The fractal is emerging... hover to explore orbit structure.';
    } else if (gameLevel < 8) {
      subtitleEl.textContent = 'Hover to inspect orbits. Click to select input state.';
    } else {
      subtitleEl.textContent = 'Hover to inspect orbits. Click to select input state and trace path.';
    }
  }
  
  // Render to a 1024x1024 canvas for ultra-sharp 3D CSS rotation
  fractalCanvas.width = 1024;
  fractalCanvas.height = 1024;
  
  const offCanvas = document.createElement('canvas');
  offCanvas.width = 256;
  offCanvas.height = 256;
  const offCtx = offCanvas.getContext('2d');
  
  const imgData = offCtx.createImageData(256, 256);
  const data = imgData.data;
  
  for (let y = 0; y < 256; y++) {
    for (let x = 0; x < 256; x++) {
      const stateVal = (x << 8) | y;
      const cycleLen = cycleLengths[stateVal];
      const rgb = getCycleColorRGB(cycleLen);
      
      const idx = (y * 256 + x) * 4;
      data[idx] = rgb[0];
      data[idx+1] = rgb[1];
      data[idx+2] = rgb[2];
      data[idx+3] = 255;
    }
  }
  
  offCtx.putImageData(imgData, 0, 0);
  
  canvasContext.imageSmoothingEnabled = false;
  canvasContext.clearRect(0, 0, 1024, 1024);
  canvasContext.drawImage(offCanvas, 0, 0, 1024, 1024);
  
  // --- BLEND THE FINAL FRACTAL IMAGE OVER THE PIXEL MAP ---
  if (finalFractalImg.complete) {
    // Opacity schedule: slowly fade in the beautiful final fractal
    const opacities = {1: 0, 2: 0.05, 3: 0.15, 4: 0.3, 5: 0.5, 6: 0.7, 7: 0.85, 8: 1.0};
    const op = opacities[gameLevel] || 0;
    
    if (op > 0) {
      // Use 'lighten' or 'screen' so it adds its beautiful neon glow onto the pixels
      canvasContext.globalCompositeOperation = 'screen';
      canvasContext.globalAlpha = op;
      // The image also needs to be drawn crisp if possible, but screen handles it well
      canvasContext.imageSmoothingEnabled = true; // smooth the nice fractal image
      canvasContext.drawImage(finalFractalImg, 0, 0, 1024, 1024);
      
      // reset
      canvasContext.globalCompositeOperation = 'source-over';
      canvasContext.globalAlpha = 1.0;
    }
  }
  
  // Highlight wasted nonces as red dots
  wastedHashesList.forEach(nonceStr => {
    const wState = nonceToState(nonceStr);
    const wInt = stateToInt(wState);
    const wx = ((wInt >> 8) & 0xFF) * 4;
    const wy = (wInt & 0xFF) * 4;
    
    canvasContext.fillStyle = '#ef4444';
    canvasContext.beginPath();
    canvasContext.arc(wx + 2, wy + 2, 8, 0, 2 * Math.PI);
    canvasContext.fill();
  });
  
  // Highlight current selected input state as blinking pixel
  const currentInt = stateToInt(inputState);
  const cx = ((currentInt >> 8) & 0xFF) * 4;
  const cy = (currentInt & 0xFF) * 4;
  
  canvasContext.fillStyle = blinkState ? '#ffffff' : '#fbbf24';
  canvasContext.beginPath();
  canvasContext.arc(cx + 2, cy + 2, 12, 0, 2 * Math.PI);
  canvasContext.fill();
  
  canvasContext.strokeStyle = '#000000';
  canvasContext.lineWidth = 4;
  canvasContext.stroke();
}

function checkTargetCondition() {
  const numRounds = getNumRounds();
  const finalState = gridStates[numRounds];
  const [a, b, c, d, e, f, g, h] = finalState;
  
  if (gameLevel <= 4) return a === 0;
  if (gameLevel === 5) return a === 0 && b === 0;
  if (gameLevel === 6) return a === 0 && b === 0 && e === 0;
  if (gameLevel === 7) return a === 0 && b === 0 && e === 0 && f === 0;
  return a === 0 && b === 0 && e === 0; // Level 8: simplified to make it fun alongside fractal grid exploration
}

function nextLevel() {
  gameLevel++;
  if (gameLevel > 8) {
    gameBeaten = true;
    modalFinalScore.textContent = totalScore;
    modalVictory.classList.remove("hidden");
    if (blinkInterval) {
      clearInterval(blinkInterval);
      blinkInterval = null;
    }
    return;
  }
  resetLevelState();
}

function saveScoreAndRestart() {
  const playerName = prompt(`🏆 HALL OF FAME 🏆\n\nYou completed the network with ${totalScore} points!\n\nEnter your initials:`);
  if (playerName && playerName.trim().length > 0) {
    // Attempt local API post
    fetch('/api/game-fame', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        name: playerName.trim().toUpperCase() + ' (BABY)',
        score: totalScore,
        level: gameLevel
      })
    })
    .then(() => alert(`Saved! ${playerName.toUpperCase()} added to the Hall of Fame.`))
    .catch(err => console.error('Failed to save score:', err));
  }
  startGame();
}

// --- INITIALIZE & EVENT LISTENERS ---
btnGameMode.addEventListener("click", () => {
  toggleGameMode();
  if (!isGameMode) {
    if (blinkInterval) {
      clearInterval(blinkInterval);
      blinkInterval = null;
    }
    if (gameLevel >= 2) {
      if (fractalPanel) fractalPanel.classList.remove('hidden');
      blinkInterval = setInterval(() => {
        blinkState = !blinkState;
        drawFractal();
      }, 500);
    } else {
      if (fractalPanel) fractalPanel.classList.add('hidden');
    }
  }
});
btnReset.addEventListener("click", () => {
  if (gameOver || levelComplete || gameBeaten) return;
  inputState = [0, 0, 0, 0, 0, 0, 0, 0];
  recomputeAll();
});
btnHash.addEventListener("click", hashState);
btnNextLevel.addEventListener("click", nextLevel);
btnRestart.addEventListener("click", resetLevelState);
btnVictoryRestart.addEventListener("click", saveScoreAndRestart);

// Level Selector buttons binding
document.getElementById('level-buttons-container').addEventListener('click', (e) => {
  const btn = e.target.closest('.level-btn');
  if (!btn) return;
  
  const targetLvl = parseInt(btn.getAttribute('data-level'));
  if (targetLvl >= 1 && targetLvl <= 8) {
    gameLevel = targetLvl;
    resetLevelState();
  }
});

// Fractal canvas hover & click bindings
if (fractalCanvas) {
  fractalCanvas.addEventListener('mousemove', (e) => {
    if (gameLevel < 2 || !cycleLengths) return;
    
    const rect = fractalCanvas.getBoundingClientRect();
    const scaleX = fractalCanvas.width / rect.width;
    const scaleY = fractalCanvas.height / rect.height;
    
    const x = Math.floor(((e.clientX - rect.left) * scaleX) / 4);
    const y = Math.floor(((e.clientY - rect.top) * scaleY) / 4);
    
    if (x >= 0 && x < 256 && y >= 0 && y < 256) {
      const val = (x << 8) | y;
      const state = intToState(val);
      const cycleLen = cycleLengths[val];
      
      const labels = state.map(v => valueLabels[v]).join(' ');
      fractalTooltip.innerHTML = `<strong>Coordinates:</strong> X:${x}, Y:${y}<br>
                                  <strong>Registers:</strong> ${labels}<br>
                                  <strong>Orbit Size:</strong> ${cycleLen.toLocaleString()} states`;
      
      // Position tooltip (with boundary checking to prevent clipping)
      let leftPos = e.clientX - rect.left + 15;
      let topPos = e.clientY - rect.top + 15;
      
      const tooltipWidth = fractalTooltip.offsetWidth || 247;
      const tooltipHeight = fractalTooltip.offsetHeight || 60;
      
      // If mouse is in the right half of the canvas, render tooltip to the left of the cursor
      if (x > 128) {
        leftPos = e.clientX - rect.left - tooltipWidth - 15;
      }
      // If mouse is near the bottom, shift tooltip upwards
      if (y > 180) {
        topPos = e.clientY - rect.top - tooltipHeight - 15;
      }
      
      fractalTooltip.style.left = leftPos + 'px';
      fractalTooltip.style.top = topPos + 'px';
      fractalTooltip.classList.remove('hidden');
    } else {
      fractalTooltip.classList.add('hidden');
    }
  });
  
  fractalCanvas.addEventListener('mouseleave', () => {
    fractalTooltip.classList.add('hidden');
  });
  
  fractalCanvas.addEventListener('click', (e) => {
    if (gameLevel < 2 || gameOver || levelComplete || gameBeaten) return;
    
    const rect = fractalCanvas.getBoundingClientRect();
    const scaleX = fractalCanvas.width / rect.width;
    const scaleY = fractalCanvas.height / rect.height;
    
    const x = Math.floor(((e.clientX - rect.left) * scaleX) / 4);
    const y = Math.floor(((e.clientY - rect.top) * scaleY) / 4);
    
    if (x >= 0 && x < 256 && y >= 0 && y < 256) {
      const val = (x << 8) | y;
      inputState = intToState(val);
      recomputeAll();
      drawFractal();
    }
  });
}

// Initialize
initDiagram();
recomputeAll();

