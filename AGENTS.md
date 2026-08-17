# Agent maintenance contract

This repository is the canonical store for global reusable agent skills.

## Repository roles

- Runtime skill: `skills/<local-id>/SKILL.md`.
- Upstream provenance and synchronization state: `UPSTREAMS.yaml`.
- Third-party license text: `THIRD_PARTY_NOTICES.md`.
- Local delivery adapter: `install.ps1`.

Do not add README-style per-skill catalogs. Discover installed skills from `skills/*/SKILL.md` and provenance from `UPSTREAMS.yaml`.

## Canonicality

- The local runtime skill is authoritative until the user explicitly authorizes an upstream update.
- Upstream repositories are provenance/update sources, not live authorities.
- Never auto-update, periodically poll, schedule, or silently sync upstream skills.
- Keep one local canonical skill body; do not create independent model-specific copies unless required supporting files are part of the skill itself.
- Preserve imported skill semantics unless the user explicitly authorizes modification.

## Imported skills

Every vendored third-party skill must have an entry in `UPSTREAMS.yaml` keyed by its local id.

Record at minimum:
- local runtime path;
- upstream repository, ref, path, and upstream skill name;
- exact upstream commit and blob last synchronized;
- import mode;
- declared local overrides;
- license identifier.

The local id may differ from the upstream skill name. If a skill is renamed locally, preserve the upstream identity and record every intentional local adaptation in `local_overrides` (for example `frontmatter.name`). Do not let a later upstream refresh erase declared local overrides.

Preserve required copyright/license notices in `THIRD_PARTY_NOTICES.md`.

## Manual upstream checks

When the user asks whether one skill, an upstream project, or all skills have updates:

1. Resolve the requested skill by local id, upstream name, or upstream repository using `UPSTREAMS.yaml`.
2. Fetch the configured upstream ref/path.
3. Compare upstream content/identity with `last_synced_commit` and `last_synced_blob` and with the local canonical skill when relevant.
4. Report whether an update exists and summarize the meaningful changes. Provide a diff or deeper explanation when requested.
5. Do not modify the local skill merely because upstream changed.
6. Update only after explicit user authorization.

When an update is authorized:

1. Review the upstream changes and any dependency/license changes.
2. Refresh the vendored skill from the authorized upstream version.
3. Reapply declared `local_overrides` exactly; do not invent new overrides.
4. Update `last_synced_commit` and `last_synced_blob` to the accepted upstream identity.
5. Update license notices only if required.
6. Validate that the resulting skill remains discoverable and internally coherent.

## Adding skills

- Canonical path: `skills/<local-id>/SKILL.md`.
- Include supporting files only when referenced or required by the skill.
- Add/update `UPSTREAMS.yaml` for third-party vendored skills.
- Do not overwrite unrelated user-owned paths in Codex or Claude Code delivery locations.
- Keep the repository operable by `git pull` followed by `.\install.ps1` on Windows.

Treat `install.ps1` only as a delivery adapter. It must not become another source of skill semantics or provenance.
