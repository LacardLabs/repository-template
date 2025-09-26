# Repository Guidelines

> Copy this file to `AGENTS.md` and tailor each section for your project. Keep explanations concise (200–400 words) and specific to your repo.

## Project Structure & Module Organization
- Summarize where core source, tests, and assets reside once your project scaffolding is in place.
- Note any directories that downstream agents should avoid or clean up after bootstrapping.

## Build, Test, and Development Commands
- Document the commands contributors should run after cloning (include `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` if you keep the default path assumption).
- List the canonical build, lint, and test commands, calling out any optional tooling like `make`.

## Coding Style & Naming Conventions
- Record formatting standards (indentation, casing, formatter tools) that apply to your stack.
- Mention naming patterns for files, packages, and exported symbols so agents can create files confidently.

## Testing Guidelines
- Describe the testing frameworks in use and how to execute the suites locally.
- Include coverage expectations, file naming conventions, and guidance for slow or optional tests.

## Commit & Pull Request Guidelines
- Restate your team's expectations for commit messages, PR structure, and required artifacts (screenshots, logs, etc.).
- Link to any additional docs (CONTRIBUTING, architecture notes) reviewers should read before approving.

## Architecture Decision Records (ADRs)
- Explain when your team expects a new ADR versus updating an existing one.
- Note the numbering scheme (`0001-short-title.md`), where to copy the template from, and which statuses you use (`Proposed`, `Accepted`, etc.). Call out that live ADRs stay at the root, superseded records move into `archive/`, and supporting diagrams belong in `assets/<adr-number>/` (README placeholders explain the directory expectations).
- Tell contributors where to link ADRs (e.g., PR narrative, docs index) so the rationale remains discoverable. Mention the starter files in `docs/adr/examples/0001-adopt-adr-process.md` and `docs/adr/examples/0002-adr-directory-structure.md` if you want agents to follow or delete them.

## Agent-Specific Notes
- Capture assumptions your automations make (e.g., repositories cloned under `~/GitHub/LacardLabs/<repo>`).
- Flag common pitfalls, reset procedures, or environment constraints that agents should surface in PRs.
