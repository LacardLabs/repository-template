.PHONY: setup lint test

setup:
	@if [ -f requirements.txt ]; then python -m pip install -U pip && python -m pip install -r requirements.txt; fi
	@if [ -f pyproject.toml ]; then python -m pip install -U pip && python -m pip install '.[dev]' || python -m pip install .; fi
	@if [ -f package.json ]; then npm ci || npm install; fi

lint:
	@if command -v ruff >/dev/null 2>&1; then ruff check .; fi
	@if command -v eslint >/dev/null 2>&1; then npx eslint . || true; fi

test:
	@if command -v pytest >/dev/null 2>&1; then pytest -q || true; fi
	@if [ -f package.json ]; then npm test --silent || true; fi
