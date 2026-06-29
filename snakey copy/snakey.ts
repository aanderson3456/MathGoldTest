import { Component, AfterViewInit, HostBinding, Inject, PLATFORM_ID } from '@angular/core';
import { CommonModule, isPlatformBrowser } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import * as d3 from 'd3';

const SHAPES: { [key: string]: number[][] } = {
    Monomino: [[0, 0]],
    Domino: [[0, 0], [1, 0]],
    Tromino_I: [[0, 0], [1, 0], [2, 0]],
    Tromino_L: [[0, 0], [1, 0], [0, 1]],
    Tetromino_O: [[0, 0], [1, 0], [0, 1], [1, 1]],
    Tetromino_I: [[0, 0], [1, 0], [2, 0], [3, 0]],
    Tetromino_T: [[0, 0], [1, 0], [2, 0], [1, 1]],
    Tetromino_L: [[0, 0], [1, 0], [2, 0], [0, 1]],
    Tetromino_S: [[0, 0], [1, 0], [1, 1], [2, 1]],
    Pentomino_F: [[1, 0], [2, 0], [0, 1], [1, 1], [1, 2]],
    Snakey_Hexomino: [[0, 0], [1, 0], [1, 1], [1, 2], [1, 3], [2, 3]]
};

@Component({
  selector: 'app-snakey',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './snakey.html',
  styleUrl: './snakey.css',
})
export class Snakey implements AfterViewInit {
    currentTurn = 'Maker';
    board: { [key: string]: string } = {};
    targetShapeName = 'Pentomino_F';
    gameMode = 'p_vs_ai_optimal';
    showPaving = false;
    gameOver = false;
    lastMove: {x: number, y: number, player: string} | null = null;
    aiThinking = false;
    customMakerColor = this.getDefaultColor(0);
    customBreakerColor = this.getDefaultColor(5);
    
    leanStrategyCode = '';

