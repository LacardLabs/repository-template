# Lacard Labs Repository Template

> ⚙️ After bootstrapping with **Use this template**, create the repo on GitHub, then run `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and `cd ~/GitHub/LacardLabs/<repo>` before editing. Update `.github/workflows/ci.yml` so the `language:` input matches your stack before the first pull request.

This repository is the starting point for new Lacard Labs projects. It stays intentionally thin—policies, automation, and community health live in the `.github` control-plane repo. All directions below assume you've already cloned the repo to `~/GitHub/LacardLabs/<repo>`.

## Setup checklist (delete when finished)

- [ ] In **Settings → General**, update the repo description, confirm visibility, and assign the owning team.
- [ ] Clone the repo locally with `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and verify `pwd` resolves to that path.
- [ ] Edit `.github/workflows/ci.yml` and set `language: <stack>` so CI runs the right toolchain.
- [ ] Copy `README.template.md` to `README.md`, personalize it for this project, then delete the template file.
- [ ] Trim `.pre-commit-config.yaml`, `Makefile`, `.env.example`, and the sample ADR under `docs/adr/examples/` so they match how your project works. Keep the `docs/adr/archive/` and `docs/adr/assets/` directories if you expect to store superseded records or supporting diagrams later.
- [ ] Confirm `main` branch protection (PR review, required CI check, squash-only merges, delete merged branches) matches org policy.
- [ ] Push a quick "smoke" commit to verify the reusable CI passes end to end.
- [ ] Remove this checklist (and `SETUP.md`) once everything above is complete.

See `SETUP.md` for the same list plus links and reminders that reviewers can follow.

## How to use the template

1. Click **Use this template** to create the new repository under the Lacard Labs org.
2. Clone it locally with `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` before editing; all commands below assume you are inside that directory.
3. Walk through the setup checklist so policy, CI, and docs are wired correctly.
4. Run `pre-commit install` to register the repo's hooks locally. The defaults auto-fix whitespace issues and run Ruff linting before every commit so broken formatting never reaches CI. Tweak the hook list if your stack needs more (or fewer) checks.
5. Run `pwd` or `ls` to sanity-check that you are under `~/GitHub/LacardLabs/<repo>` before committing. Remove unused scaffolding (`docs/adr/examples/`, unused Makefile targets, etc.) to keep the repo focused. We do not assume `make` usage by default—feel free to delete the Makefile if your project won't adopt it soon.

## Included developer experience files

- `.editorconfig` — enforces consistent whitespace across editors.
- `.pre-commit-config.yaml` — configures the whitespace fixer and Ruff lint hooks that run via `pre-commit`.
- `Makefile` — optional `setup`, `lint`, and `test` convenience targets. Delete it if you prefer not to depend on `make` yet.
- `.env.example` — placeholder for local-only environment variables.
- `docs/adr/` — starter guide, template, and directory structure for Architecture Decision Records (live records at the root, archived decisions under `archive/`, supporting diagrams in `assets/<adr-number>/`).

## Architecture Decision Records

- Create a new ADR whenever you commit to a meaningful architectural choice (data store, deployment model, auth strategy, cross-service contracts).
- Copy `docs/adr/template.md` to the next sequence number (e.g., `cp docs/adr/template.md docs/adr/0003-adopt-openapi.md`), update the front matter, and capture context, decision, and consequences.
- Keep the status field accurate (`Proposed` → `Accepted`/`Rejected`/`Superseded`) and link to the tracking issue or PR in the decision section so readers can follow the history.
- Store supporting diagrams or data under `docs/adr/assets/<adr-number>/` and move superseded records to `docs/adr/archive/` once they reference the successor.
- Use `docs/adr/examples/0001-adopt-adr-process.md` as an onboarding reference, then delete the `examples/` directory when you have real ADRs in place.
- Commit ADRs alongside the implementation change and mention the record in your PR under the "Develop" or "Docs" callout so reviewers see the rationale.

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
