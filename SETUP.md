# Repository Setup Checklist

This checklist duplicates the quick list in `README.md`, but keeps more detail for reviewers or automation to follow. Delete this file once every item is complete. All steps assume the repository was created from this template on GitHub and cloned locally under `~/GitHub/LacardLabs/<repo>`.

- [ ] **Name & visibility** – Update the repository description, topics, and visibility in GitHub settings. If you later adopt GitHub Teams, add the owning team under **Settings → General**; solo maintainers can skip the team assignment and rely on CODEOWNERS for review coverage.
- [ ] **Clone path** – Run `gh repo clone LacardLabs/<repo> ~/GitHub/LacardLabs/<repo>` and confirm `pwd` resolves to `~/GitHub/LacardLabs/<repo>` before making local edits.
- [ ] **CI wiring** – Edit `.github/workflows/ci.yml`, keep the `uses:` line pointed at `LacardLabs/.github/.github/workflows/ci.yml@main`, and set `language: python|node|rust|none` to match the primary stack. Leave `codeql: false` until the repository has analyzable source, then flip it back on, and make sure the `permissions` block grants `contents: read`, `actions: read`, and `security-events: write`.
- [ ] **Pre-commit hooks** – Run `pre-commit install` so the default whitespace fixer and Ruff lint hooks run locally before each commit. Update `.pre-commit-config.yaml` to add or remove checks that make sense for your stack.
- [ ] **README handoff** – Copy `README.template.md` to `README.md`, tailor it to the project, then remove the template file.
- [ ] **Scaffold trim** – Decide what to keep from `.pre-commit-config.yaml`, `Makefile`, `.env.example`, and the ADR starter content. They ship ready-to-use defaults: hooks stabilize formatting, the Makefile wraps common tasks, and `.env.example` documents required environment variables. Tune them to fit your workflow or delete the pieces you do not plan to maintain. Keep `docs/adr/archive/` and `docs/adr/assets/` (including the README placeholders) for future records, but delete `docs/adr/examples/`—which ships sample records `0001-adopt-adr-process.md` and `0002-adr-directory-structure.md`—once you have a real ADR.
- [ ] **Branch protection** – Ensure `main` requires PR review, the reusable CI status check, squash-only merges, linear history, and deletes branches on merge. `LacardLabs/.github/docs/org-settings.md` is refreshed nightly by automation if you need the current org baselines.
- [ ] **Smoke test** – Open a short-lived pull request with a trivial change to confirm the reusable CI runs cleanly (CodeQL/SBOM toggles as needed). Merge after review, then revert the no-op change if you don't want it to linger.
- [ ] **Final cleanup** – Delete this `SETUP.md` file and the checklist section in `README.md` once everything above is done.

Need context? See `LacardLabs/.github` for org policies, CODEOWNERS, and security contacts.