    updateLeanStrategyCode() {
        if (this.targetShapeName === 'Tetromino_O') {
            this.leanStrategyCode = `import Mathlib.Data.Set.Basic
import Mathlib.Tactic.SplitIfs
import Mathlib.Tactic.Omega

-- Formalization of Harary's Polyomino Strategy for Tetromino O
def Grid := Int × Int

def Paving (g : Grid) : Grid :=
  let (x, y) := g
  if y % 2 == 0 then
    if x % 2 == 0 then (x + 1, y) else (x - 1, y)
  else
    if x % 2 == 1 then (x + 1, y) else (x - 1, y)

/-- Proof that Paving is an involution: P(P(g)) = g -/
lemma paving_involution (g : Grid) : Paving (Paving g) = g := by {
  let (x, y) := g
  unfold Paving
  split_ifs <;> simp [*] <;> split_ifs <;> simp [*]
  all_goals omega
}

/-- Definition of the Tetromino_O (2x2 Square) -/
def is_square (S : Set Grid) : Prop :=
  exists x y, S = {(x, y), (x+1, y), (x, y+1), (x+1, y+1)}

/-- The optimal Breaker move is to take the paired cell of the Maker's last move. -/
def optimal_breaker_move (last_maker_move : Grid) : Grid :=
  Paving last_maker_move`;
        } else if (this.targetShapeName === 'Pentomino_F') {
            this.leanStrategyCode = `import Mathlib.Data.Set.Basic

def Grid := Int × Int

inductive StrategyTree
| win : StrategyTree
| move (m : Grid) (responses : Grid → StrategyTree) : StrategyTree

/-- Definition of the F-Pentomino -/
def Pentomino_F (x y : Int) : Set Grid :=
  {(x+1, y), (x+2, y), (x, y+1), (x+1, y+1), (x+1, y+2)}

/-- Evaluates if a StrategyTree guarantees Maker forms the F-Pentomino. -/
def winning_strategy (tree : StrategyTree) (maker_cells breaker_cells : Set Grid) : Prop :=
  match tree with
  | .win => ∃ x y, Pentomino_F x y ⊆ maker_cells
  | .move m responses =>
      m ∉ maker_cells ∧ m ∉ breaker_cells ∧
      ∀ b : Grid, b ∉ maker_cells → b ≠ m →
        winning_strategy (responses b) (insert m maker_cells) (insert b breaker_cells)

/-- Constructive strategy tree for the Pentomino F.
    Maker begins by building a dense core to maximize forking potential. -/
def pentomino_F_tree : StrategyTree :=
  .move (0, 0) fun b1 =>
    if b1 = (1, 0) then
      .move (0, 1) fun b2 =>
        if b2 = (0, -1) then
          .move (-1, 0) fun _b3 => .win -- Maker pivots left
        else
          .move (0, -1) fun _b3 => .win -- Maker expands down
    else
      .move (1, 0) fun b2 =>
        if b2 = (2, 0) then
          .move (0, 1) fun _b3 => .win -- Maker pivots up
        else
          .move (2, 0) fun _b3 => .win -- Maker expands right

/-- Harary's Theorem Classification: F-Pentomino is a loser on an infinite grid,
    meaning Maker cannot force a win (this tree is not winning under optimal play). -/
theorem maker_cannot_win_pentomino_F :
  ¬ winning_strategy pentomino_F_tree ∅ ∅ := by {
  -- Under optimal play, Breaker blocks the F-pentomino using paving/pairing strategies
  sorry
}`;
        } else if (this.targetShapeName === 'Snakey_Hexomino') {
            this.leanStrategyCode = `import Mathlib.Data.Set.Basic

def Grid := Int × Int

inductive StrategyTree
| win : StrategyTree
| move (m : Grid) (responses : Grid → StrategyTree) : StrategyTree

/-- Definition of the Snakey Hexomino -/
def Snakey_Hexomino (x y : Int) : Set Grid :=
  {(x, y), (x+1, y), (x+1, y+1), (x+1, y+2), (x+1, y+3), (x+2, y+3)}

/-- Open Problem: Does Maker win for the Snakey Hexomino? -/
axiom maker_wins_snakey :
  ∃ (tree : StrategyTree), -- If a winning tree exists, Maker wins
    (∀ (maker_cells breaker_cells : Set Grid), True) -- Placeholder constraint`;
        } else {
            this.leanStrategyCode = `import Mathlib.Data.Set.Basic

def Grid := Int × Int

-- General definition for ${this.targetShapeName}
def TargetShape (x y : Int) : Set Grid :=
  -- Set of grid coordinates relative to (x, y)
  sorry

/-- Harary's generalized tic-tac-toe statement for this shape -/
axiom maker_wins_shape :
  ∃ (tree : StrategyTree),
    -- Represents game states where Maker forces a win
    True`;
        }
    }

    // Compete Mode
    competeMode = false;
    totalMoves = 0;
    finalScore = 0;
    playerName = '';
    showScoreSubmit = false;
    submittingScore = false;
    firstMoveCenter = false;

    @HostBinding('style.--maker-color') get getMakerColor() { return this.customMakerColor; }
    @HostBinding('style.--breaker-color') get getBreakerColor() { return this.customBreakerColor; }

    cellSize = 40;
    gridSize = 20;
    margin = 20;

    svg: any;
    g: any;
    pavingG: any;
    gridG: any;
    piecesG: any;
    winHighlightG: any;

    constructor(
        @Inject(PLATFORM_ID) private platformId: Object,
        private router: Router,
        private http: HttpClient
    ) {}

    ngAfterViewInit() {
        try {
            if (isPlatformBrowser(this.platformId)) {
                this.initD3();
                this.init();
            }
        } catch (e: any) {
            console.error(e);
            alert("Error in ngAfterViewInit: " + e.message + "\n\n" + e.stack);
        }
    }

    getDefaultColor(playerOffset: number = 0) {
        const vtColors = [
            '#FFFF00', // yellow
            '#FFA500', // orange
            '#FF0000', // red
            '#800080', // purple
            '#008000', // green
            '#0000FF', // blue
            '#A52A2A', // brown
            '#000000', // black
            '#00FFFF', // cyan
            '#FFC0CB', // pink
            '#00FF00', // lime
            '#FF1493'  // deeppink
        ];
        
        // Base it on the day of the month (1-31)
        let num = new Date().getDate();
        
        // If it's the second player, maybe invert the bits (up to 5 bits for 31) 
        // or just add an offset so they don't get the same color.
        if (playerOffset > 0) {
            num = (~num & 0x1F); // 5-bit inversion
        }
        
        // VT Checksum logic: write the number in binary (padded to 5 bits)
        // and calculate sum of (i * x_i) using 1-indexed position from right-to-left
        const binStr = num.toString(2).padStart(5, '0');
        let checksum = 0;
        for (let i = 0; i < binStr.length; i++) {
            if (binStr[binStr.length - 1 - i] === '1') {
                checksum += (i + 1); // 1-indexed position from right
            }
        }
        
        return vtColors[checksum % 12];
    }

