# Repository Setup Checklist

This checklist duplicates the quick list in `README.md`, but keeps more detail for reviewers or automation to follow. Delete this file once every item is complete.

- [ ] **Name & visibility** – Update the repository description, topics, and visibility in GitHub settings.
- [ ] **CI language** – Edit `.github/workflows/ci.yml` and set `language: python|node|rust|none` to match the primary stack.
- [ ] **README handoff** – Copy `README.template.md` to `README.md`, tailor it to the project, then remove the template file.
- [ ] **Scaffold trim** – Prune or extend `.pre-commit-config.yaml`, `Makefile`, `.env.example`, and ADR docs so they reflect actual usage.
- [ ] **Branch protection** – Ensure `main` requires PR review, the reusable CI status check, squash-only merges, linear history, and deletes branches on merge.
- [ ] **Smoke test** – Push a throwaway change to confirm the reusable CI runs cleanly (CodeQL/SBOM toggles as needed).
- [ ] **Final cleanup** – Delete this `SETUP.md` file and the checklist section in `README.md` once everything above is done.

Need context? See `LacardLabs/.github` for org policies, CODEOWNERS, and security contacts.
