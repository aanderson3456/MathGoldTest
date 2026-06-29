// --- CRYPTO CONFIG & ARITHMETIC ---
const K = [1, 1, 2, 3]; // Cube root fractional parts of first 4 primes mod 4
const H0 = [1, 2, 0, 2, 1, 2, 0, 1]; // Fractional primes mod 4
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

// Cipher Parameters
let enableRotations = true;
let enableCh = true;
let enableMaj = true;
let enableK = true;
let enableW = true;

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
let cachedFractalCanvas = null;
let knnEquivalenceRadius = 0;
let hoveredState = null;
let slowExploreCurr = null;
let slowExplorePath = [];
let slowExploreSteps = 0;

// DOM Elements
const btnGameMode = document.getElementById('btn-game-mode');
const btnReset = document.getElementById('btn-reset');
const btnLoadH0 = document.getElementById('btn-load-h0');
const btnHash = document.getElementById('btn-hash');
const btnNextLevel = document.getElementById('btn-next-level');
const btnRestart = document.getElementById('btn-restart');
const btnVictoryRestart = document.getElementById('btn-victory-restart');
const btnAutoExploreFast = document.getElementById('btn-auto-explore-fast');
const btnAutoExploreSlow = document.getElementById('btn-auto-explore-slow');
const btnTrace = document.getElementById('btn-trace');
const traceStats = document.getElementById('trace-stats');
const traceIters = document.getElementById('trace-iters');
const traceDist = document.getElementById('trace-dist');

// Auto-Explore & Trace State
let isAutoExploring = false;
let autoExploreReqId = null;
let isTracing = false;
let traceReqId = null;
let traceCurrentState = 0;
let traceIterationCount = 0;
let traceRecentJumps = [];
let traceLastCoords = null;
let currentModalRound = null;

let bgCanvas = document.createElement('canvas');
bgCanvas.width = 256;
bgCanvas.height = 256;
let bgCtx = bgCanvas.getContext('2d');
let unvisitedStates = [];
let cometPath = [];

const panelNormal = document.getElementById('panel-normal');
const panelGame = document.getElementById('panel-game');

const hudLevel = document.getElementById('hud-level');
const hudLives = document.getElementById('hud-lives');
const hudTargetDesc = document.getElementById('hud-target-desc');
const hudProb = document.getElementById('hud-prob');
const hudScore = document.getElementById('hud-score');
const hudHashes = document.getElementById('hud-hashes');
const hudWasteCount = document.getElementById('hud-waste-count');

const toggleRotations = document.getElementById('toggle-rotations');
const toggleCh = document.getElementById('toggle-ch');
const toggleMaj = document.getElementById('toggle-maj');
const toggleK = document.getElementById('toggle-k');
const toggleW = document.getElementById('toggle-w');
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