    onMakerColorChange(newColor: string) {
        this.customMakerColor = newColor;
    }

    onBreakerColorChange(newColor: string) {
        this.customBreakerColor = newColor;
    }

    initD3() {
        const fullSize = this.gridSize * this.cellSize + this.margin * 2;
        this.svg = d3.select("#grid-svg")
            .attr("viewBox", `0 0 ${fullSize} ${fullSize}`)
            .attr("preserveAspectRatio", "xMidYMid meet");

        this.g = this.svg.append("g")
            .attr("transform", `translate(${this.margin}, ${this.margin})`);

        this.pavingG = this.g.append("g").attr("id", "paving-layer");
        this.gridG = this.g.append("g").attr("id", "grid-layer");
        this.piecesG = this.g.append("g").attr("id", "pieces-layer");
        this.winHighlightG = this.g.append("g").attr("id", "win-highlight-layer");
    }

    get turnDisplayText() {
        let text = this.currentTurn;
        if (this.aiThinking) text += " (Thinking...)";
        return text;
    }

    onShapeChange(event: any) {
        this.targetShapeName = event.target.value;
        this.updateLeanStrategyCode();
        this.updatePreview();
        this.resetGame();
    }

    onGameModeChange(event: any) {
        this.gameMode = event.target.value;
        this.resetGame();
    }

    togglePaving() {
        this.showPaving = !this.showPaving;
        this.drawPaving();
    }

    resetGame() {
        this.board = {};
        this.currentTurn = 'Maker';
        this.gameOver = false;
        this.lastMove = null;
        this.aiThinking = false;
        this.totalMoves = 0;
        this.showScoreSubmit = false;
        this.firstMoveCenter = false;
        if (this.piecesG) this.piecesG.selectAll("*").remove();
        if (this.winHighlightG) this.winHighlightG.selectAll("*").remove();
        this.checkAITurn();
    }

    init() {
        this.updateLeanStrategyCode();
        this.drawGrid();
        this.updatePreview();
        this.drawPaving();
        this.checkAITurn();
    }

    seededRandom() {
        return Math.random();
    }

    getOrientations(shape: number[][]) {
        const orientations: number[][][] = [];
        let current = shape.map(p => [...p]);

        for (let r = 0; r < 4; r++) {
            current = current.map(([x, y]) => [-y, x]);
            orientations.push(this.normalize(current));
            
            const reflected = current.map(([x, y]) => [-x, y]);
            orientations.push(this.normalize(reflected));
        }
        
        const seen = new Set();
        return orientations.filter(o => {
            const key = JSON.stringify(o.sort((a, b) => a[0] - b[0] || a[1] - b[1]));
            if (seen.has(key)) return false;
            seen.add(key);
            return true;
        });
    }

    normalize(shape: number[][]) {
        const minX = Math.min(...shape.map(p => p[0]));
        const minY = Math.min(...shape.map(p => p[1]));
        return shape.map(([x, y]) => [x - minX, y - minY]);
    }

    checkWin(player: string) {
        const ObjectKeys = Object.keys(this.board);
        const playerPoints = ObjectKeys
            .filter(k => this.board[k] === player)
            .map(k => k.split(',').map(Number));

        if (playerPoints.length === 0) return null;

        const orientations = this.getOrientations(SHAPES[this.targetShapeName]);

        for (let point of playerPoints) {
            for (let orientation of orientations) {
                const [ox0, oy0] = orientation[0];
                const originX = point[0] - ox0;
                const originY = point[1] - oy0;
                
                let allPresent = true;
                let currentShapePoints = [];
                
                for (let [ox, oy] of orientation) {
                    const targetX = originX + ox;
                    const targetY = originY + oy;
                    if (this.board[`${targetX},${targetY}`] !== player) {
                        allPresent = false;
                        break;
                    }
                    currentShapePoints.push([targetX, targetY]);
                }

                if (allPresent) return currentShapePoints;
            }
        }
        return null;
    }

