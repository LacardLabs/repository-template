# Project Title

> Copy this file to `README.md`, rename the project, and rewrite the sections so they describe your service accurately.

Concise paragraph describing what this service or library does and the value it delivers.

## Getting Started

```bash
python -m venv .venv && source .venv/bin/activate
make setup
pre-commit install
```

Common tasks:
- `make lint` — run configured linters when available (ruff, eslint, etc.)
- `make test` — execute tests if pytest/npm test are present

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

Track significant technical choices under `docs/adr/`. Copy `template.md` to the next `000X-short-title.md`, keep live ADRs at the root, move superseded records into `archive/`, and store diagrams or data in `assets/<adr-number>/`. Delete the starter entry in `docs/adr/examples/` once this project has its first real ADR.

## Security

Report vulnerabilities following the organization policy: https://github.com/LacardLabs/.github/blob/main/SECURITY.md

## License

Projects created from this template inherit the **Adaptive Collaboration & Template License (Lacard Labs Remix, 2025)**. Keep the text in `LICENSE` unless your project explicitly needs something else.