function rot2(x) {
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

let currentAlgorithm = 'SHA256';

function computeRoundSHA(state, rKey, rWord) {
  const [a, b, c, d, e, f, g, h] = state;
  const sig1_val = enableRotations ? sig1(e) : 0;
  const ch_val = enableCh ? ch(e, f, g) : 0;
  const rKey_val = enableK ? rKey : 0;
  const rWord_val = enableW ? rWord : 0;
  const T1 = (h + sig1_val + ch_val + rKey_val + rWord_val) % 4;
  
  const sig0_val = enableRotations ? sig0(a) : 0;
  const maj_val = enableMaj ? maj(a, b, c) : 0;
  const T2 = (sig0_val + maj_val) % 4;
  
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

const sbox4 = [0, 1, 9, 14, 13, 11, 7, 6, 15, 2, 12, 5, 10, 4, 3, 8];

function computeRoundAES(state, rKey, rWord) {
  // 1. SubBytes: Pair into 4-bit nibbles and map via S-Box
  const n0 = (state[0] << 2) | state[1];
  const n1 = (state[2] << 2) | state[3];
  const n2 = (state[4] << 2) | state[5];
  const n3 = (state[6] << 2) | state[7];
  
  const s0 = sbox4[n0];
  const s1 = sbox4[n1];
  const s2 = sbox4[n2];
  const s3 = sbox4[n3];
  
  const subState = [
    (s0 >> 2) & 3, s0 & 3,
    (s1 >> 2) & 3, s1 & 3,
    (s2 >> 2) & 3, s2 & 3,
    (s3 >> 2) & 3, s3 & 3
  ];
  
  // 2. ShiftRows (Permutation to create diffusion)
  const shiftState = [
    subState[0], subState[3], subState[6], subState[1],
    subState[4], subState[7], subState[2], subState[5]
  ];
  
  const rKey_val = enableK ? rKey : 0;
  const rWord_val = enableW ? rWord : 0;
  
  // 3. AddRoundKey (XOR with key schedule)
  const finalState = [];
  for (let i = 0; i < 8; i++) {
    const keyPart = (i % 2 === 0) ? rKey_val : rWord_val;
    finalState.push(shiftState[i] ^ keyPart);
  }
  
  return finalState;
}

function computeRound(state, rKey, rWord) {
  if (currentAlgorithm === 'AES') return computeRoundAES(state, rKey, rWord);
  return computeRoundSHA(state, rKey, rWord);
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
    const w_val = inputState[r % 8];
    current = computeRound(current, K[r], w_val);
    gridStates.push(current);
  }
  updateDiagram();
  if (gameLevel >= 2 && !isAutoExploring && !isTracing) {
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

      if (currentAlgorithm === 'AES') {
        // AES ShiftRows mapping
        const aesMap = {0: 0, 1: 3, 2: 6, 3: 1, 4: 4, 5: 7, 6: 2, 7: 5};
        targetCol = aesMap[c];
      } else {
        // Define SHA wiring mapping
        if (c === 0) { targetCol = 1; } // a -> b
        else if (c === 1) { targetCol = 2; } // b -> c
        else if (c === 2) { targetCol = 3; } // c -> d
        else if (c === 3) { targetCol = 4; isFeedback = true; } // d -> e (addition feedback)
        else if (c === 4) { targetCol = 5; } // e -> f
        else if (c === 5) { targetCol = 6; } // f -> g
        else if (c === 6) { targetCol = 7; } // g -> h
        else if (c === 7) { targetCol = 0; isFeedback = true; } // h -> a (T1 feedback)
      }

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
    
    // Draw Cotton Gin Icon for this round
    if (currentAlgorithm === 'SHA256') {
      const gGear = document.createElementNS("http://www.w3.org/2000/svg", "g");
      const iconX = getRegisterX(3) + 45; // Between D and E roughly
      const iconY = getRegisterY(r) + 55;
      gGear.setAttribute("transform", `translate(${iconX}, ${iconY})`);
      gGear.setAttribute("class", "cotton-gin-icon");
      gGear.style.cursor = "pointer";
      gGear.addEventListener("click", () => openCompressorModal(r));
      
      const circle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
      circle.setAttribute("r", "16");
      circle.setAttribute("fill", "#1e293b");
      circle.setAttribute("stroke", "#fbbf24");
      circle.setAttribute("stroke-width", "2");
      
      const text = document.createElementNS("http://www.w3.org/2000/svg", "text");
      text.setAttribute("text-anchor", "middle");
      text.setAttribute("alignment-baseline", "middle");
      text.setAttribute("dy", "2");
      text.setAttribute("font-size", "18px");
      text.textContent = "⚙️";
      
      gGear.appendChild(circle);
      gGear.appendChild(text);
      wiresGroup.appendChild(gGear);
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

      circle.addEventListener("click", () => handleNodeClick(r, c));

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

function handleNodeClick(r, c) {
  if (r === 0) {
    cycleInputRegister(c);
  }
  
  const explanationEl = document.getElementById('register-explanation');
  if (!explanationEl) return;
  
  const regName = regNames[c].toUpperCase();
  const val = gridStates[r][c];
  const label = valueLabels[val];
  const color = valueColors[val];
  const colorSpan = `<span style="color: ${color}; font-weight: bold; background: rgba(0,0,0,0.5); padding: 2px 4px; border-radius: 3px;">${label}</span>`;
  
  let text = '';
  
  if (r === 0) {
    let extra = '';
    const isH0Value = (val === H0[c]);
    if (isH0Value) {
      extra = ` This matches the standard H₀ constant for register ${regName} (derived from the square root of prime ${[2,3,5,7,11,13,17,19][c]}).`;
    }
    text = `<strong>Row 0, Register ${regName}:</strong> Currently holding ${colorSpan}.${extra} This is part of the starting register state. In mining, this is the <em>initial vector</em> or input state we change to find a target hash! Click 'Load H₀ Constants' to populate the starting state with nothing-up-my-sleeve values.`;
  } else {
    if (currentAlgorithm === 'AES') {
      text = `<strong>AES Mode, Register ${regName} (${colorSpan}):</strong> AES is built on a substitution-permutation network. Each 4-bit pair passes through an <em>S-Box</em> (non-linear substitution), then columns are swapped in <em>ShiftRows</em>, and finally XORed with the Round Key!`;
    } else {
      // SHA-256 Explanations
      const t1Span = `<span style="color: #ef4444; font-weight: bold; cursor: pointer; text-decoration: underline;" onclick="openCompressorModal(${r - 1})">T1</span>`;
      const t2Span = `<span style="color: #10b981; font-weight: bold; cursor: pointer; text-decoration: underline;" onclick="openCompressorModal(${r - 1})">T2</span>`;
      
      if (c === 0) { // A
        text = `<strong>Row ${r}, Register A (The Chaos Head) [${colorSpan}]:</strong> This register is heavily mutated! It receives the full chaotic mix of the entire system. It adds the output of the ${t1Span} compressor (mixing E, F, G, H, and Keys) to the ${t2Span} compressor (mixing A, B, and C).`;
      } else if (c === 4) { // E
        text = `<strong>Row ${r}, Register E (The Inner Injection) [${colorSpan}]:</strong> The second special injection point! Instead of just shifting, it takes the old value of D and adds ${t1Span} (a chaotic mix of E, F, G, H, the Key, and Word). This splits the avalanche effect across the two halves of the state!`;
      } else { // B, C, D, F, G, H
        let sourceReg = regNames[c - 1].toUpperCase();
        text = `<strong>Row ${r}, Register ${regName} (Shift Register) [${colorSpan}]:</strong> A simple shift register. It perfectly copies the value of Register <strong>${sourceReg}</strong> from the previous round without mutating it.`;
      }
    }
  }
  
  explanationEl.innerHTML = text;
}

function syncToggles(source, targetId) {
  const target = document.getElementById(targetId);
  if (target) {
    target.checked = source.checked;
    target.dispatchEvent(new Event('change'));
  }
}

function syncModalCheckboxes() {
  const modalRotations = document.getElementById('modal-toggle-rotations');
  const modalCh = document.getElementById('modal-toggle-ch');
  const modalMaj = document.getElementById('modal-toggle-maj');
  const modalK = document.getElementById('modal-toggle-k');
  const modalW = document.getElementById('modal-toggle-w');
  
  if (modalRotations) modalRotations.checked = enableRotations;
  if (modalCh) modalCh.checked = enableCh;
  if (modalMaj) modalMaj.checked = enableMaj;
  if (modalK) modalK.checked = enableK;
  if (modalW) modalW.checked = enableW;
}

function openCompressorModal(r) {
  if (currentAlgorithm !== 'SHA256') return;
  currentModalRound = r;
  
  syncModalCheckboxes();
  
  const state = gridStates[r];
  const [a, b, c, d, e, f, g, h] = state;
  
  // Get parameter variables
  const k = enableK ? K[r] : 0;
  const w = enableW ? inputState[r % 8] : 0;
    
  // Calculate intermediate values based on toggles
  const sig1_val = enableRotations ? sig1(e) : 0;
  const ch_val = enableCh ? ch(e, f, g) : 0;
  const T1 = (h + sig1_val + ch_val + k + w) % 4;

  const sig0_val = enableRotations ? sig0(a) : 0;
  const maj_val = enableMaj ? maj(a, b, c) : 0;
  const T2 = (sig0_val + maj_val) % 4;
  
  const colorFormat = (val) => `<span style="color: ${valueColors[val]}; background: rgba(0,0,0,0.4); padding: 2px 6px; border-radius: 4px;">${valueLabels[val]}</span>`;
  
  let html = `
    <div style="color: var(--accent); margin-bottom: 8px; font-weight: bold; font-size: 1.1em;">Round ${r + 1} Compressor Math:</div>
    <div><strong style="color: #ef4444;">T1</strong> = (H + &Sigma;1(E) + Ch(E,F,G) + K + W) mod 4</div>
    <div style="margin-left: 20px; color: var(--text-secondary); margin-bottom: 10px;">
      H = ${colorFormat(h)}<br>
      ${enableRotations ? `&Sigma;1(E) = &Sigma;1(${colorFormat(e)}) = ${colorFormat(sig1_val)}` : `&Sigma;1(E) = <span style="color: #ef4444;">DISABLED</span> = 00`}<br>
      ${enableCh ? `Ch(E,F,G) = Ch(${colorFormat(e)}, ${colorFormat(f)}, ${colorFormat(g)}) = ${colorFormat(ch_val)}` : `Ch(E,F,G) = <span style="color: #ef4444;">DISABLED</span> = 00`}<br>
      ${enableK ? `K = ${colorFormat(k)}` : `K = <span style="color: #ef4444;">DISABLED</span> = 00`}<br>
      ${enableW ? `W = ${colorFormat(w)}` : `W = <span style="color: #ef4444;">DISABLED</span> = 00`}<br>
      <strong style="color: #ef4444;">T1 = ${colorFormat(T1)}</strong>
    </div>
    
    <div><strong style="color: #10b981;">T2</strong> = (&Sigma;0(A) + Maj(A,B,C)) mod 4</div>
    <div style="margin-left: 20px; color: var(--text-secondary); margin-bottom: 10px;">
      ${enableRotations ? `&Sigma;0(A) = &Sigma;0(${colorFormat(a)}) = ${colorFormat(sig0_val)}` : `&Sigma;0(A) = <span style="color: #ef4444;">DISABLED</span> = 00`}<br>
      ${enableMaj ? `Maj(A,B,C) = Maj(${colorFormat(a)}, ${colorFormat(b)}, ${colorFormat(c)}) = ${colorFormat(maj_val)}` : `Maj(A,B,C) = <span style="color: #ef4444;">DISABLED</span> = 00`}<br>
      <strong style="color: #10b981;">T2 = ${colorFormat(T2)}</strong>
    </div>
    
    <div style="border-top: 1px dashed var(--border); padding-top: 10px;">
      <strong>New A</strong> = (<span style="color: #ef4444;">T1</span> + <span style="color: #10b981;">T2</span>) mod 4 = (${colorFormat(T1)} + ${colorFormat(T2)}) mod 4 = ${colorFormat((T1 + T2) % 4)}<br>
      <strong>New E</strong> = (D + <span style="color: #ef4444;">T1</span>) mod 4 = (${colorFormat(d)} + ${colorFormat(T1)}) mod 4 = ${colorFormat((d + T1) % 4)}
    </div>
  `;
  
  const e_color = colorFormat(e);
  const rot1_e = colorFormat(rot1(e));
  const rot2_e = colorFormat(rot2(e));
  const sig1_e = colorFormat(sig1(e));
  
  const rotateExplainer = `
    <div style="background: rgba(0,0,0,0.3); padding: 10px; border-radius: 4px; font-family: monospace; margin: 12px 0;">
      Example: E = ${e_color}<br><br>
      <strong>rot1</strong>(${valueLabels[e]}) = ${rot1_e} <em>(shifted 1)</em><br>
      <strong>rot2</strong>(${valueLabels[e]}) = ${rot2_e} <em>(360&deg; spin)</em>
    </div>
    
    <p>The <strong>&Sigma; (Sigma)</strong> function rotates the bits by different amounts and then XORs (&oplus;) them together to scramble the entropy.</p>
    
    <div style="background: rgba(0,0,0,0.3); padding: 10px; border-radius: 4px; font-family: monospace; margin: 12px 0;">
      &Sigma;1(${valueLabels[e]}) = rot1 &oplus; rot2<br>
      &Sigma;1(${valueLabels[e]}) = ${rot1_e} &oplus; ${rot2_e} = ${sig1_e}
    </div>
  `;
  
  // Provide interactive visual feedback based on toggles
  let explainerHtml = "";
  if (!enableRotations) {
    explainerHtml += `<div style="color:#fbbf24; margin-bottom: 5px;">⚠️ <strong>Rotations Disabled:</strong> The avalanche effect is broken. Bits no longer scatter properly!</div>`;
  }
  if (!enableCh || !enableMaj) {
    explainerHtml += `<div style="color:#ef4444; margin-bottom: 5px;">⚠️ <strong>Non-Linearity Disabled:</strong> The hashing process is now linear and easily reversible!</div>`;
  }
  if (!enableK || !enableW) {
    explainerHtml += `<div style="color:#a855f7; margin-bottom: 5px;">⚠️ <strong>External Mixins Disabled:</strong> The hash is isolated from the message (W) or the constants (K).</div>`;
  }
  if (enableRotations && enableCh && enableMaj && enableK && enableW) {
    explainerHtml += `<div style="color:#22c55e;">✅ <strong>Full Chaos Active:</strong> The compressor is operating at maximum security!</div>`;
  }
  
  // Also explain W and K if they are enabled
  if (enableW) {
    explainerHtml += `<div style="color:#93c5fd; margin-top: 10px;">ℹ️ <strong>Message Schedule (W):</strong> The actual message blocks (e.g. transaction data) being hashed, broken into chunks.</div>`;
  }
  if (enableK) {
    explainerHtml += `<div style="color:#d8b4fe; margin-top: 5px;">ℹ️ <strong>Round Constants (K):</strong> Fixed mathematical constants injected into the algorithm to defend against certain patterns.</div>`;
  }

  document.getElementById('compressor-math').innerHTML = html;
  document.getElementById('rotate-explainer-content').innerHTML = rotateExplainer;
  document.getElementById('compressor-explainer').innerHTML = explainerHtml;
  
  drawMiniDiagram(r);
  
  document.getElementById('modal-compressor').classList.remove('hidden');
}

function drawMiniDiagram(r) {
  const container = document.getElementById('mini-diagram');
  container.innerHTML = '';
  
  const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
  const computedHeight = 150;
  svg.setAttribute('viewBox', `0 0 800 ${computedHeight}`);
  svg.setAttribute('style', 'width: 100%; height: auto;');
  
  const wiresGroup = document.createElementNS("http://www.w3.org/2000/svg", "g");
  const nodesGroup = document.createElementNS("http://www.w3.org/2000/svg", "g");
  svg.appendChild(wiresGroup);
  svg.appendChild(nodesGroup);

  const row0_y = 35;
  const row1_y = 115;
  
  // 1. Draw Wires
  for (let c = 0; c < 8; c++) {
    let targetCol = c;
    let isFeedback = false;
    if (c === 0) { targetCol = 1; }
    else if (c === 1) { targetCol = 2; }
    else if (c === 2) { targetCol = 3; }
    else if (c === 3) { targetCol = 4; isFeedback = true; }
    else if (c === 4) { targetCol = 5; }
    else if (c === 5) { targetCol = 6; }
    else if (c === 6) { targetCol = 7; }
    else if (c === 7) { targetCol = 0; isFeedback = true; }

    const line = document.createElementNS("http://www.w3.org/2000/svg", "path");
    const x1 = getRegisterX(c);
    const y1 = row0_y + 16;
    const x2 = getRegisterX(targetCol);
    const y2 = row1_y - 16;
    
    const controlY = y1 + (y2 - y1) / 2;
    const dPath = `M ${x1} ${y1} C ${x1} ${controlY}, ${x2} ${controlY}, ${x2} ${y2}`;
    line.setAttribute("d", dPath);
    line.setAttribute("fill", "none");
    
    const val = gridStates[r][c];
    const color = valueColors[val];
    line.setAttribute("stroke", color);
    line.setAttribute("stroke-width", val > 0 ? "2.5" : "1.5");
    line.setAttribute("opacity", val === 0 ? "0.3" : "0.85");
    
    wiresGroup.appendChild(line);
  }
  
  // 2. Gear removed as per user request

  // 3. Draw Nodes
  for (let rowIdx = 0; rowIdx <= 1; rowIdx++) {
    const dataRow = gridStates[r + rowIdx];
    const y = rowIdx === 0 ? row0_y : row1_y;
    
    const rLabel = document.createElementNS("http://www.w3.org/2000/svg", "text");
    rLabel.setAttribute("x", "12");
    rLabel.setAttribute("y", y + 5);
    rLabel.setAttribute("class", "row-label");
    rLabel.textContent = rowIdx === 0 ? (r === 0 ? "Input (R0)" : `Round ${r}`) : `Round ${r+1}`;
    nodesGroup.appendChild(rLabel);
    
    for (let c = 0; c < 8; c++) {
      const val = dataRow[c];
      const color = valueColors[val];
      const label = valueLabels[val];
      
      const g = document.createElementNS("http://www.w3.org/2000/svg", "g");
      g.setAttribute("transform", `translate(${getRegisterX(c)}, ${y})`);
      g.style.cursor = "pointer";
      g.addEventListener("click", () => {
         handleNodeClick(r + rowIdx, c);
         if (r + rowIdx === 0) {
            recomputeAll();
            openCompressorModal(0);
         }
      });
      
      const cNode = document.createElementNS("http://www.w3.org/2000/svg", "circle");
      cNode.setAttribute("class", "svg-node");
      cNode.setAttribute("r", "14");
      cNode.setAttribute("fill", color);
      cNode.setAttribute("stroke", rowIdx === 0 ? "#ffffff" : "#445");
      cNode.setAttribute("stroke-width", rowIdx === 0 ? "2" : "1");

      const tNode = document.createElementNS("http://www.w3.org/2000/svg", "text");
      tNode.setAttribute("class", "node-text");
      tNode.setAttribute("text-anchor", "middle");
      tNode.setAttribute("alignment-baseline", "middle");
      tNode.setAttribute("dy", "3");
      tNode.textContent = regNames[c].toUpperCase() + ":" + label;

      g.appendChild(cNode);
      g.appendChild(tNode);
      nodesGroup.appendChild(g);
    }
  }

  container.appendChild(svg);
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
  if (isAutoExploring) {
    stopAutoExplore();
  }
  if (isTracing) {
    toggleTraceMode();
  }
  
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
    const w_val = state[r % 8];
    curr = computeRound(curr, K[r % 4], w_val);
  }
  return curr;
}

function computeAllCycleLengths(numRounds) {
  if (cycleLengths && cycleLengthsRoundCount === numRounds) return;
  cycleLengths = new Int32Array(65536);
  cycleLengthsRoundCount = numRounds;
  
  // 0: unvisited, 1: visited in current path, 2: fully processed
  const stateStatus = new Uint8Array(65536);
  
  for (let i = 0; i < 65536; i++) {
    if (stateStatus[i] === 2) continue;
    
    const path = [];
    let curr = i;
    
    // Walk until we hit a state we've seen before (either in this path, or a previous one)
    while (stateStatus[curr] === 0) {
      stateStatus[curr] = 1;
      path.push(curr);
      curr = stateToInt(runNRounds(intToState(curr), numRounds));
    }
    
    let cycleLen;
    if (stateStatus[curr] === 1) {
      // We hit a state in the CURRENT path -> we found a new cycle!
      // The cycle length is the distance from the first occurrence of `curr` to the end.
      const cycleStartIndex = path.indexOf(curr);
      cycleLen = path.length - cycleStartIndex;
    } else {
      // We hit a state from a PREVIOUS path -> we merge into an existing cycle
      cycleLen = cycleLengths[curr];
    }
    
    // Assign this cycle length to all states in the path, and mark them fully processed
    for (let j = 0; j < path.length; j++) {
      cycleLengths[path[j]] = cycleLen;
      stateStatus[path[j]] = 2;
    }
  }
}

// --- KNN Constellation ---
function drawKNNConstellation(ctx, centerInt, k = 50) {
  if (centerInt === undefined || centerInt === null || !cycleLengths) return;
  
  const cx = (centerInt >> 8) & 0xFF;
  const cy = centerInt & 0xFF;
  const targetCycleLen = cycleLengths[centerInt];
  
  const windowSize = 255; // Search the entire 256x256 canvas
  const candidates = [];
  
  for (let dx = -windowSize; dx <= windowSize; dx++) {
    const x = cx + dx;
    if (x < 0 || x > 255) continue;
    
    for (let dy = -windowSize; dy <= windowSize; dy++) {
      const y = cy + dy;
      if (y < 0 || y > 255) continue;
      if (dx === 0 && dy === 0) continue;
      
      const stateVal = (x << 8) | y;
      const cycleLen = cycleLengths[stateVal];
      const diff = Math.abs(cycleLen - targetCycleLen);
      if (diff <= knnEquivalenceRadius) {
        const distSq = dx * dx + dy * dy;
        if (distSq < 64) continue; // Enforce minimum line length of 32 canvas pixels so they extend beyond the active cursor dot
        candidates.push({ x, y, distSq });
      }
    }
  }
  
  candidates.sort((a, b) => a.distSq - b.distSq);
  const topK = candidates.slice(0, k);
  const rgb = getCycleColorRGB(targetCycleLen);
  
  ctx.save();
  ctx.lineCap = 'round';
  
  // Draw solid, fully opaque, thick lines in the matching orbit color
  ctx.strokeStyle = `rgb(${rgb[0]}, ${rgb[1]}, ${rgb[2]})`;
  ctx.lineWidth = 3.5;
  
  topK.forEach(neighbor => {
    // Draw the connection line
    ctx.beginPath();
    ctx.moveTo(cx * 4 + 2, cy * 4 + 2);
    ctx.lineTo(neighbor.x * 4 + 2, neighbor.y * 4 + 2);
    ctx.stroke();
    
    // Draw a bright white dot at the neighbor endpoint to make it stand out
    ctx.fillStyle = '#ffffff';
    ctx.beginPath();
    ctx.arc(neighbor.x * 4 + 2, neighbor.y * 4 + 2, 4, 0, 2 * Math.PI);
    ctx.fill();
  });
  
  ctx.restore();
}

function renderFractalToCache() {
  cachedFractalCanvas = document.createElement('canvas');
  cachedFractalCanvas.width = 256;
  cachedFractalCanvas.height = 256;
  const tempCtx = cachedFractalCanvas.getContext('2d');
  
  const imgData = tempCtx.createImageData(256, 256);
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
  tempCtx.putImageData(imgData, 0, 0);
}

function drawFractal() {
  if (gameLevel < 2) return;
  
  if (!canvasContext) {
    canvasContext = fractalCanvas.getContext('2d');
  }
  
  const numRounds = getNumRounds();
  computeAllCycleLengths(4); // Always display the full 4-round "crazy" fractal
  
  if (!cachedFractalCanvas) {
    renderFractalToCache();
  }
  
  const wrapper = fractalCanvas.parentElement;
  if (wrapper) {
    wrapper.style.transform = '';
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
    if (currentAlgorithm === 'AES') {
      if (gameLevel < 8) {
        titleEl.textContent = `4-Round AES/Galois Fractal (Preview)`;
      } else {
        titleEl.textContent = 'AES/Galois Fractal (65,536 States)';
      }
    } else {
      if (gameLevel < 8) {
        titleEl.textContent = `4-Round State-Space Map (Preview)`;
      } else {
        titleEl.textContent = 'State-Space Fractal Map (65,536 States)';
      }
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
  
  // Render to a 1024x1024 canvas
  fractalCanvas.width = 1024;
  fractalCanvas.height = 1024;
  
  canvasContext.imageSmoothingEnabled = false;
  canvasContext.clearRect(0, 0, 1024, 1024);
  canvasContext.drawImage(cachedFractalCanvas, 0, 0, 1024, 1024);
  

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
  
  canvasContext.stroke();

  if (gameLevel >= 2) {
    const activeStateVal = (hoveredState !== null) ? hoveredState : currentInt;
    drawKNNConstellation(canvasContext, activeStateVal, 50);
  }
}

// --- AUTO-EXPLORE LOGIC ---
let autoExploreSpeed = 'fast';

function startAutoExplore(speed) {
  isAutoExploring = true;
  autoExploreSpeed = speed;
  
  updateAutoExploreButtonStates();
  
  // Clear the background layer completely to black to start "blank"
  bgCtx.fillStyle = '#000000';
  bgCtx.fillRect(0, 0, 256, 256);
  
  // Populate unvisited states randomly
  unvisitedStates = [];
  for (let i = 0; i < 65536; i++) unvisitedStates.push(i);
  // Shuffle
  for (let i = unvisitedStates.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [unvisitedStates[i], unvisitedStates[j]] = [unvisitedStates[j], unvisitedStates[i]];
  }
  cometPath = [];
  slowExploreCurr = null;
  slowExplorePath = [];
  slowExploreSteps = 0;
  
  // Stop blinking the selected input if exploring
  if (blinkInterval) {
    clearInterval(blinkInterval);
    blinkInterval = null;
  }
  
  // Compute lengths just in case
  computeAllCycleLengths(4);
  
  autoExploreLoop();
}

function stopAutoExplore() {
  isAutoExploring = false;
  updateAutoExploreButtonStates();
  
  if (autoExploreReqId) {
    if (autoExploreSpeed === 'slow') {
      clearTimeout(autoExploreReqId);
    } else {
      cancelAnimationFrame(autoExploreReqId);
    }
  }
  autoExploreReqId = null;
  
  // Restart blink timer
  if (gameLevel >= 2) {
    blinkInterval = setInterval(() => {
      blinkState = !blinkState;
      drawFractal();
    }, 500);
  }
  drawFractal();
}

function updateAutoExploreButtonStates() {
  const btnFast = document.getElementById('btn-auto-explore-fast');
  const btnSlow = document.getElementById('btn-auto-explore-slow');
  
  if (!btnFast || !btnSlow) return;
  
  if (isAutoExploring) {
    if (autoExploreSpeed === 'fast') {
      btnFast.textContent = '🛑 Stop (Fast)';
      btnFast.classList.add('active');
      btnSlow.textContent = '🐢 Auto-Explore (Slow)';
      btnSlow.classList.remove('active');
    } else {
      btnSlow.textContent = '🛑 Stop (Slow)';
      btnSlow.classList.add('active');
      btnFast.textContent = '⚡ Auto-Explore (Fast)';
      btnFast.classList.remove('active');
    }
  } else {
    btnFast.textContent = '⚡ Auto-Explore (Fast)';
    btnFast.classList.remove('active');
    btnSlow.textContent = '🐢 Auto-Explore (Slow)';
    btnSlow.classList.remove('active');
  }
}

function toggleAutoExplore(speed) {
  if (gameLevel < 2) {
    alert("Auto-Explore unlocks at Level 2!");
    return;
  }
  
  if (isAutoExploring) {
    if (autoExploreSpeed === speed) {
      stopAutoExplore();
    } else {
      autoExploreSpeed = speed;
      updateAutoExploreButtonStates();
    }
  } else {
    startAutoExplore(speed);
  }
}

function autoExploreLoop() {
  if (!isAutoExploring) return;
  
  if (autoExploreSpeed === 'slow') {
    if (slowExploreCurr === null) {
      if (unvisitedStates.length === 0) {
        stopAutoExplore();
        return;
      }
      slowExploreCurr = unvisitedStates.pop();
      slowExplorePath = [];
      slowExploreSteps = 0;
    }
    
    const colorRGB = getCycleColorRGB(cycleLengths[slowExploreCurr]);
    const fillStr = `rgb(${colorRGB[0]}, ${colorRGB[1]}, ${colorRGB[2]})`;
    
    slowExplorePath.push(slowExploreCurr);
    if (slowExplorePath.length > 20) slowExplorePath.shift();
    
    const x = (slowExploreCurr >> 8) & 0xFF;
    const y = slowExploreCurr & 0xFF;
    bgCtx.fillStyle = fillStr;
    bgCtx.fillRect(x, y, 1, 1);
    
    cometPath = [...slowExplorePath];
    slowExploreCurr = stateToInt(runNRounds(intToState(slowExploreCurr), 4));
    slowExploreSteps++;
    
    if (slowExploreSteps >= 20) {
      slowExploreCurr = null;
    }
  } else {
    const SPEED = 25; // fast mode traces 25 full paths per frame
    let exploredCount = 0;
    
    while(unvisitedStates.length > 0 && exploredCount < SPEED) {
      const startState = unvisitedStates.pop();
      
      let curr = startState;
      const path = [];
      const colorRGB = getCycleColorRGB(cycleLengths[startState]);
      const fillStr = `rgb(${colorRGB[0]}, ${colorRGB[1]}, ${colorRGB[2]})`;
      
      // Trace 20 steps deep
      for (let i = 0; i < 20; i++) {
        path.push(curr);
        const x = (curr >> 8) & 0xFF;
        const y = curr & 0xFF;
        
        // Draw permanently on BG
        bgCtx.fillStyle = fillStr;
        bgCtx.fillRect(x, y, 1, 1);
        
        curr = stateToInt(runNRounds(intToState(curr), 4));
      }
      
      cometPath = path; // The last path traced is what we draw as the comet tail
      exploredCount++;
    }
    
    if (unvisitedStates.length === 0) {
      stopAutoExplore(); // Stop when done
      return;
    }
  }
  
  // Render
  if (!canvasContext) canvasContext = fractalCanvas.getContext('2d');
  
  fractalCanvas.width = 1024;
  fractalCanvas.height = 1024;
  canvasContext.imageSmoothingEnabled = false;
  
  // Draw the Background map layer (4x scale)
  canvasContext.clearRect(0, 0, 1024, 1024);
  canvasContext.drawImage(bgCanvas, 0, 0, 1024, 1024);
  
  

  // Draw Comet Tail over everything (foreground layer)
  for (let i = 0; i < cometPath.length; i++) {
     const stateVal = cometPath[i];
     const x = ((stateVal >> 8) & 0xFF) * 4;
     const y = (stateVal & 0xFF) * 4;
     
     // Fade: 1.0 down to 0.1
     const opacity = 1.0 - (i / cometPath.length);
     canvasContext.fillStyle = `rgba(255, 255, 255, ${opacity})`;
     canvasContext.fillRect(x, y, 4, 4);
  }
  
  // Highlight the current head
  if (cometPath.length > 0) {
     const head = cometPath[cometPath.length - 1];
     const hx = ((head >> 8) & 0xFF) * 4;
     const hy = (head & 0xFF) * 4;
     canvasContext.fillStyle = '#fbbf24';
     canvasContext.beginPath();
     canvasContext.arc(hx + 2, hy + 2, 8, 0, 2 * Math.PI);
     canvasContext.fill();
     
     // Update input state visually to match head!
     inputState = intToState(head);
     updateDiagram();
     
     if (gameLevel >= 2) {
       drawKNNConstellation(canvasContext, head, 50);
     }
  }
  
  if (autoExploreSpeed === 'slow') {
    autoExploreReqId = setTimeout(autoExploreLoop, 1000); // 1000ms slow-motion step
  } else {
    autoExploreReqId = requestAnimationFrame(autoExploreLoop);
  }
}

function toggleTraceMode() {
  if (gameLevel < 2) {
    alert("Trace Mode unlocks at Level 2!");
    return;
  }
  
  if (isAutoExploring) stopAutoExplore();
  
  isTracing = !isTracing;
  if (isTracing) {
    btnTrace.textContent = '🛑 Stop Trace';
    btnTrace.classList.add('active');
    if (traceStats) traceStats.classList.remove('hidden');
    
    traceCurrentState = stateToInt(inputState);
    traceIterationCount = 0;
    traceRecentJumps = [];
    cometPath = [];
    
    const hx = ((traceCurrentState >> 8) & 0xFF) * 4;
    const hy = (traceCurrentState & 0xFF) * 4;
    traceLastCoords = {x: hx, y: hy};
    
    // Clear the background to trace over
    bgCtx.fillStyle = '#000000';
    bgCtx.fillRect(0, 0, 256, 256);
    
    if (blinkInterval) {
      clearInterval(blinkInterval);
      blinkInterval = null;
    }
    
    traceLoop();
  } else {
    btnTrace.textContent = '🔍 Trace Harmonic Orbit';
    btnTrace.classList.remove('active');
    if (traceStats) traceStats.classList.add('hidden');
    if (traceReqId) clearTimeout(traceReqId);
    
    if (gameLevel >= 2) {
      blinkInterval = setInterval(() => {
        blinkState = !blinkState;
        drawFractal();
      }, 500);
    }
    drawFractal();
  }
}

function traceLoop() {
  if (!isTracing) return;
  
  const nextState = stateToInt(runNRounds(intToState(traceCurrentState), 4));
  const hx = ((nextState >> 8) & 0xFF) * 4;
  const hy = (nextState & 0xFF) * 4;
  const newCoords = {x: hx, y: hy};
  
  // Update stats
  const dx = newCoords.x - traceLastCoords.x;
  const dy = newCoords.y - traceLastCoords.y;
  const dist = Math.sqrt(dx*dx + dy*dy);
  traceRecentJumps.push(dist);
  if (traceRecentJumps.length > 3) traceRecentJumps.shift();
  
  const avgDist = traceRecentJumps.reduce((a,b) => a+b, 0) / traceRecentJumps.length;
  traceIterationCount++;
  
  if (traceIters) traceIters.textContent = traceIterationCount;
  if (traceDist) traceDist.textContent = avgDist.toFixed(1) + ' px';
  
  traceLastCoords = newCoords;
  traceCurrentState = nextState;
  
  // Sync the SVG Diagram visually!
  inputState = intToState(nextState);
  recomputeAll();
  
  // Update comet path
  cometPath.push(nextState);
  if (cometPath.length > 25) cometPath.shift();
  
  // Render
  if (!canvasContext) canvasContext = fractalCanvas.getContext('2d');
  fractalCanvas.width = 1024;
  fractalCanvas.height = 1024;
  canvasContext.imageSmoothingEnabled = false;
  
  canvasContext.clearRect(0, 0, 1024, 1024);
  

  // Draw Comet Tail over everything
  for (let i = 0; i < cometPath.length; i++) {
     const stateVal = cometPath[i];
     const x = ((stateVal >> 8) & 0xFF) * 4;
     const y = (stateVal & 0xFF) * 4;
     
     const opacity = 1.0 - (i / cometPath.length);
     canvasContext.fillStyle = `rgba(99, 102, 241, ${opacity})`; // Indigo tail
     canvasContext.fillRect(x, y, 6, 6);
  }
  
  // Highlight the current head
  if (cometPath.length > 0) {
     const head = cometPath[cometPath.length - 1];
     const hx2 = ((head >> 8) & 0xFF) * 4;
     const hy2 = (head & 0xFF) * 4;
     canvasContext.fillStyle = '#fbbf24';
     canvasContext.beginPath();
     canvasContext.arc(hx2 + 3, hy2 + 3, 12, 0, 2 * Math.PI);
     canvasContext.fill();
     
     if (gameLevel >= 2) {
       drawKNNConstellation(canvasContext, head, 50);
     }
  }
  
  traceReqId = setTimeout(traceLoop, 400); // 400ms slow-motion step
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
const knnRadiusSlider = document.getElementById('knn-radius-slider');
const knnRadiusVal = document.getElementById('knn-radius-val');
if (knnRadiusSlider && knnRadiusVal) {
  knnRadiusSlider.addEventListener('input', (e) => {
    knnEquivalenceRadius = parseInt(e.target.value);
    if (knnEquivalenceRadius === 0) {
      knnRadiusVal.textContent = `±0 (Exact)`;
    } else if (knnEquivalenceRadius >= 65000) {
      knnRadiusVal.textContent = `Any Orbit (Connected)`;
    } else {
      knnRadiusVal.textContent = `±${knnEquivalenceRadius.toLocaleString()} states`;
    }
    drawFractal();
  });
}

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
if (btnLoadH0) {
  btnLoadH0.addEventListener("click", () => {
    if (gameOver || levelComplete || gameBeaten) return;
    inputState = [...H0];
    recomputeAll();
    
    // Set explanation text explaining what H0 is
    const explanationEl = document.getElementById('register-explanation');
    if (explanationEl) {
      explanationEl.innerHTML = `<strong>H₀ Constants Loaded!</strong> The starting registers have been initialized to H₀ = [1, 2, 0, 2, 1, 2, 0, 1]. In SHA-256, these initial register values are the fractional parts of the square roots of the first 8 primes (2, 3, 5, 7, 11, 13, 17, 19). They are "nothing-up-my-sleeve" numbers chosen to guarantee no backdoors!`;
    }
  });
}
btnHash.addEventListener("click", hashState);
if (btnAutoExploreFast) btnAutoExploreFast.addEventListener("click", () => toggleAutoExplore('fast'));
if (btnAutoExploreSlow) btnAutoExploreSlow.addEventListener("click", () => toggleAutoExplore('slow'));
btnTrace.addEventListener("click", toggleTraceMode);
btnNextLevel.addEventListener("click", nextLevel);
btnRestart.addEventListener("click", resetLevelState);
btnVictoryRestart.addEventListener("click", saveScoreAndRestart);


// Cipher Parameter Toggles
function handleParameterChange() {
  enableRotations = toggleRotations.checked;
  enableCh = toggleCh ? toggleCh.checked : true;
  enableMaj = toggleMaj ? toggleMaj.checked : true;
  enableK = toggleK ? toggleK.checked : true;
  enableW = toggleW ? toggleW.checked : true;
  
  // Wipe and recalculate everything since the topology just changed
  cycleLengths = null;
  cycleLengthsRoundCount = 0;
  cachedFractalCanvas = null;
  inputState = [0, 0, 0, 0, 0, 0, 0, 0];
  
  if (isAutoExploring) {
    stopAutoExplore(); // stop if running
  }
  
  recomputeAll();
  
  // If the compressor modal is open, refresh it so the math/diagram updates instantly
  const modal = document.getElementById('modal-compressor');
  if (modal && !modal.classList.contains('hidden') && currentModalRound !== null) {
    openCompressorModal(currentModalRound);
  }
  
  // reset visuals
  if (bgCanvas) {
    bgCtx.clearRect(0, 0, 1024, 1024);
  }
  cometPath = [];
}

if (toggleRotations) toggleRotations.addEventListener('change', handleParameterChange);
if (toggleCh) toggleCh.addEventListener('change', handleParameterChange);
if (toggleMaj) toggleMaj.addEventListener('change', handleParameterChange);
if (toggleK) toggleK.addEventListener('change', handleParameterChange);
if (toggleW) toggleW.addEventListener('change', handleParameterChange);

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
      
      if (hoveredState !== val) {
        hoveredState = val;
        drawFractal();
      }
      
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
      if (hoveredState !== null) {
        hoveredState = null;
        drawFractal();
      }
    }
  });
  
  fractalCanvas.addEventListener('mouseleave', () => {
    fractalTooltip.classList.add('hidden');
    if (hoveredState !== null) {
      hoveredState = null;
      drawFractal();
    }
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

// Algorithm Switcher binding
const algoSelect = document.getElementById('algo-select');
if (algoSelect) {
  algoSelect.addEventListener('change', (e) => {
    currentAlgorithm = e.target.value;
    
    // Reset cycle lengths cache
    cycleLengths = null;
    cycleLengthsRoundCount = 0;
    cachedFractalCanvas = null;
    
    // Stop auto explore if running
    if (isAutoExploring) {
      stopAutoExplore();
    }
    
    // Reset game state and force diagram redraw
    startGame();
  });
}

// Initialize
initDiagram();
recomputeAll();

