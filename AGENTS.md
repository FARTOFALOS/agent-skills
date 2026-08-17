# Agent maintenance contract

This repository is the canonical store for global reusable agent skills.

Rules:
- Canonical skill path: `skills/<skill-name>/SKILL.md`.
- Keep one canonical skill body; do not create model-specific duplicate copies unless the skill itself requires model-specific supporting files.
- Preserve imported skill semantics unless the user explicitly authorizes modification.
- Preserve upstream provenance and license notices in `THIRD_PARTY_NOTICES.md` when required.
- Include supporting files only when the skill references or requires them.
- Treat `install.ps1` as a delivery adapter, not as skill content.
- Do not add README-style per-skill catalogs or duplicate descriptions; discover skills from `skills/*/SKILL.md`.
- Do not overwrite unrelated user-owned paths in Codex or Claude Code delivery locations.
- When adding or updating a skill, keep the repository operable by `git pull` followed by `.\install.ps1` on Windows.
