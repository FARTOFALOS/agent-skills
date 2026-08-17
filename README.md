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

### nativeprompt

Canonical file: `skills/nativeprompt/SKILL.md`

Purpose: improve or rewrite a prompt for the current target model using vendor-specific guidance, while treating the supplied prompt as data rather than executing it.

Upstream: `edvardgrishin27/nativeprompt` → root `SKILL.md` (MIT). See `THIRD_PARTY_NOTICES.md`.

Runtime dependency: the skill calls the `nativeprompt` Python CLI. Install it separately on each machine that will execute the skill:

```powershell
pipx install nativeprompt
```

The upstream package is named `nativeprompt`, requires Python 3.9+, and has no runtime dependencies beyond the standard library.

## Global installation for Codex and Claude Code

Clone this repository once, then run from PowerShell:

```powershell
.\scripts\install-global.ps1
```

The installer discovers every directory under `skills/` that contains a `SKILL.md` and creates global links for it:

```text
Codex:       ~/.agents/skills/<skill-name>
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

### Claude Code

Personal skills under `~/.claude/skills/<name>/SKILL.md` are directly invokable as `/name`.

Examples:

```text
/decisions
/nativeprompt
```

### Codex

Invoke a skill explicitly with its skill name using the Codex skill invocation syntax supported by the current client. The NativePrompt upstream Codex integration documents:

```text
$nativeprompt улучши этот промпт для Codex: ‹промпт›
```

## ChatGPT

There is intentionally no ChatGPT router or duplicate skill copy in this repository.

When working in ChatGPT with GitHub access, provide the canonical GitHub skill link (or explicitly identify the skill in `FARTOFALOS/agent-skills`) and ask ChatGPT to read and use it for the current task.

This keeps GitHub as the single source of truth without consuming or duplicating ChatGPT Custom Instructions.