    drawGrid() {
        const cells = [];
        for (let i = 0; i < this.gridSize; i++) {
            for (let j = 0; j < this.gridSize; j++) {
                cells.push({x: i, y: j});
            }
        }

        const cellSelection = this.gridG.selectAll(".cell")
            .data(cells, (d: any) => `${d.x},${d.y}`);

        cellSelection.enter()
            .append("rect")
            .attr("class", "cell")
            .attr("x", (d: any) => d.x * this.cellSize)
            .attr("y", (d: any) => d.y * this.cellSize)
            .attr("width", this.cellSize)
            .attr("height", this.cellSize)
            .on("click", (event: any, d: any) => this.handleCellClick(d.x, d.y));
    }

    aiMove() {
        if (this.gameOver) return;
        
        this.aiThinking = true;

        let aiPlayer = this.currentTurn;
        let mode = (this.gameMode.includes('optimal')) ? 'optimal' : 'random';
        
        let validCells = [];
        for (let x = 0; x < this.gridSize; x++) {
            for (let y = 0; y < this.gridSize; y++) {
                if (!this.board[`${x},${y}`]) validCells.push({x, y});
            }
        }
        
        if (validCells.length === 0) {
            this.aiThinking = false;
            return;
        }
        
        let selectedCell: any = null;
        
        if (mode === 'random') {
            let adjacentCells = [];
            for (let cell of validCells) {
                let isAdj = false;
                let dirs = [[0,1], [0,-1], [1,0], [-1,0]];
                for (let [dx, dy] of dirs) {
                    if (this.board[`${cell.x + dx},${cell.y + dy}`] === 'Maker') {
                        isAdj = true;
                        break;
                    }
                }
                if (isAdj) adjacentCells.push(cell);
            }
            
            let pool = adjacentCells.length > 0 ? adjacentCells : validCells;
            selectedCell = pool[Math.floor(this.seededRandom() * pool.length)];
        } else {
            selectedCell = this.getOptimalMove(aiPlayer, validCells);
        }
        
        if (selectedCell) {
            setTimeout(() => {
                this.aiThinking = false;
                this.handleCellClick(selectedCell.x, selectedCell.y, true);
            }, 600);
        } else {
            this.aiThinking = false;
        }
    }

    evaluateBoard(boardState: { [key: string]: string }): number {
        const orientations = this.getOrientations(SHAPES[this.targetShapeName]);
        const n = SHAPES[this.targetShapeName].length;
        let totalScore = 0;
        
        let minX = this.gridSize, maxX = 0, minY = this.gridSize, maxY = 0;
        let hasPieces = false;
        for (let x = 0; x < this.gridSize; x++) {
            for (let y = 0; y < this.gridSize; y++) {
                if (boardState[`${x},${y}`]) {
                    hasPieces = true;
                    if (x < minX) minX = x;
                    if (x > maxX) maxX = x;
                    if (y < minY) minY = y;
                    if (y > maxY) maxY = y;
                }
            }
        }
        
        if (!hasPieces) {
            return 0;
        }
        
        const margin = 2;
        const evalMinX = Math.max(0, minX - margin);
        const evalMaxX = Math.min(this.gridSize - 1, maxX + margin);
        const evalMinY = Math.max(0, minY - margin);
        const evalMaxY = Math.min(this.gridSize - 1, maxY + margin);
        
        for (let x = evalMinX; x <= evalMaxX; x++) {
            for (let y = evalMinY; y <= evalMaxY; y++) {
                for (let orientation of orientations) {
                    let m = 0;
                    let b = 0;
                    let valid = true;
                    
                    for (let [ox, oy] of orientation) {
                        let tx = x + ox;
                        let ty = y + oy;
                        if (tx < 0 || tx >= this.gridSize || ty < 0 || ty >= this.gridSize) {
                            valid = false;
                            break;
                        }
                        let owner = boardState[`${tx},${ty}`];
                        if (owner === 'Maker') m++;
                        else if (owner === 'Breaker') b++;
                    }
                    
                    if (!valid) continue;
                    
                    if (b === 0) {
                        if (m === n) {
                            return 10000000; // Win
                        }
                        totalScore += Math.pow(10, m);
                    }
                }
            }
        }
        
        return totalScore;
    }

