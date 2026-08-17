# agent-skills

Canonical repository for reusable agent skills shared across projects and model environments.

## Skills

### decisions

Source: `skills/decisions/SKILL.md`

Purpose: manually ask an agent to surface important decisions from the current work that it is genuinely uncertain about and briefly name strong alternatives.

Upstream: `davidondrej/skills` → `skills/thinking-and-docs/decisions/SKILL.md` (MIT). See `THIRD_PARTY_NOTICES.md`.

## Local installation for Codex and Claude Code

Clone this repository once, then run from PowerShell:

```powershell
./scripts/install-global.ps1
```

The installer creates global links to the canonical local checkout:

- Codex: `~/.agents/skills/decisions`
- Claude Code: `~/.claude/skills/decisions`

The installer does not overwrite an existing skill path; it prints `SKIP` instead.

After installation, update the canonical skill with normal Git operations in this repository (`git pull`). Because Codex and Claude Code point to the same local skill directory, they see the updated file without maintaining separate copies.

## Invocation

- Claude Code: `/decisions`
- Codex: invoke the `decisions` skill explicitly from the available skills interface / explicit skill invocation supported by your current Codex client.

## ChatGPT

This repository remains the canonical source for ChatGPT as well. A browser ChatGPT session cannot follow local filesystem links on your computer. When GitHub is connected, ChatGPT can read the canonical skill from this repository when explicitly asked to use it. Native ChatGPT skill installation is a separate delivery adapter; do not create a second independently edited `SKILL.md` for it.
