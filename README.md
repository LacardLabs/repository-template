# Lacard Labs Repository Template

> ⚙️ After bootstrapping with **Use this template**, create the repo on GitHub, then run `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and `cd ~/GitHub/LacardLabs/<repo>` before editing. Update `.github/workflows/ci.yml` so the `language:` input matches your stack before the first pull request.

This repository is the starting point for new Lacard Labs projects. It stays intentionally thin—policies, automation, and community health live in the `.github` control-plane repo. All directions below assume you've already cloned the repo to `~/GitHub/LacardLabs/<repo>`.

## Setup checklist (delete when finished)

- [ ] In **Settings → General**, update the repo description, confirm visibility, and (if you use GitHub Teams) assign an owning team. Solo maintainers can skip the team entry and rely on CODEOWNERS for review coverage.
- [ ] Clone the repo locally with `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and verify `pwd` resolves to that path.
- [ ] Edit `.github/workflows/ci.yml`, keep the `uses:` reference pointed at `LacardLabs/.github/.github/workflows/ci.yml@main`, and set `language: <stack>` so CI runs the right toolchain. Leave `codeql: false` until the repo has real source code and ensure the `permissions` block grants `contents: read`, `actions: read`, and `security-events: write` so uploads succeed.
- [ ] Run `pre-commit install` so the default whitespace and Ruff hooks run locally before every commit. Adjust `.pre-commit-config.yaml` if your stack needs different checks.
- [ ] Copy `README.template.md` to `README.md`, personalize it for this project, then delete the template file.
- [ ] Decide what to keep from `.pre-commit-config.yaml`, `Makefile`, `.env.example`, and the sample ADRs under `docs/adr/examples/`. These ship as ready-to-adopt defaults—tune them to fit your workflows or delete the pieces you do not plan to maintain. Keep `docs/adr/archive/` and `docs/adr/assets/` (plus their README placeholders) if you expect to store superseded records or supporting diagrams later.
- [ ] Confirm `main` branch protection (PR review, required CI check, squash-only merges, delete merged branches) matches org policy. See `LacardLabs/.github/docs/org-settings.md` for the nightly snapshot produced by the org-settings report workflow.
- [ ] Open a "smoke" pull request with a trivial change to confirm the reusable CI passes end to end. Merge after review, then revert the no-op change if necessary.
- [ ] Remove this checklist (and `SETUP.md`) once everything above is complete.

See `SETUP.md` for the same list plus links and reminders that reviewers can follow.

## How to use the template

1. Click **Use this template** to create the new repository under the Lacard Labs org.
2. Clone it locally with `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` before editing; all commands below assume you are inside that directory.
3. Walk through the setup checklist so policy, CI, and docs are wired correctly.
4. Run `pre-commit install` to register the repo's hooks locally. The defaults auto-fix whitespace issues and run Ruff linting before every commit so broken formatting never reaches CI. Tweak the hook list if your stack needs more (or fewer) checks.
5. Run `pwd` or `ls` to sanity-check that you are under `~/GitHub/LacardLabs/<repo>` before committing. Remove unused scaffolding (`docs/adr/examples/`, unused Makefile targets, etc.) to keep the repo focused. We do not assume `make` usage by default—feel free to delete the Makefile if your project won't adopt it soon.

## Included developer experience files

These scaffolds stay in the template so new repositories can opt in immediately. Keep the pieces you will maintain; delete the rest once you've copied the behavior you need.

- `.editorconfig` — enforces consistent whitespace across editors.
- `.pre-commit-config.yaml` — configures the whitespace fixer and Ruff lint hooks that run via `pre-commit`. After cloning, run `pre-commit install` so the hooks execute locally before each commit.
- `Makefile` — optional `setup`, `lint`, and `test` convenience targets (`make setup`, `make lint`, `make test`). Delete it if you prefer not to depend on `make` yet.
- `.env.example` — placeholder for local-only environment variables. Copy it to `.env` (or similar) and fill in the values your service needs.
- `docs/adr/` — starter guide, template, and directory structure for Architecture Decision Records (live records at the root, archived decisions under `archive/`, supporting diagrams in `assets/<adr-number>/`, and example ADRs under `examples/`).

## Architecture Decision Records

- Create a new ADR whenever you commit to a meaningful architectural choice (data store, deployment model, auth strategy, cross-service contracts).
- Copy `docs/adr/template.md` to the next sequence number (e.g., `cp docs/adr/template.md docs/adr/0003-adopt-openapi.md`), update the front matter, and capture context, decision, and consequences.
- Keep the status field accurate (`Proposed` → `Accepted`/`Rejected`/`Superseded`) and link to the tracking issue or PR in the decision section so readers can follow the history.
- Store supporting diagrams or data under `docs/adr/assets/<adr-number>/` (see the README in that directory for naming guidance) and move superseded records to `docs/adr/archive/` once they reference the successor.
- Use `docs/adr/examples/0001-adopt-adr-process.md` and `docs/adr/examples/0002-adr-directory-structure.md` as onboarding references, then delete the `examples/` directory when you have real ADRs in place.
- Commit ADRs alongside the implementation change and mention the record in your PR under the "Develop" or "Docs" callout so reviewers see the rationale.

## Why ship `README.template.md` instead of auto-populating?

The template keeps the default `README.md` focused on setup guardrails, while `README.template.md` is a narrative scaffold for the actual project. Copying it forces each new repo to:

- Pause and rewrite the summary in plain language for its specific problem.
- Prune irrelevant sections so stale boilerplate does not linger.
- Keep the main README intentional, rather than inheriting text that no longer applies.

Once you have a real description, move `README.template.md` to `README.md`, personalize the copy, and delete the template file.

## Continuous integration

CI is powered by the reusable workflow in `LacardLabs/.github`. Keep the caller workflow minimal, inherit secrets, and set the `language` input so the shared pipeline runs the correct steps for your repo. Track `LacardLabs/.github/.github/workflows/ci.yml@main` so fixes roll out automatically, and flip `codeql` to `true` once the repository has analyzable source code.

## License

Lacard Labs uses the **Adaptive Collaboration & Template License (Lacard Labs Remix, 2025)** as the default for new repositories. The canonical copy lives in `LacardLabs/.github/LICENSE`; this template ships the same text locally in `LICENSE` for convenience.