    minimax(boardState: { [key: string]: string }, depth: number, alpha: number, beta: number, isMaximizing: boolean): { score: number, move: {x: number, y: number} | null } {
        const currentEval = this.evaluateBoard(boardState);
        if (depth === 0 || currentEval >= 10000000) {
            return { score: currentEval, move: null };
        }
        
        let validMoves: {x: number, y: number}[] = [];
        let minX = this.gridSize, maxX = 0, minY = this.gridSize, maxY = 0;
        let hasPieces = false;
        
        for (let x = 0; x < this.gridSize; x++) {
            for (let y = 0; y < this.gridSize; y++) {
                if (boardState[`${x},${y}`]) {
                    hasPieces = true;
                    if (x < minX) minX = x;
                    if (x > maxX) maxX = x;
                    if (y < minY) minY = y;
                    if (y > maxY) maxY = y;
                }
            }
        }
        
        const cx = Math.floor(this.gridSize / 2);
        const cy = Math.floor(this.gridSize / 2);
        
        if (!hasPieces) {
            return { score: 0, move: { x: cx, y: cy } };
        }
        
        const searchMinX = Math.max(0, minX - 2);
        const searchMaxX = Math.min(this.gridSize - 1, maxX + 2);
        const searchMinY = Math.max(0, minY - 2);
        const searchMaxY = Math.min(this.gridSize - 1, maxY + 2);
        
        for (let x = searchMinX; x <= searchMaxX; x++) {
            for (let y = searchMinY; y <= searchMaxY; y++) {
                if (!boardState[`${x},${y}`]) {
                    validMoves.push({x, y});
                }
            }
        }
        
        if (validMoves.length === 0) {
            return { score: currentEval, move: null };
        }
        
        // Sort moves to optimize alpha-beta cuts
        validMoves.sort((a, b) => {
            let countA = 0, countB = 0;
            const dirs = [[0,1], [0,-1], [1,0], [-1,0]];
            for (let [dx, dy] of dirs) {
                if (boardState[`${a.x + dx},${a.y + dy}`]) countA++;
                if (boardState[`${b.x + dx},${b.y + dy}`]) countB++;
            }
            return countB - countA;
        });
        
        let bestMove: {x: number, y: number} | null = null;
        
        if (isMaximizing) {
            let maxEval = -Infinity;
            for (let move of validMoves) {
                const key = `${move.x},${move.y}`;
                boardState[key] = 'Maker';
                const evaluation = this.minimax(boardState, depth - 1, alpha, beta, false).score;
                delete boardState[key];
                
                if (evaluation > maxEval) {
                    maxEval = evaluation;
                    bestMove = move;
                } else if (evaluation === maxEval && bestMove) {
                    const distA = Math.abs(move.x - cx) + Math.abs(move.y - cy);
                    const distB = Math.abs(bestMove.x - cx) + Math.abs(bestMove.y - cy);
                    if (distA < distB) {
                        bestMove = move;
                    }
                }
                alpha = Math.max(alpha, evaluation);
                if (beta <= alpha) {
                    break;
                }
            }
            return { score: maxEval, move: bestMove };
        } else {
            let minEval = Infinity;
            for (let move of validMoves) {
                const key = `${move.x},${move.y}`;
                boardState[key] = 'Breaker';
                const evaluation = this.minimax(boardState, depth - 1, alpha, beta, true).score;
                delete boardState[key];
                
                if (evaluation < minEval) {
                    minEval = evaluation;
                    bestMove = move;
                } else if (evaluation === minEval && bestMove) {
                    const distA = Math.abs(move.x - cx) + Math.abs(move.y - cy);
                    const distB = Math.abs(bestMove.x - cx) + Math.abs(bestMove.y - cy);
                    if (distA < distB) {
                        bestMove = move;
                    }
                }
                beta = Math.min(beta, evaluation);
                if (beta <= alpha) {
                    break;
                }
            }
            return { score: minEval, move: bestMove };
        }
    }

