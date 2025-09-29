# Agents Contract for <repo>
Scope: Project

## What this file is
A dedicated guide for coding agents (and humans) to run this project consistently. Codex and similar tools read AGENTS.md alongside your repo docs. For Codex specifically, guidance can be read from multiple layers (global, project, subdir) and merged to provide context. Keep this file focused on **workflows, identity, and commands**. :contentReference[oaicite:0]{index=0}

---

## Identity & Principles
- **Non-interactive, deterministic workflows.** No prompts; commands produce stable, scriptable output.
- **Full words, not flags (Lacard CLIs).** Lacard-owned CLIs prefer phrase-like commands. Third-party tools (ruff, pytest, git) use their standard flags.
- **Discoverability:** `<cmd> ?` (index), `<cmd> ??` (deep help); quote them if your shell would glob.
- **Diff-first.** Propose patches/PRs with evidence; avoid silent changes.

## Stack & Layout
- Build/Test/Lint:
  - Test: `pytest -q`
  - Lint: `make ruff-check` (Ruff linter + formatter)
  - Format check: `ruff format --check .`
  - Gate: `make verify` (runs ruff-check + pytest)
- Key directories: `/src`, `/tests`, `/docs`, optional `/infra`.

## Roles
- **Builder** — produces patches and tests via Make targets; opens focused PRs.
- **Reviewer** — reviews diffs, verifies tests, labels, merges.
- **Comms** — drafts Discussions/emails; **send requires human approval**.
- **Ops** — proposes infra plans; no apply without approval.

## Canonical Workflows (SOP Blocks)

### SOP: Lint/Format PR (safe to automate)
1. Run `make ruff-check`.
2. If changes are needed: `ruff format .` and open a PR labeled `kind/chore`.
3. PR must include the diffstat and “no behavior change” note.

### SOP: Ruff Lint Normalisation (one-time cleanup)
**Goal:** Make `ruff check` + `pytest` green across the repo without changing runtime behavior.

**Steps**
1. Baseline: `make ruff-baseline` (commit `reports/ruff_baseline.json`).
2. Auto-fix: `make ruff-fix`.
3. Typing modernization: `make pyupgrade` (Ruff UP006/UP007).
4. Manual passes:
   - Name magic-number comparisons where it clarifies intent (PLR2004).
   - Sort imports and `__all__`.
   - No logic changes; if tempted, open a separate PR.
5. Re-run gates: `make verify`.
6. If a rule is net-negative, propose a minimal `pyproject.toml` tweak in the PR with rationale.
7. Docs: update `docs/CONTRIBUTING.md` (or this file) with the new lint expectations.

**Exit criteria**
- `pytest` passes and `ruff check` passes with repo config.
- PR has baseline JSON, any config notes, and docs update.

**Config reference:** `pyproject.toml` → `[tool.ruff]`, `[tool.ruff.lint]`, `[tool.ruff.lint.isort]`. Baseline snapshot lives at `reports/ruff_baseline.json`.

(Background on rules & PLR2004: Ruff documents rule families and intent. Keep it practical.) :contentReference[oaicite:1]{index=1}

### SOP: Docs PR (safe to automate)
- Scope: changes under `/docs/**`.
- Run link checks if present; open PR with before/after summary.

### SOP: Bugfix PR (propose-only)
- Repro from `bugs/<id>.md` if available.
- Limit edits to `/src/**` + matching tests.
- Exit: green tests + minimal diff.

## Conventions
- Repos assumed at `~/GitHub/LacardLabs/<repo>`.
- Use `make` or `just` targets for common tasks.
- Use `make help` (index), `make help-all` (detailed), and `make verify` for the lint/test gate. Quote sugar aliases if you need `make '?'` / `make '??'`.
- Commands must be **prompt-free**; if a tool prompts by default, pass flags or environment to avoid interactivity.

## AGENTS.md layering (how multiple files behave)
- We keep layers **distinct by responsibility** (Global = voice/ergonomics, Repo = workflows/commands, Subdir = feature briefs). Some agents read the nearest file first; Codex supports layered guidance including a user‑level file at `~/.codex/AGENTS.md` in addition to repo files. We design to avoid conflicts. :contentReference[oaicite:2]{index=2}
