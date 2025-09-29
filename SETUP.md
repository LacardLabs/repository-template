# Repository Setup Checklist

This checklist duplicates the quick list in `README.md`, but keeps more detail for reviewers or automation to follow. Delete this file once every item is complete. All steps assume the repository was created from this template on GitHub and cloned locally under `~/GitHub/LacardLabs/<repo>`.

- [ ] **Name & visibility** – Update the repository description, topics, and visibility in GitHub settings. If you later adopt GitHub Teams, add the owning team under **Settings → General**; solo maintainers can skip the team assignment and rely on CODEOWNERS for review coverage.
- [ ] **Clone path** – Run `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and confirm `pwd` resolves to `~/GitHub/LacardLabs/<repo>` before making local edits.
- [ ] **CI wiring** – Review `.github/workflows/ci.yml`. The default job runs `make ruff-check` and `pytest -q`; update those commands (or swap to the reusable workflow in `LacardLabs/.github`) once you know the stack. Keep the permissions block minimal (`contents: read`, `actions: read`, `security-events: write`) and enable CodeQL only after real source code lands.
- [ ] **Pre-commit hooks** – Run `pre-commit install` (or `make dev-install`) so Ruff + whitespace hooks run locally before each commit. Update `.pre-commit-config.yaml` if your stack needs different checks.
- [ ] **README handoff** – Copy `README.template.md` to `README.md`, tailor it to the project, then remove the template file.
- [ ] **Scaffold trim** – Decide what to keep from `.pre-commit-config.yaml`, `Makefile`, `.env.example`, and the ADR starter content. They ship ready-to-use defaults: hooks stabilize formatting, the Makefile wraps common tasks, and `.env.example` documents required environment variables. Tune them to fit your workflow or delete the pieces you do not plan to maintain. Keep `docs/adr/archive/` and `docs/adr/assets/` (including the README placeholders) for future records, but delete `docs/adr/examples/`—which ships sample records `0001-adopt-adr-process.md` and `0002-adr-directory-structure.md`—once you have a real ADR.
- [ ] **Branch protection** – Ensure `main` requires PR review, the reusable CI status check, squash-only merges, linear history, and deletes branches on merge. `LacardLabs/.github/docs/org-settings.md` is refreshed nightly by automation if you need the current org baselines.
- [ ] **Smoke test** – Open a short-lived pull request with a trivial change to confirm the reusable CI runs cleanly (CodeQL/SBOM toggles as needed). Merge after review, then revert the no-op change if you don't want it to linger.
- [ ] **Final cleanup** – Delete this `SETUP.md` file and the checklist section in `README.md` once everything above is done.

Need context? See `LacardLabs/.github` for org policies, CODEOWNERS, and security contacts.