    getOptimalMove(player: string, validCells: any[]) {
        if (player === 'Breaker' && this.targetShapeName === 'Tetromino_O' && this.lastMove && this.lastMove.player === 'Maker') {
            let x = this.lastMove.x;
            let y = this.lastMove.y;
            let px, py;
            if (y % 2 === 0) {
                px = (x % 2 === 0) ? x + 1 : x - 1;
            } else {
                px = (x % 2 === 1) ? x + 1 : x - 1;
            }
            py = y;
            if (px >= 0 && px < this.gridSize && !this.board[`${px},${py}`]) {
                return {x: px, y: py};
            }
        }
        
        const depth = 2; // 2-ply lookahead
        const isMaximizing = (player === 'Maker');
        
        // Use a copy of board for minimax simulation
        const boardCopy = { ...this.board };
        const result = this.minimax(boardCopy, depth, -Infinity, Infinity, isMaximizing);
        
        if (result.move) {
            return result.move;
        }
        
        if (validCells.length > 0) {
            return validCells[Math.floor(this.seededRandom() * validCells.length)];
        }
        return null;
    }

    checkAITurn() {
        if (this.gameOver) return;
        const isAITurn = (this.gameMode === 'p_vs_ai_random' || this.gameMode === 'p_vs_ai_optimal') && this.currentTurn === 'Breaker' ||
                         (this.gameMode === 'ai_random_vs_p' || this.gameMode === 'ai_optimal_vs_p') && this.currentTurn === 'Maker' ||
                         (this.gameMode === 'ai_optimal_vs_ai_optimal');
                         
        if (isAITurn) {
            this.aiMove();
        }
    }

    handleCellClick(x: number, y: number, isAI = false) {
        if (this.gameOver) return;
        
        const isAITurn = (this.gameMode === 'p_vs_ai_random' || this.gameMode === 'p_vs_ai_optimal') && this.currentTurn === 'Breaker' ||
                         (this.gameMode === 'ai_random_vs_p' || this.gameMode === 'ai_optimal_vs_p') && this.currentTurn === 'Maker' ||
                         (this.gameMode === 'ai_optimal_vs_ai_optimal');
                         
        if (isAITurn && !isAI) return;

        const key = `${x},${y}`;
        if (this.board[key]) return;

        if (this.totalMoves === 0) {
            // Check if first move is in the 2x2 center of the 20x20 grid (x: 9 or 10, y: 9 or 10)
            if ((x === 9 || x === 10) && (y === 9 || y === 10)) {
                this.firstMoveCenter = true;
            }
        }

        this.board[key] = this.currentTurn;
        this.lastMove = {x, y, player: this.currentTurn};
        this.totalMoves++;
        this.renderPieces();

        const winPoints = this.checkWin(this.currentTurn);
        if (winPoints) {
            this.gameOver = true;
            this.highlightWin(winPoints);
            this.calculateScore(this.currentTurn);
            return;
        }

        this.currentTurn = this.currentTurn === 'Maker' ? 'Breaker' : 'Maker';
        
        this.checkAITurn();
    }

    renderPieces() {
        const pieces = Object.entries(this.board).map(([key, player]) => {
            const [x, y] = key.split(',').map(Number);
            return {x, y, player};
        });

        const pieceSelection = this.piecesG.selectAll(".piece")
            .data(pieces, (d: any) => `${d.x},${d.y}`);

        pieceSelection.enter()
            .append("circle")
            .attr("class", (d: any) => `piece ${d.player.toLowerCase()}-piece`)
            .attr("cx", (d: any) => d.x * this.cellSize + this.cellSize / 2)
            .attr("cy", (d: any) => d.y * this.cellSize + this.cellSize / 2)
            .attr("r", 0)
            .transition()
            .duration(300)
            .attr("r", this.cellSize * 0.35);

        pieceSelection.exit().remove();
    }

    highlightWin(points: any[]) {
        this.winHighlightG.selectAll(".winning-highlight")
            .data(points)
            .enter()
            .append("rect")
            .attr("class", "winning-highlight")
            .attr("x", (d: any) => d[0] * this.cellSize)
            .attr("y", (d: any) => d[1] * this.cellSize)
            .attr("width", this.cellSize)
            .attr("height", this.cellSize)
            .attr("rx", 4)
            .style("opacity", 0)
            .transition()
            .duration(500)
            .style("opacity", 1);
    }

