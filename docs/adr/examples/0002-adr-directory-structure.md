# 0002: Align ADR directory structure

- **Status:** Accepted
- **Deciders:** Template Maintainers
- **Date:** 2025-01-15

## Context

New repositories bootstrapped from the template need a predictable way to store active, superseded, and supporting ADR material.
Earlier projects mixed sample ADRs with live records, which made it hard to see which decisions were current or where diagrams lived.

## Decision

Adopt a canonical layout under `docs/adr/`:

- Keep active ADR Markdown files at the root of the directory for quick discovery.
- Store replaced decisions in `docs/adr/archive/` without renumbering them so historical context is preserved.
- Capture large diagrams or exports in `docs/adr/assets/<adr-number>/` and reference them from the ADR body.
- Ship sample ADRs in `docs/adr/examples/` that new teams can reference and then delete once they publish their own records.

## Consequences

- Contributors always know where to add new records and where to look for related assets.
- Superseded decisions remain available without cluttering the active ADR list.
- The template can safely include example content without confusing it for production decisions.

## Links

- docs/adr/template.md
- docs/adr/archive/README.md
- docs/adr/assets/README.md
