# Lacard Labs Repository Template

This repository contains the baseline scaffolding Lacard Labs uses for new projects. It stays intentionally lean—organization-wide policy, issue templates, and reusable workflows live in `LacardLabs/.github`. This template focuses on developer ergonomics (Make targets, scripts, AGENTS guidance, docs) that individual repos depend on.

## What's included

- `README.template.md` — starter copy for the project’s own README.
- `.pre-commit-config.yaml` + `scripts/hooks/` — repo-local Ruff, whitespace, and merge-conflict hooks.
- `Makefile` — non-interactive helpers (`setup`, `lint`, `verify`, `codex-bootstrap`, etc.).
- `AGENTS.md` / `AGENTS.repo-template.md` — layered agent/human guidance.
- `docs/` — standards, quickstart, setup guidance, and Codex bootstrap template.
- `.github/workflows/ci.yml` — default Ruff + pytest workflow (swap commands when your stack differs).
- `.gitattributes`, `.editorconfig`, `.gitignore` — baseline formatting and ignore rules.

Use this repo to refine the shared experience (update docs, scripts, workflows), then fan those changes out to dependent projects.

## Using the template

1. Click **Use this template** when creating a new Lacard Labs repo.
2. Clone locally with `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and `cd` into that directory.
3. Install tooling with `make dev-install` (installs Ruff, pytest, pre-commit, and registers hooks) or run `pre-commit install` manually.
4. Decide which scaffolding you need (`Makefile`, `.env.example`, ADR samples) and delete the rest to keep the repo focused.
5. Copy `README.template.md` to `README.md`, personalize the content, then remove the template file.

## Bootstrap checklist (drop into the new repo and delete when done)

- [ ] Update the repo description, visibility, and owning team under **Settings → General**.
- [ ] Confirm the checkout path: `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` then `pwd`.
- [ ] Review `.github/workflows/ci.yml`; adjust lint/test commands or switch to the reusable workflow when you know the stack.
- [ ] Run `pre-commit install` so Ruff + whitespace hooks run locally before each commit.
- [ ] Trim or adopt `Makefile`, `.pre-commit-config.yaml`, `.env.example`, and `docs/adr/examples/`.
- [ ] Set branch protections on `main` (PR review, required checks, squash merges, auto-delete branches).
- [ ] Open a smoke PR to confirm CI wiring, then revert the no-op change if needed.

## Continuous integration

The default workflow in `.github/workflows/ci.yml` runs `make ruff-check` and `pytest -q`. Update those commands once your project has a different stack, or swap to the reusable workflow in `LacardLabs/.github`. Keep the permissions block minimal (`contents: read`, `actions: read`, `security-events: write`) and enable CodeQL only after real source lands.

## Why keep `README.template.md`?

New repositories have to consciously rewrite their own README. The template forces you to:

- Summarize the problem in your own words.
- Document canonical commands (`make verify`, direct tool invocations).
- Remove sections that don’t apply.

It’s a small speed bump that keeps stale copy from leaking into real projects.

## Extending the template

Have an improvement (script, docs tweak, workflow change)? Open a PR here first. Once merged, run the fan-out tooling (soon to live in the `operations` repo) to push the change into downstream repositories.

## License

Lacard Labs uses the **Adaptive Collaboration & Template License (Lacard Labs Remix, 2025)** as the default for new repositories. The canonical copy lives in `LacardLabs/.github/LICENSE`; this template ships the same text locally in `LICENSE` for convenience.