    updatePreview() {
        const shape = SHAPES[this.targetShapeName];
        const previews = d3.selectAll(".shape-preview");
        previews.selectAll("*").remove();

        const minX = Math.min(...shape.map(p => p[0]));
        const maxX = Math.max(...shape.map(p => p[0]));
        const minY = Math.min(...shape.map(p => p[1]));
        const maxY = Math.max(...shape.map(p => p[1]));
        
        const width = maxX - minX + 1;
        const height = maxY - minY + 1;
        const offsetX = Math.floor((5 - width) / 2);
        const offsetY = Math.floor((5 - height) / 2);

        previews.each(function() {
            const p = d3.select(this);
            for (let y = 0; y < 5; y++) {
                for (let x = 0; x < 5; x++) {
                    const isActive = shape.some(p => p[0] - minX + offsetX === x && p[1] - minY + offsetY === y);
                    p.append("div")
                        .attr("class", `preview-cell ${isActive ? 'active' : ''}`);
                }
            }
        });
    }

    drawPaving() {
        this.pavingG.selectAll("*").remove();
        if (!this.showPaving) return;

        for (let y = 0; y < this.gridSize; y++) {
            for (let x = 0; x < this.gridSize - 1; x++) {
                const isPairStart = (y % 2 === 0 && x % 2 === 0) || (y % 2 === 1 && x % 2 === 1);
                if (isPairStart) {
                    this.pavingG.append("rect")
                        .attr("class", "paving-pair")
                        .attr("x", x * this.cellSize + 4)
                        .attr("y", y * this.cellSize + 4)
                        .attr("width", this.cellSize * 2 - 8)
                        .attr("height", this.cellSize - 8)
                        .attr("rx", 4);
                }
            }
        }
    }

    goHome() {
        this.router.navigate(['/']);
    }

    toggleCompeteMode() {
        this.competeMode = !this.competeMode;
        if (this.competeMode) {
            // Force Optimal AI for competition
            if (this.gameMode === 'pvp' || this.gameMode.includes('random')) {
                this.gameMode = 'p_vs_ai_optimal';
            }
        }
        this.resetGame();
    }

    calculateScore(winner: string) {
        if (!this.competeMode) return;

        const n = SHAPES[this.targetShapeName].length;
        let base = n; // Base score is simply n
        
        let multi = 1;
        if (this.gameMode.includes('optimal')) {
            const complexity = this.getOrientations(SHAPES[this.targetShapeName]).length;
            multi = n + complexity;
        }
        
        let moveScore = 0;
        if (winner === 'Maker') {
            moveScore = Math.max(0, 100 - this.totalMoves);
        } else {
            moveScore = this.totalMoves;
        }
        
        // Calculate the core score and multiply it
        this.finalScore = (base + moveScore) * multi;
        
        // Apply bonuses AFTER the multiplier so scores don't always end in 0 or 5!
        
        // +1 bonus for changing either color
        if (this.customMakerColor !== this.getDefaultColor(0) || this.customBreakerColor !== this.getDefaultColor(5)) {
            this.finalScore += 1;
        }

        // +2 bonus for starting in the center
        if (this.firstMoveCenter) {
            this.finalScore += 2;
        }

        // +3 bonus for optimal minimum number of moves
        if (this.totalMoves === 2 * n - 1) {
            this.finalScore += 3;
        }
        
        const isPlayerWinner = (winner === 'Maker' && this.gameMode.startsWith('p_vs_ai')) ||
                               (winner === 'Breaker' && this.gameMode.startsWith('ai_'));
        
        if (isPlayerWinner) {
            this.showScoreSubmit = true;
        }
    }

    submitScore() {
        if (!this.playerName) {
            alert('Please enter your name!');
            return;
        }
        this.submittingScore = true;
        const n = SHAPES[this.targetShapeName].length;
        
        this.http.post('/api/game-fame', {
            name: this.playerName,
            score: this.finalScore,
            level: n,
            game: 'snakey'
        }).subscribe({
            next: () => {
                this.submittingScore = false;
                this.showScoreSubmit = false;
                alert('Congratulations! Your score has been added to the Hall of Fame.');
            },
            error: (err) => {
                console.error('Fame error:', err);
                this.submittingScore = false;
                alert('Error submitting score. Check console.');
            }
        });
    }
}
