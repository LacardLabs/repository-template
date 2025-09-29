# Agents Contract — Repo Template
> Copy to `AGENTS.md` and fill in succinctly (≤200 lines). Keep it **operational**: commands, SOPs, exit checks.

## Identity & Principles
- Non-interactive commands; full words instead of flags.
- `<cmd> ?` / `<cmd> ??` for help and examples.
- Diff-first; propose PRs with evidence.

## Stack & Layout
- Build: <fill>
- Test: <fill>
- Lint: <fill>
- Gate: <fill> (e.g., `make verify`)
- Key directories: /src, /tests, /docs (+ any project-specific)

## Roles
- Builder / Reviewer / Comms / Ops — define concrete outputs per role.

## Workflows (SOP Blocks)
### Lint/Format PR
- Commands: <fill> (e.g., `make ruff-check`)
- Exit: no behavior change.

### Ruff Lint Normalisation (optional, one-time)
- Baseline → fix → manual tidy → `make verify` → docs. See project example.

### Docs PR
- Scope-limited to `/docs/**`.

### Bugfix PR
- Repro → minimal diff → tests.

## Conventions
- Path assumption (if any).
- Make/Just targets list + your one-button verify command.
- Any local feature briefs live in `<feature>/AGENTS.md`.
