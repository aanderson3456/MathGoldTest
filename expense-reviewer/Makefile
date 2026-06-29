.PHONY: install playground generate-traces grade

install:
	uv venv
	uv pip install -e .

playground:
	uv run uvicorn app.fast_api_app:app --host 0.0.0.0 --port 8080

generate-traces:
	PYTHONPATH=. uv run python tests/eval/generate_traces.py

grade:
	uv run python tests/eval/grade.py
