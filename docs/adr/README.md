# Architecture Decision Records

ADRs capture the narrative behind major technical choices so future contributors understand the why, not just the code diff. Use them when you:

- Introduce a new system boundary, integration, or deployment strategy.
- Replace a core dependency (database, queue, framework) or change a critical design constraint.
- Approve an experiment that alters reliability, scalability, or security characteristics.

## Suggested directory structure

The repository template keeps ADRs alongside supporting material so everything ships together:

```text
docs/
└── adr/
    ├── README.md               # Usage guide and index
    ├── template.md             # Copy for new ADRs
    ├── assets/                 # Placeholder README and numbered folders for diagrams (e.g., assets/0002/)
    ├── archive/                # Superseded ADRs moved here after linking replacements (README explains expectations)
    ├── examples/               # Sample ADRs to reference; delete once the team has real records
    ├── 0001-introduce-adr-process.md
    └── 0002-choose-ci-provider.md
```

Keep live ADRs at the top level for quick discovery. Move superseded records into `archive/` once they link to the replacement decision, and store heavy assets under `assets/<adr-number>/` so Markdown files stay lean. The `archive/` and `assets/` directories include README placeholders that explain how to structure their contents. The `examples/` directory contains sample content you can delete once the team adds its first real ADR.

## How to create an ADR

1. Identify the next sequence number in this directory (`ls docs/adr`); format it as four digits (`0001-...`).
2. Copy the template: `cp docs/adr/template.md docs/adr/000X-short-title.md` and update the title to match the change.
3. Fill out **Context**, **Decision**, and **Consequences** in 2–4 tight paragraphs each. Reference linked issues, diagrams, or RFCs inline.
4. Set `Status` to `Proposed` while the change is under review. Update it to `Accepted`, `Rejected`, or `Superseded` once the PR lands.
5. Commit the ADR alongside the implementation code so reviewers can evaluate intent and execution together.

## Maintaining ADRs

- Add a short summary or index entry to this README if the list grows beyond what `ls` can convey.
- When a decision is replaced, leave the original ADR intact and add a "Superseded by" note pointing to the new record.
- Keep language plain and action-oriented; these documents should answer "what should we keep doing or avoid?" for future teammates.
- Link the ADR in your pull request under the Docs/Develop section so downstream readers can find it quickly.

## Example ADR

Use `docs/adr/examples/0001-adopt-adr-process.md` and `docs/adr/examples/0002-adr-directory-structure.md` as references if you are unsure how much detail to capture or how to handle links and consequences. Delete the samples once the team creates its first real ADR.

For additional background, see [Documenting architecture decisions](https://adr.github.io/).
