import sys
import json
import traceback

def check_win(board, player, shape_name):
    if shape_name == 'Pentomino_F':
        target_shape = [(0, 0), (1, 0), (-1, 1), (0, 1), (0, 2)]
    else: 
        target_shape = [(0, 0), (1, 0), (0, 1), (1, 1)]
    
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
    player_points = [list(map(int, k.split(','))) for k, v in board.items() if v == player]
    
    for p in player_points:
        for o in orientations:
            ox0, oy0 = o[0]
            originX = p[0] - ox0
            originY = p[1] - oy0
            
            all_present = True
            for ox, oy in o:
                tx, ty = originX + ox, originY + oy
                if board.get(f"{tx},{ty}") != player:
                    all_present = False
                    break
            if all_present: return True
    return False

def play_game(code1, code2, shape_name):
    env1 = {}
    env2 = {}
    try:
        exec(code1, env1)
    except Exception:
        return 'Breaker' # maker failed to compile
        
    try:
        exec(code2, env2)
    except Exception:
        return 'Maker' # breaker failed to compile
    
    get_move1 = env1.get('get_move')
    get_move2 = env2.get('get_move')
    
    if not get_move1: return 'Breaker'
    if not get_move2: return 'Maker'
    
    board = {}
    current_turn = 'Maker'
    
    for i in range(50):
        try:
            if current_turn == 'Maker':
                move = get_move1(board.copy(), current_turn)
            else:
                move = get_move2(board.copy(), current_turn)
                
            if not move or f"{move['x']},{move['y']}" in board:
                return 'Breaker' if current_turn == 'Maker' else 'Maker'
                
            board[f"{move['x']},{move['y']}"] = current_turn
            
            if check_win(board, current_turn, shape_name):
                return current_turn
                
            current_turn = 'Breaker' if current_turn == 'Maker' else 'Maker'
        except Exception:
            return 'Breaker' if current_turn == 'Maker' else 'Maker'
            
    return 'Draw'

if __name__ == '__main__':
    with open('/app/code1.py', 'r') as f:
        code1 = f.read()
    with open('/app/code2.py', 'r') as f:
        code2 = f.read()
    
    shape = 'Pentomino_F'
    winner = play_game(code1, code2, shape)
    print(json.dumps({"winner": winner}))
