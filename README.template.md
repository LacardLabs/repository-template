# Project Title

> Copy this file to `README.md`, rename the project, and rewrite the sections so they describe your service accurately. After
> creating the repo from the template:
> 1. Run `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>`.
> 2. `cd ~/GitHub/LacardLabs/<repo>` before editing so local scripts and automations resolve correctly.
> 3. Verify `pwd` outputs `~/GitHub/LacardLabs/<repo>` and `git remote -v` points at `git@github.com:LacardLabs/<repo>.git`.
> 4. Note any prerequisites—language runtimes, package managers, container images—that new contributors must install.

Concise paragraph describing what this service or library does and the value it delivers.

## Getting Started

Replace the commands below with the canonical workflow for your stack and add a short note (screenshot, `pwd` capture, or
terminal snippet) that confirms the repo lives under `~/GitHub/LacardLabs/<repo>`. The template ships a `Makefile` for
convenience, but it is optional—drop or rewrite the target examples if your team prefers direct tooling invocations. Call out
which local smoke tests reviewers should run (`npm test`, `pytest`, etc.) so contributors can sanity check before opening a PR.
If you expect extra setup (database migrations, container images, seed data), document those steps alongside the commands.

```bash
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt  # or the equivalent for your ecosystem
pre-commit install
```

Common tasks (edit, add, or delete bullets so they match the tooling you actually rely on):
- `make setup` — bootstrap dependencies when you keep the provided Makefile around
- `make lint` — run configured linters (ruff, eslint, etc.) if the Makefile fits your workflow
- `make test` — execute tests when your project wires them into the Makefile
- `npm test` / `pytest` / `cargo test` — prefer direct tooling commands when that is the clearer contract for your stack
- `npm run lint` / `poetry run pytest` / `<custom command>` — add direct invocations when the Makefile is removed or does not
  cover the task

## Continuous Integration

CI is provided by the Lacard Labs reusable workflow. Make sure the `language` value in `.github/workflows/ci.yml` matches your primary stack (`python`, `node`, `rust`, or `none`).

```yaml
jobs:
  org-ci:
    uses: LacardLabs/.github/.github/workflows/ci.yml@main
    with:
      language: python   # adjust to node|rust|none when necessary
```

## Decision Records

Document significant technical choices under `docs/adr/`. Start each ADR from `docs/adr/template.md` and track them in `docs/adr/README.md`.

## Security

Report vulnerabilities following the organization policy: https://github.com/LacardLabs/.github/blob/main/SECURITY.md

## License

Projects created from this template inherit the **Adaptive Collaboration & Template License (Lacard Labs Remix, 2025)**. Keep the text in `LICENSE` unless your project explicitly needs something else.
