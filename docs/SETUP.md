# SETUP

## Requirements
- macOS or Linux, Git, Python 3.11+
- Optional: pre-commit (local-only hooks)
- Tools installed by project scripts must be non-interactive.

## Conventions to remember
- Commands are **deterministic** and **prompt-free**.
- Prefer **full words** instead of flags.
- Use `?` (overview) and `??` (deep help) on project CLIs.
- Run `make verify` before requesting review.

## Codex global guidance
- If `~/.codex/AGENTS.md` does not exist:
```sh
make codex-bootstrap
```

This creates it from `docs/agents/AGENTS.codex-template.md`.

## Repository layout

* Source: `src/` (or stack default)
* Tests: `tests/`
* Docs: `docs/`

## Optional: Org-safe pre-commit

* We ship a **local** pre-commit config using scripts in `scripts/hooks/`.
* If you need org-hosted mirrors instead, fork upstream hooks into `LacardLabs/*` and pin revisions.


