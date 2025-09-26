# Lacard Labs Repository Template

> ⚙️ **Required action after cloning:** open `.github/workflows/ci.yml` and change the `language:` line to match your stack (`python`, `node`, `rust`, or `none`).

This repository is the starting point for new Lacard Labs projects. It stays intentionally thin—policies, automation, and community health live in the `.github` control-plane repo.

## Setup checklist (delete when finished)

- [ ] Rename the repo description and set visibility/owners in GitHub settings.
- [ ] Update `.github/workflows/ci.yml` → `language: <stack>` so CI runs the right toolchain.
- [ ] Copy `README.template.md` to `README.md`, rewrite it for this project, then delete the template file.
- [ ] Trim `.pre-commit-config.yaml`, `Makefile`, and other scaffolding you do or don’t need.
- [ ] Confirm branch protection on `main` (PR review, required CI check, squash-only, delete merged branches).
- [ ] Run a smoke commit to verify the reusable CI passes.
- [ ] Remove this checklist (and `SETUP.md`) once everything above is complete.

See `SETUP.md` for the same list plus links and reminders that reviewers can follow.

## How to use the template

1. Click **Use this template** and create a new repository.
2. Walk through the checklist above so policy, CI, and docs are wired correctly.
3. Run `pre-commit install` to enable local checks, and trim the hooks you do not need.
4. Remove unused scaffolding (Make targets, ADR template, etc.) to keep the repo focused.

## Included developer experience files

- `.editorconfig` — enforces consistent whitespace across editors.
- `.pre-commit-config.yaml` — lightweight whitespace and Ruff lint hook; extend as needed.
- `Makefile` — optional `setup`, `lint`, and `test` convenience targets that autodetect common stacks.
- `.env.example` — placeholder for local-only environment variables.
- `docs/adr/` — starter guide and template for Architecture Decision Records.

## Why ship `README.template.md` instead of auto-populating?

The template keeps the default `README.md` focused on setup guardrails, while `README.template.md` is a narrative scaffold for the actual project. Copying it forces each new repo to:

- Pause and rewrite the summary in plain language for its specific problem.
- Prune irrelevant sections so stale boilerplate does not linger.
- Keep the main README intentional, rather than inheriting text that no longer applies.

Once you have a real description, move `README.template.md` to `README.md`, personalize the copy, and delete the template file.

## Continuous integration

CI is powered by the reusable workflow in `LacardLabs/.github`. Keep the caller workflow minimal, inherit secrets, and set the `language` input so the shared pipeline runs the correct steps for your repo.

## License

Lacard Labs uses the **Adaptive Collaboration & Template License (Lacard Labs Remix, 2025)** as the default for new repositories. The canonical copy lives in `LacardLabs/.github/LICENSE`; this template ships the same text locally in `LICENSE` for convenience.
