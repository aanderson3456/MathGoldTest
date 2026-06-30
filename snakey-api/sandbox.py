import tempfile
import subprocess
import os
import json

def run_match_in_sandbox(code1, code2, target_shape='Pentomino_F'):
    with tempfile.TemporaryDirectory() as tmpdir:
        # Write the scripts
        with open(os.path.join(tmpdir, "code1.py"), "w") as f:
            f.write(code1)
        with open(os.path.join(tmpdir, "code2.py"), "w") as f:
            f.write(code2)
            
        # Copy the runner script
        runner_path = os.path.join(os.path.dirname(__file__), "tournament_runner.py")
        with open(runner_path, "r") as f:
            runner_code = f.read()
        with open(os.path.join(tmpdir, "tournament_runner.py"), "w") as f:
            f.write(runner_code)
            
        # Run Docker command
        # Mounting the temp dir to /app inside the container
        # Setting a 5 second timeout
        cmd = [
            "docker", "run", "--rm",
            "--network", "none",
            "-v", f"{tmpdir}:/app",
            "python:3.10-slim",
            "timeout", "5", "python", "/app/tournament_runner.py"
        ]
        
        try:
            result = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
            if result.returncode != 0:
                print(f"Docker Error: {result.stderr}")
                return "Draw" # Default to draw on timeout or error
            
            output = result.stdout.strip()
            # output might have other print statements, find the json part
            for line in reversed(output.split('\n')):
                try:
                    data = json.loads(line)
                    if "winner" in data:
                        return data["winner"]
                except:
                    pass
            return "Draw"
        except subprocess.TimeoutExpired:
            return "Draw"
        except Exception as e:
            print(f"Sandbox Exception: {e}")
            return "Draw"
