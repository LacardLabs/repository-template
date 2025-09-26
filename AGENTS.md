# Repository Guidelines

## Project Structure & Module Organization
- Root contains shared scaffolding only: `README.template.md`, `.pre-commit-config.yaml`, `Makefile` (optional), `docs/adr/`.
- Keep source code under a language-appropriate directory (e.g., `src/`, `app/`) and mirror tests under `tests/` or `<lang>_tests/`.
- Store local assets in `docs/` or `assets/` so template files stay uncluttered.
- Delete unused scaffold files early to keep the starter lean.

## Build, Test, and Development Commands
- Clone after creating the repo with `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and `cd ~/GitHub/LacardLabs/<repo>`.
- Run `pre-commit install` once; hooks will lint and auto-fix whitespace on every commit.
- Prefer language-native tooling (`npm test`, `pytest`, `cargo test`). Only enable Make targets if your stack already relies on `make`.
- Use `pwd` before committing to confirm you are under `~/GitHub/LacardLabs/<repo>`.

## Coding Style & Naming Conventions
- Follow the language community standard (PEP 8, ESLint defaults, Rustfmt). Enable formatters via pre-commit when possible.
- Use snake_case for files in Python, kebab-case for JavaScript packages, and PascalCase for exported types.
- Keep indentation at 4 spaces unless a framework enforces otherwise; `.editorconfig` enforces defaults.
- Document new directories with a short README when intent is not obvious.

## Testing Guidelines
- Mirror test file names to the implementation (`foo_test.py`, `Foo.spec.ts`, `mod_test.rs`).
- Keep fast unit tests in CI; mark slower integration suites with conventional skips if they need toggles.
- Target >80% coverage when the stack provides tooling; explain lower coverage in the PR summary.
- Run the full test suite locally before requesting review.

## Commit & Pull Request Guidelines
- Write commits in the narrated voice outlined in `.github/CONTRIBUTING.md`; lead with the why before the what.
- Reference the driving issue in the first line when possible (`feat: align auth scopes (#123)`).
- Keep PRs narrowly scoped; include screenshots or terminal captures when behaviour changes.
- Confirm CI passes and note any required follow-ups or toggles under a "Next steps" heading in the PR body.

## Agent-Specific Notes
- Automations and scripts assume repositories live under `~/GitHub/LacardLabs/<repo>`.
- Prefer idempotent commands; call tooling with explicit paths so agents can re-run safely.
- Surface surprises (unexpected files, failing hooks) in PR descriptions to keep reviewers in sync.
