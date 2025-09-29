SHELL := /bin/bash
SHELLFLAGS := -eu -o pipefail -c
.ONESHELL:

.PHONY: setup lint test help help-all ruff-baseline ruff-fix ruff-check pyupgrade lint-all codex-bootstrap dev-install verify ? ??

reports := reports
ruff_baseline := $(reports)/ruff_baseline.json

help: ## Show available make targets (index).
	@awk -F ':.*##' '/^[a-zA-Z0-9_.-]+:.*##/ { printf "%-22s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

help-all: ## Detailed help with examples (if provided).
	@awk -F ':.*##' '/^[a-zA-Z0-9_.-]+:.*##/ { printf "%-22s %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

# Optional sugar (requires quoting in most shells: make '?', make '??').
?:
	@$(MAKE) help

??:
	@$(MAKE) help-all

setup: ## Install project dependencies for common stacks.
	if [ -f requirements.txt ]; then
		python -m pip install -U pip
		python -m pip install -r requirements.txt
	fi
	if [ -f pyproject.toml ]; then
		python -m pip install -U pip
		python -m pip install '.[dev]' || python -m pip install .
	fi
	if [ -f package.json ]; then
		npm ci || npm install
	fi

dev-install: ## Install dev tools (ruff, pytest, pre-commit) non-interactively.
	python -m pip install -U pip
	pip install ruff pytest pre-commit
	ruff --version
	pytest --version
	pre-commit --version
	pre-commit install -t pre-commit -t pre-push || true

lint: ## Run lint commands for available stacks.
	if command -v ruff >/dev/null 2>&1; then
		$(MAKE) ruff-check
	fi
	if command -v eslint >/dev/null 2>&1 && [ -f package.json ]; then
		npx eslint .
	fi

test: ## Run fast tests (quiet).
	if command -v pytest >/dev/null 2>&1; then
		if pytest -q; then
			:
		else
			status=$$?
			if [ $$status -ne 5 ]; then
				exit $$status
			fi
			echo "pytest: no tests collected; skipping"
		fi
	fi
	if [ -f package.json ]; then
		npm test --silent
	fi

verify: ## Run lint + tests (ruff-check + pytest -q).
	$(MAKE) ruff-check
	if command -v pytest >/dev/null 2>&1; then
		if pytest -q; then
			:
		else
			status=$$?
			if [ $$status -ne 5 ]; then
				exit $$status
			fi
			echo "pytest: no tests collected; skipping"
		fi
	else
		echo "pytest not found; skipping tests"
	fi

ruff-baseline: ## Run Ruff across repo and save JSON baseline.
	mkdir -p $(reports)
	ruff check . --output-format=json > $(ruff_baseline)
	echo "Baseline saved to $(ruff_baseline)"

pyupgrade: ## Modernize typing: list[str], str | None (UP006/UP007).
	ruff check . --select UP006,UP007 --fix

ruff-fix: ## Apply Ruff auto-fixes then format.
	ruff check . --fix
	ruff format .

ruff-check: ## Lint + format check (non-interactive).
	ruff check .
	ruff format --check .

lint-all: pyupgrade ruff-fix ruff-check ## One-shot lint normalization (idempotent).

codex-bootstrap: ## Create ~/.codex/AGENTS.md from docs/agents/AGENTS.codex-template.md if missing.
	if [ -f "${HOME}/.codex/AGENTS.md" ]; then
		echo "~/.codex/AGENTS.md exists; skipping."
		exit 0
	fi
	mkdir -p "${HOME}/.codex"
	cp docs/agents/AGENTS.codex-template.md "${HOME}/.codex/AGENTS.md"
	echo "Created ${HOME}/.codex/AGENTS.md from template."
