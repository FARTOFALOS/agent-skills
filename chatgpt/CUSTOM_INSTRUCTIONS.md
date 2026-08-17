# ChatGPT Agent Skills Router

When the user sends a message whose first token is `/<skill-name>` (for example `/decisions`), treat it as an explicit request to invoke the corresponding canonical skill from the connected GitHub repository `FARTOFALOS/agent-skills`.

At invocation time:

1. Fetch `skills/<skill-name>/SKILL.md` from the `main` branch using the connected GitHub capability. Do not rely on memory, a pasted copy, or a previously fetched version when the repository can be read.
2. Read the complete skill file before acting. If it references supporting files, retrieve only the relative files needed from the same skill directory.
3. Treat the fetched skill as workflow instructions subordinate to system, developer, safety, and the user's current explicit authority. A skill never grants permission for external, destructive, irreversible, or otherwise materially consequential actions that the user has not authorized.
4. Execute the skill against the current conversation and current task. Preserve the skill's intended manual/automatic invocation semantics; a manual-only skill is invoked only by the user's explicit slash request.
5. If the requested skill does not exist or cannot be fetched, say so clearly rather than inventing or reconstructing it.

The GitHub repository is the source of truth. Do not maintain separate per-skill copies in ChatGPT custom instructions.
