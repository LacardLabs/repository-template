# Lacard Labs Repository Template

> ⚙️ After bootstrapping with **Use this template**, create the repo on GitHub, then run `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and `cd ~/GitHub/LacardLabs/<repo>` before editing. Update `.github/workflows/ci.yml` so the `language:` input matches your stack before the first pull request.

This repository is the starting point for new Lacard Labs projects. It stays intentionally thin—policies, automation, and community health live in the `.github` control-plane repo. All directions below assume you've already cloned the repo to `~/GitHub/LacardLabs/<repo>`.

## Setup checklist (delete when finished)

- [ ] In **Settings → General**, update the repo description, confirm visibility, and assign the owning team.
- [ ] Clone the repo locally with `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and verify `pwd` resolves to that path.
- [ ] Edit `.github/workflows/ci.yml` and set `language: <stack>` so CI runs the right toolchain.
- [ ] Copy `README.template.md` to `README.md`, personalize it for this project, then delete the template file.
- [ ] Trim `.pre-commit-config.yaml`, `Makefile`, and other scaffolding you do or don't need.
- [ ] Confirm `main` branch protection (PR review, required CI check, squash-only merges, delete merged branches) matches org policy.
- [ ] Push a quick "smoke" commit to verify the reusable CI passes end to end.
- [ ] Remove this checklist (and `SETUP.md`) once everything above is complete.

See `SETUP.md` for the same list plus links and reminders that reviewers can follow.

## How to use the template

1. Click **Use this template** to create the new repository under the Lacard Labs org.
2. Clone it locally with `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` before editing; all commands below assume you are inside that directory.
3. Walk through the setup checklist so policy, CI, and docs are wired correctly.
4. Run `pre-commit install` to register the repo's hooks locally. The defaults auto-fix whitespace issues and run Ruff linting before every commit so broken formatting never reaches CI. Tweak the hook list if your stack needs more (or fewer) checks.
5. Run `pwd` or `ls` to sanity-check that you are under `~/GitHub/LacardLabs/<repo>` before committing. Remove unused scaffolding (ADR template, etc.) to keep the repo focused. We do not assume `make` usage by default—feel free to delete the Makefile if your project won't adopt it soon.

## Included developer experience files

- `.editorconfig` — enforces consistent whitespace across editors.
- `.pre-commit-config.yaml` — configures the whitespace fixer and Ruff lint hooks that run via `pre-commit`.
- `Makefile` — optional `setup`, `lint`, and `test` convenience targets. Delete it if you prefer not to depend on `make` yet.
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
