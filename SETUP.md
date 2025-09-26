# Repository Setup Checklist

This checklist duplicates the quick list in `README.md`, but keeps more detail for reviewers or automation to follow. Delete this file once every item is complete. All steps assume the repository was created from this template on GitHub and cloned locally under `~/GitHub/LacardLabs/<repo>`.

- [ ] **Name & visibility** – Update the repository description, topics, and visibility in GitHub settings.
- [ ] **Clone path** – Run `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and confirm `pwd` resolves to `~/GitHub/LacardLabs/<repo>` before making local edits.
- [ ] **CI wiring** – Edit `.github/workflows/ci.yml`, keep the `uses:` line pinned to `LacardLabs/.github/.github/workflows/ci.yml@ef34c38ca6a0e2d8ff94757d962a61fefe418ab9`, and set `language: python|node|rust|none` to match the primary stack. Leave `codeql: false` until the repository has analyzable source, then flip it back on.
- [ ] **README handoff** – Copy `README.template.md` to `README.md`, tailor it to the project, then remove the template file.
- [ ] **Scaffold trim** – Prune or extend `.pre-commit-config.yaml`, `Makefile`, `.env.example`, and the ADR starter content so they reflect actual usage. Keep `docs/adr/archive/` and `docs/adr/assets/` (including the README placeholders) for future records, but delete `docs/adr/examples/`—which ships sample records `0001-adopt-adr-process.md` and `0002-adr-directory-structure.md`—once you have a real ADR. Remove the `Makefile` if your service won't adopt `make` yet.
- [ ] **Branch protection** – Ensure `main` requires PR review, the reusable CI status check, squash-only merges, linear history, and deletes branches on merge.
- [ ] **Smoke test** – Push a throwaway change to confirm the reusable CI runs cleanly (CodeQL/SBOM toggles as needed).
- [ ] **Final cleanup** – Delete this `SETUP.md` file and the checklist section in `README.md` once everything above is done.

Need context? See `LacardLabs/.github` for org policies, CODEOWNERS, and security contacts.
