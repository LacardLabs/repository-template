# Repository Guidelines

## Project Structure & Module Organization
- Keep the root slim: shared scaffolding only (`README.template.md`, `.pre-commit-config.yaml`, optional `Makefile`, `docs/adr/`).
- Put application code under the stack's conventional directory (`src/`, `app/`, etc.) and mirror tests under `tests/` or `<lang>_tests/`; store docs and assets in `docs/` or `assets/`.

## Build, Test, and Development Commands
- Create the repo from the template, then clone with `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>`; run `pwd` to confirm the path before committing.
- Run `pre-commit install` once; hooks auto-fix whitespace and run Ruff before every commit.
- Use language-native tooling for build/test (`npm test`, `pytest`, `cargo test`). Only opt into `Makefile` targets if your stack already depends on `make`.

## Coding Style & Naming Conventions
- Rely on formatter defaults (PEP 8, ESLint, Rustfmt); `.editorconfig` keeps indentation at 4 spaces unless the framework overrides it.
- Use snake_case for Python modules, kebab-case for JavaScript packages, PascalCase for exported types. Document exceptions inline when necessary.

## Testing Guidelines
- Match test file names to their targets (`foo_test.py`, `Foo.spec.ts`, `mod_test.rs`).
- Keep unit tests fast enough for CI; mark slow suites with conventional skips or flags.
- Aim for about 80% coverage when tooling supports it and explain gaps in the PR.
- Run the full test suite locally before requesting review.

## Commit & Pull Request Guidelines
- Follow the narrated voice from `.github/CONTRIBUTING.md`: lead with the why, then the what and next steps.
- Reference the driving issue in commit subject lines when available (`feat: align auth scopes (#123)`).
- Keep PRs focused; include screenshots or terminal captures when behaviour changes.
- Ensure CI is green and document any toggles or follow-up tasks under "Next steps" in the PR body.

## Architecture Decision Records (ADRs)
- Snapshot significant architecture choices under `docs/adr/`; copy `template.md` to the next `000X-title.md` file before editing and keep live ADRs at the top level.
- Write concise context, decision, and consequence sections; update the status from `Proposed` to `Accepted`, `Rejected`, or `Superseded` once merged. Store heavy assets in `docs/adr/assets/<adr-number>/` and move superseded records into `docs/adr/archive/` after linking to the replacement.
- Link supporting issues, diagrams, or PRs in the ADR and reference the record in your pull request narrative. Use `docs/adr/examples/0001-adopt-adr-process.md` as the baseline format, deleting `examples/` once the team has its own records.

## Agent-Specific Notes
- Automations and scripts assume repositories live under `~/GitHub/LacardLabs/<repo>`.
- Prefer idempotent commands and pass explicit paths so agents can re-run safely.
- Surface surprises (unexpected files, failing hooks) in PR descriptions to keep reviewers aligned.
