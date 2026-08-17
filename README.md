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

The installer discovers every directory under `skills/` that contains a `SKILL.md`.

### Codex delivery

Codex gets a global filesystem link:

```text
~/.agents/skills/<skill-name> -> canonical checkout
```

This keeps Codex directly on the canonical local skill directory.

### Claude Code delivery

Claude Code gets a managed real directory at its documented personal-skill location:

```text
~/.claude/skills/<skill-name>/SKILL.md
```

The installer copies from the canonical checkout and writes `.agent-skills-managed` so it can distinguish its own derived copies from user-owned directories. It never overwrites an unmarked conflicting Claude skill.

Older Claude junctions created by previous versions of this installer are migrated automatically when they point to the same canonical skill source.

## Updating skills

Use the same two commands after canonical changes or when a new skill is added:

```powershell
git pull
.\scripts\install-global.ps1
```

Codex links see edits in the canonical checkout directly. Rerunning the installer synchronizes Claude Code's managed copies and creates delivery for new skills.

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
