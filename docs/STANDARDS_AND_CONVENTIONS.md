# STANDARDS & CONVENTIONS
Scope: Project

## Command Philosophy
- **Non-interactive by default.** Every workflow is a single, reproducible command (via `make`, `just`, or project CLIs). No prompts.
- **Full words, not flags (Lacard CLIs).** Our CLIs prefer commands that read like phrases (e.g., `lacard remove vendors all`). Third-party tools (ruff, pytest, git) use their standard flags; we do not wrap them.
- **Discoverability with `?` and `??`.**
  - `<command> ?` → overview/index (quote if your shell would glob).
  - `<command> ??` → detailed help with examples.
  - `make help` → target index; `make help-all` → detailed info. If sugar aliases `?`/`??` exist, quote them (`make '?'`).
- **Symmetry.** The same commands must work for humans and agents with identical output.

## Paths & Layout
- Repos are expected at `~/GitHub/LacardLabs/<repo>`.
- Source under conventional stack dirs (`src/`, `app/`, etc.), tests under `tests/`, docs under `docs/`.

## Git Hygiene
- Branches: `feat/<slug>`, `fix/<slug>`, `chore/<slug>`.
- Commits: `type(scope): summary`.
- Keep PRs focused; green tests and lint are gates to review.

## Python Lint & Format
- Linter/formatter: **Ruff** (`ruff check`, `ruff format`).
- Target: Python 3.11+.
- Imports and `__all__` sorted; typing modernized (e.g., `list[str]`, `str | None`).
- Magic number comparisons: avoid unnamed constants in comparisons; name them when it improves clarity (Ruff PLR2004).

## Testing
- `pytest -q` for fast, quiet runs.
- `make verify` runs the lint/test gate (ruff-check + pytest) in one command.
- Keep unit tests CI-fast; mark slow suites explicit.

## Pre-commit Policy
- Default: **no external hook repos.** Use **`repo: local`** hooks (scripts in `scripts/hooks/`), or org‑mirrored forks pinned to specific tags.
- Pre-commit is optional; CI + `make` targets are the source of truth. (Pre-commit framework details: see project docs.) 

## Docs & Manuals
- `docs/QUICKSTART.md` → fast start.
- `docs/SETUP.md` → environment and tooling details.
- `lacard manual` → long-form help for the Lacard CLI.
- `lacard ?` / `lacard ??` → index and deep help.

## Agents
- **Repo `AGENTS.md`** defines workflows, roles, and run commands for this project.
- If `~/.codex/AGENTS.md` is missing, run `make codex-bootstrap` to create it from `docs/agents/AGENTS.codex-template.md`.
