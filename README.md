# agent-skills

Canonical repository for reusable agent skills shared across projects.

## Source of truth

Each reusable skill lives exactly once under:

```text
skills/<skill-name>/SKILL.md
```

Do not maintain separate independently edited copies for Codex, Claude Code, ChatGPT, G2, HAQ/APUS, or other projects. Project-specific skills may still live in their own project when they are not intended to be global.

## Current skills

### decisions

Canonical file: `skills/decisions/SKILL.md`

Purpose: manually ask an agent to surface important decisions from the current work that it is genuinely uncertain about and briefly name strong alternatives.

Upstream: `davidondrej/skills` → `skills/thinking-and-docs/decisions/SKILL.md` (MIT). See `THIRD_PARTY_NOTICES.md`.

## Global installation for Codex and Claude Code

Clone this repository once, then run from PowerShell:

```powershell
.\scripts\install-global.ps1
```

The installer discovers every directory under `skills/` that contains a `SKILL.md` and creates global links for it:

```text
Codex:      ~/.agents/skills/<skill-name>
Claude Code: ~/.claude/skills/<skill-name>
```

The links point to the same canonical local checkout. Existing correct links are left in place. Any conflicting path is skipped rather than overwritten.

### Updating skills

For changes to already linked skills:

```powershell
git pull
```

Because Codex and Claude Code point to the canonical local directories, updates become visible without copying files.

After adding a brand-new skill directory, run the installer again once so links for that new skill are created:

```powershell
.\scripts\install-global.ps1
```

## Invocation

Invocation syntax is environment-specific. The skill content is not.

- Claude Code: use the skill's supported slash invocation when applicable, e.g. `/decisions`.
- Codex: invoke the skill explicitly through the skill invocation supported by the current Codex client.

## ChatGPT

There is intentionally no ChatGPT router or duplicate skill copy in this repository.

When working in ChatGPT with GitHub access, provide the canonical GitHub skill link (or explicitly identify the skill in `FARTOFALOS/agent-skills`) and ask ChatGPT to read and use it for the current task.

This keeps GitHub as the single source of truth without consuming or duplicating ChatGPT Custom Instructions.
