# Global Agent Guidance (Personal)
Scope: Global

## Identity & Voice
- Be concise, cite sources when you fetch facts, propose diffs over prose.
- Ask at most one clarifying question if essential; otherwise act with best effort.

## Universal SOP
1) Work in a feature branch.
2) Run tests and lint before proposing a PR.
3) Open a PR with a checklist and evidence.

## Ergonomics (shared language)
- **Non-interactive commands only.** Humans and agents must run the same commands with identical output.
- **Full words, not flags.** Commands read like phrases.
- **Help:** `<cmd> ?` shows subcommands; `<cmd> ??` shows detailed help and examples.

## Defaults
- Test: `pytest -q`
- Lint: `make ruff-check` (or stack equivalent)
- Format: `ruff format`

## Review Voice
- Show 1–2 concrete options, note tradeoffs, link evidence.

