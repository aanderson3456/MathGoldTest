import { Component, AfterViewInit, HostBinding, Inject, PLATFORM_ID, ChangeDetectorRef } from '@angular/core';
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
    pythonStrategyCode = '';
    evaluatingPython = false;
    evalResult: any = null;
    executionLogs: string[] = [];
    autoPlaying = false;
    autoPlayTimeout: any;

    updatePythonStrategyCode() {
        if (this.targetShapeName === 'Tetromino_O' || this.targetShapeName === 'Pentomino_F') {
            this.pythonStrategyCode = `def get_move(board_state, current_turn):
    import random
    
    # 1. Define the target shape relative coordinates
    if '${this.targetShapeName}' == 'Pentomino_F':
        target_shape = [(0, 0), (1, 0), (-1, 1), (0, 1), (0, 2)]
    else: # Tetromino_O
        target_shape = [(0, 0), (1, 0), (0, 1), (1, 1)]
    n = len(target_shape)
    
    # Generate all 8 orientations
    def get_orientations(shape):
        orientations = []
        for flip_x in [1, -1]:
            for flip_y in [1, -1]:
                for swap in [False, True]:
                    o = []
                    for (x, y) in shape:
                        nx, ny = x * flip_x, y * flip_y
                        if swap: nx, ny = ny, nx
                        o.append((nx, ny))
                    min_x = min(c[0] for c in o)
                    min_y = min(c[1] for c in o)
                    norm = tuple(sorted(((c[0] - min_x, c[1] - min_y) for c in o)))
                    if norm not in orientations: orientations.append(norm)
        return orientations
        
    orientations = get_orientations(target_shape)
    grid_size = 20
    
    def evaluate(board):
        min_x, max_x, min_y, max_y = grid_size, 0, grid_size, 0
        has_pieces = False
        for k in board:
            x, y = map(int, k.split(','))
            has_pieces = True
            min_x, max_x = min(min_x, x), max(max_x, x)
            min_y, max_y = min(min_y, y), max(max_y, y)
            
        if not has_pieces: return 0
        
        score = 0
        for x in range(max(0, min_x - 2), min(grid_size, max_x + 3)):
            for y in range(max(0, min_y - 2), min(grid_size, max_y + 3)):
                for o in orientations:
                    m, b = 0, 0
                    valid = True
                    for ox, oy in o:
                        tx, ty = x + ox, y + oy
                        if tx < 0 or tx >= grid_size or ty < 0 or ty >= grid_size:
                            valid = False; break
                        owner = board.get(f"{tx},{ty}")
                        if owner == 'Maker': m += 1
                        elif owner == 'Breaker': b += 1
                    
                    if not valid: continue
                    if b == 0:
                        if m == n: return 10000000 # Win
                        score += 10 ** m
        return score

    def minimax(board, depth, alpha, beta, is_maximizing):
        cur_eval = evaluate(board)
        if depth == 0 or cur_eval >= 10000000:
            return cur_eval, None
            
        valid_moves = []
        min_x, max_x, min_y, max_y = grid_size, 0, grid_size, 0
        has_pieces = False
        for k in board:
            x, y = map(int, k.split(','))
            has_pieces = True
            min_x, max_x = min(min_x, x), max(max_x, x)
            min_y, max_y = min(min_y, y), max(max_y, y)
            
        if not has_pieces:
            return 0, (grid_size//2, grid_size//2)
            
        for x in range(max(0, min_x - 2), min(grid_size, max_x + 3)):
            for y in range(max(0, min_y - 2), min(grid_size, max_y + 3)):
                if f"{x},{y}" not in board:
                    valid_moves.append((x, y))
                    
        if not valid_moves: return cur_eval, None
        
        def count_adj(x, y):
            c = 0
            for dx, dy in [(0,1), (0,-1), (1,0), (-1,0)]:
                if f"{x+dx},{y+dy}" in board: c += 1
            return c
        valid_moves.sort(key=lambda m: -count_adj(m[0], m[1]))
        
        best_move = None
        if is_maximizing:
            max_eval = -float('inf')
            for mx, my in valid_moves:
                k = f"{mx},{my}"
                board[k] = 'Maker'
                ev, _ = minimax(board, depth - 1, alpha, beta, False)
                del board[k]
                if ev > max_eval:
                    max_eval = ev
                    best_move = (mx, my)
                alpha = max(alpha, ev)
                if beta <= alpha: break
            return max_eval, best_move
        else:
            min_eval = float('inf')
            for mx, my in valid_moves:
                k = f"{mx},{my}"
                board[k] = 'Breaker'
                ev, _ = minimax(board, depth - 1, alpha, beta, True)
                del board[k]
                if ev < min_eval:
                    min_eval = ev
                    best_move = (mx, my)
                beta = min(beta, ev)
                if beta <= alpha: break
            return min_eval, best_move

    print(f"[{current_turn}] Evaluating board using Python Minimax (Depth 2)...")
    is_max = (current_turn == 'Maker')
    score, best_move = minimax(board_state, 2, -float('inf'), float('inf'), is_max)
    
    if best_move:
        print(f"[{current_turn}] Optimal move found at {best_move} (Score {score})")
        return {"x": best_move[0], "y": best_move[1]}
        
    print(f"[{current_turn}] No optimal move found. Falling back to random.")
    valid = []
    for x in range(grid_size):
        for y in range(grid_size):
            if f"{x},{y}" not in board_state: valid.append({"x": x, "y": y})
    if valid: return random.choice(valid)
    return None`;
        } else if (this.targetShapeName === 'Snakey_Hexomino') {
            this.pythonStrategyCode = `def get_move(board_state, current_turn):
    # Strategy for Pentomino F
    valid_cells = []
    for x in range(20):
        for y in range(20):
            if f"{x},{y}" not in board_state:
                valid_cells.append({"x": x, "y": y})
                
    import random
    if valid_cells:
        return random.choice(valid_cells)
    return None`;
        } else if (this.targetShapeName === 'Snakey_Hexomino') {
            this.pythonStrategyCode = `def get_move(board_state, current_turn):
    # Strategy for Snakey Hexomino (Unsolved!)
    valid_cells = []
    for x in range(20):
        for y in range(20):
            if f"{x},{y}" not in board_state:
                valid_cells.append({"x": x, "y": y})
                
    import random
    if valid_cells:
        return random.choice(valid_cells)
    return None`;
        } else {
            this.pythonStrategyCode = `def get_move(board_state, current_turn):
    # General strategy
    valid_cells = []
    for x in range(20):
        for y in range(20):
            if f"{x},{y}" not in board_state:
                valid_cells.append({"x": x, "y": y})
                
    import random
    if valid_cells:
        return random.choice(valid_cells)
    return None`;
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
        private http: HttpClient,
        private cdr: ChangeDetectorRef
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
        this.updatePythonStrategyCode();
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
        this.autoPlaying = false;
        if (this.autoPlayTimeout) clearTimeout(this.autoPlayTimeout);
        
        if (this.piecesG) this.piecesG.selectAll("*").remove();
        if (this.winHighlightG) this.winHighlightG.selectAll("*").remove();
        
        this.drawGrid();
        this.drawPaving();
        
        const turnDisplay = document.getElementById('turn-display');
        if (turnDisplay) {
            turnDisplay.className = 'status-value turn-maker';
        }
        
        this.checkAITurn();
    }

    init() {
        this.updatePythonStrategyCode();
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
        let mode = 'random';
        if (this.gameMode.includes('optimal')) mode = 'optimal';
        if (this.gameMode.includes('custom')) mode = 'custom';
        
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
        } else if (mode === 'optimal') {
            selectedCell = this.getOptimalMove(aiPlayer, validCells);
        } else if (mode === 'custom') {
            this.http.post('/api/get-move', {
                board_state: this.board,
                current_turn: this.currentTurn,
                code: this.pythonStrategyCode
            }).subscribe({
                next: (res: any) => {
                    if (res.status === 'success' && res.move && res.move.x !== undefined) {
                        this.aiThinking = false;
                        if (res.logs) {
                            this.executionLogs.push(res.logs);
                        }
                        this.handleCellClick(res.move.x, res.move.y, true);
                    } else {
                        console.error('Custom AI returned invalid move:', res);
                        if (res.logs) this.executionLogs.push(res.logs);
                        // Fallback to random if custom fails
                        let fallback = validCells[Math.floor(this.seededRandom() * validCells.length)];
                        this.aiThinking = false;
                        this.handleCellClick(fallback.x, fallback.y, true);
                    }
                    this.cdr.detectChanges();
                },
                error: (err) => {
                    console.error('Custom AI error:', err);
                    // Fallback to random
                    let fallback = validCells[Math.floor(this.seededRandom() * validCells.length)];
                    this.aiThinking = false;
                    this.handleCellClick(fallback.x, fallback.y, true);
                }
            });
            return; // We return here because handleCellClick is called asynchronously
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
        
        const isMakerAITurn = (this.gameMode === 'ai_random_vs_p' || this.gameMode === 'ai_optimal_vs_p' || this.gameMode === 'ai_custom_vs_p' || this.gameMode === 'ai_custom_vs_ai_optimal' || this.gameMode === 'ai_optimal_vs_ai_custom' || this.gameMode === 'ai_optimal_vs_ai_optimal') && this.currentTurn === 'Maker';
        const isBreakerAITurn = (this.gameMode === 'p_vs_ai_random' || this.gameMode === 'p_vs_ai_optimal' || this.gameMode === 'p_vs_ai_custom' || this.gameMode === 'ai_custom_vs_ai_optimal' || this.gameMode === 'ai_optimal_vs_ai_custom' || this.gameMode === 'ai_optimal_vs_ai_optimal') && this.currentTurn === 'Breaker';
                         
        if (isMakerAITurn || isBreakerAITurn) {
            if (this.autoPlaying) {
                this.autoPlayTimeout = setTimeout(() => {
                    this.aiMove();
                }, 500); // 500ms delay for visual effect
            } else {
                this.aiMove();
            }
        }
    }

    handleCellClick(x: number, y: number, isAI = false) {
        if (this.gameOver) return;
        
        const isMakerAITurn = (this.gameMode === 'ai_random_vs_p' || this.gameMode === 'ai_optimal_vs_p' || this.gameMode === 'ai_custom_vs_p' || this.gameMode === 'ai_custom_vs_ai_optimal' || this.gameMode === 'ai_optimal_vs_ai_custom' || this.gameMode === 'ai_optimal_vs_ai_optimal') && this.currentTurn === 'Maker';
        const isBreakerAITurn = (this.gameMode === 'p_vs_ai_random' || this.gameMode === 'p_vs_ai_optimal' || this.gameMode === 'p_vs_ai_custom' || this.gameMode === 'ai_custom_vs_ai_optimal' || this.gameMode === 'ai_optimal_vs_ai_custom' || this.gameMode === 'ai_optimal_vs_ai_optimal') && this.currentTurn === 'Breaker';
                         
        if ((isMakerAITurn || isBreakerAITurn) && !isAI) return;

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

    isAiVsAiMode(): boolean {
        return ['ai_optimal_vs_ai_optimal', 'ai_custom_vs_ai_optimal', 'ai_optimal_vs_ai_custom'].includes(this.gameMode);
    }
    
    toggleAutoPlay() {
        this.autoPlaying = !this.autoPlaying;
        if (this.autoPlaying) {
            this.checkAITurn();
        } else {
            if (this.autoPlayTimeout) {
                clearTimeout(this.autoPlayTimeout);
            }
        }
    }

    evaluatePythonStrategy() {
        this.evaluatingPython = true;
        this.evalResult = null;
        
        this.http.post('/api/evaluate', {
            code: this.pythonStrategyCode,
            targetShape: this.targetShapeName
        }).subscribe({
            next: (res) => {
                this.evaluatingPython = false;
                this.evalResult = res;
                this.cdr.detectChanges();
            },
            error: (err) => {
                this.evaluatingPython = false;
                this.evalResult = { status: 'error', message: 'API Error', logs: err.message };
                this.cdr.detectChanges();
            }
        });
    }

    handleTab(event: KeyboardEvent) {
        if (event.key === 'Tab') {
            event.preventDefault();
            const textarea = event.target as HTMLTextAreaElement;
            const start = textarea.selectionStart;
            const end = textarea.selectionEnd;
            
            // Insert 4 spaces
            this.pythonStrategyCode = this.pythonStrategyCode.substring(0, start) + "    " + this.pythonStrategyCode.substring(end);
            
            // Put cursor at right position again
            setTimeout(() => {
                textarea.selectionStart = textarea.selectionEnd = start + 4;
            });
        }
    }
}
