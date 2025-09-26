# Architecture Decision Records

ADRs capture the narrative behind major technical choices so future contributors understand the why, not just the code diff. Use them when you:

- Introduce a new system boundary, integration, or deployment strategy.
- Replace a core dependency (database, queue, framework) or change a critical design constraint.
- Approve an experiment that alters reliability, scalability, or security characteristics.

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

For additional background, see [Documenting architecture decisions](https://adr.github.io/).
