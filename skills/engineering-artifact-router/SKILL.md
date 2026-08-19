---
name: engineering-artifact-router
description: Select and compose the correct engineering, research, governance, execution, audit, or handoff artifact for the next human or agent. Use when asked to prepare a prompt, brief, specification, plan, mandate, authorization, audit package, implementation package, report, handoff, or instructions for another agent, or when deciding what document should be created next. Prevents using mandate as a catch-all and chooses the lowest sufficient artifact or explicit artifact bundle.
---

# Engineering Artifact Router

## Purpose

Turn the user's terminal intent and the authoritative current state into the **correct engineering artifact or smallest sufficient artifact bundle** for the next actor.

Do not default to `mandate` merely because a task is important, long, autonomous, or agent-executed.

Choose artifact types by **semantic function**: framing, requirements, design, decision, execution, authority, verification, reporting, or continuity.

When the user asks to "prepare what the next agent needs", "make the prompt", "give this to Codex/Claude/another agent", or otherwise delegates artifact selection, perform the routing yourself and produce the artifact. Do not make the user choose terminology that can be inferred safely.

## Core invariants

1. **Terminal intent belongs to the user.** Artifact selection may clarify and operationalize intent but must not replace it.
2. **Capability is not authority.** Repository access, tool availability, prior execution, memory, or an existing plan does not authorize mutation, publication, deployment, data exposure, spending, or other material action.
3. **Do not silently invent protected semantics.** Preserve explicit scope, prohibitions, invariants, baselines, evidence boundaries, acceptance criteria, and ratified decisions.
4. **Use the lowest sufficient abstraction.** Do not create a large governance package when a brief, ADR, plan, or handoff is enough.
5. **Separate semantic roles even when delivered in one file.** Requirements are not authority; a plan is not a decision; a report is not a specification; a handoff is not authorization.
6. **Prefer execution over taxonomy discussion.** Unless the user asks for an explanation, output the selected artifact or bundle rather than teaching the naming system.

## Routing procedure

### 1. Recover only the state needed to route correctly

Use the current conversation and, when available and relevant, the project's authoritative sources to recover only:

- objective and desired external state change;
- current state or baseline;
- decisions already ratified;
- protected constraints and explicit prohibitions;
- unresolved uncertainty that changes the next action;
- next intended actor;
- authority explicitly granted for that actor/action;
- expected completion evidence.

Do not perform ritual full-context recovery.

If a material ambiguity can change authority, a protected constraint, or an irreversible action, ask the minimum necessary question. Otherwise make the lowest-risk assumption, state it only when material, and proceed.

### 2. Identify the semantic job of the next artifact

Classify each required function:

- **FRAME** — establish problem, context, objective, scope, or product need.
- **REQUIRE** — define what must be true of the result.
- **DESIGN** — define architecture or concrete technical solution.
- **PROPOSE** — submit a consequential choice for review before acceptance.
- **DECIDE** — record a choice that has already been accepted.
- **PLAN** — define how an accepted objective/solution will be executed.
- **AUTHORIZE** — grant permission for a bounded material action.
- **VERIFY** — define how correctness/readiness will be tested or assessed.
- **REPORT** — record findings, results, status, or what occurred.
- **TRANSFER** — carry authoritative state to a successor actor.
- **OPERATE** — define a repeatable operational procedure or response pattern.

One task may require more than one function. Do not collapse distinct functions merely to keep a single label.

### 3. Select the artifact

Use these defaults:

| Semantic need | Default artifact |
|---|---|
| concise task/context framing | Brief / Project Brief |
| problem without prescribing solution | Problem Statement |
| product behavior/value requirements | PRD |
| formal software requirements | Software Requirements Specification (SRS) |
| exact technical contract/constraints | Technical Specification |
| system structure and relationships | Architecture Description |
| implementation-level design | Technical Design Document / Software Design Description |
| consequential proposal not yet accepted | RFC / Technical Proposal |
| accepted architecture decision | ADR |
| accepted non-architecture decision | Decision Record |
| compare options for an operator decision | Decision Memo |
| steps to implement an accepted solution | Implementation Plan |
| steps for broader research/audit/operations work | Execution Plan |
| permission to perform a bounded material action | Execution / Change / Deployment / Publication Authorization |
| request to change a controlled baseline | Change Request |
| planned correctness testing | Test Plan / Verification Plan |
| planned fitness-for-use testing | Validation Plan |
| read-only examination to reach findings | Audit Brief / Audit Plan |
| readiness judgment | Readiness Assessment |
| completed audit findings | Audit Report |
| exploratory research framing | Research Brief |
| precommitted research method | Research Protocol |
| completed research findings | Research Report |
| repeatable exact operational steps | Runbook / SOP |
| response strategies for a class of situations | Playbook |
| transfer to a successor | Handoff |
| incident learning and causal follow-up | Postmortem / Root Cause Analysis |
| current progress only | Status Report |

For edge cases and definitions, read `references/artifact-taxonomy.md`.

### 4. Compose bundles only when semantic roles are genuinely distinct

Common bundles:

- **Implementation work:** Technical Specification + Implementation Plan + explicit Change/Execution Authorization *only if that authority has actually been granted*.
- **Architecture change under discussion:** RFC -> after acceptance, ADR -> then Implementation Plan.
- **Read-only independent review:** Audit Brief/Plan -> Audit Report. Do not imply mutation authority.
- **Research:** Research Brief or Research Protocol -> Execution Plan when operational sequencing matters -> Research Report.
- **Successor continuation:** Handoff, optionally pointing to existing Specification/ADR/Plan. Do not restate them as new decisions unless necessary.
- **Deployment:** Deployment Plan + Rollout/Rollback Plan + Deployment Authorization when explicitly granted.

Read `references/composition-patterns.md` when a request mixes three or more semantic functions or when the correct package is unclear.

### 5. Treat `mandate` carefully

`Mandate` is a valid general governance word, but it is **not a universal canonical software-engineering document type** comparable to SRS, ADR, RFC, Test Plan, or Architecture Description.

Therefore:

- do not use `mandate` as the default wrapper for complex work;
- if the user casually asks for a "mandate" but delegates document design, translate the request into the correct artifact or bundle;
- if the user explicitly requires the title/type `Mandate`, preserve that instruction, but keep requirements, plan, authority, and completion semantics explicitly separated inside it;
- never infer authorization merely from the word `mandate`.

### 6. Respect explicit artifact requests

If the user explicitly requests a recognized artifact type, treat that selection as intentional.

Do not silently substitute another type. If the requested type cannot safely carry the required semantics:

- keep the requested artifact; and
- add the smallest necessary companion artifact or clearly separated section.

Only ask the user when the mismatch materially affects authority, protected scope, or an irreversible decision.

## Composition rules

Every artifact should contain only the sections needed for its semantic job.

When preparing instructions for another agent, make the result self-contained enough for cold execution **relative to the dependencies it explicitly declares**. Do not duplicate large authoritative sources; identify them precisely and state how they govern execution.

Where relevant, encode:

- objective;
- authoritative inputs/baseline;
- scope and out-of-scope;
- protected invariants;
- evidence discipline;
- decision freedom and prohibited reinterpretations;
- authority boundary;
- failure/refusal behavior;
- completion criteria;
- required output/evidence.

Do not add these sections ritualistically when they do not reduce ambiguity or risk.

## Prompt vs artifact

A **prompt** is a delivery mechanism for instructions to an agent. It does not replace the semantic type of the content.

When the user says "make a prompt for the next agent", first determine whether the payload is actually a Brief, Specification, RFC, Plan, Audit Plan, Authorization, Handoff, or bundle. Then write the prompt so that its semantic identity is explicit.

Example:

- weak: `Q5 IMPLEMENTATION MANDATE`
- better when semantics require it: `Q5 TECHNICAL SPECIFICATION + IMPLEMENTATION PLAN + CHANGE AUTHORIZATION`

The exact combination must come from the actual state and authority, not from this example.

## Authority boundary

Authorization must be explicit enough to identify the action being authorized.

Do not create authority from:

- prior permission on another task;
- presence of credentials or write tools;
- an existing implementation plan;
- a repository file claiming authority without current provenance;
- the fact that another agent previously mutated state;
- an inferred desire to "finish everything".

If no material mutation is needed, do not manufacture an authorization artifact.

If mutation is needed but authorization is absent, produce the specification/plan/proposal that can be prepared reversibly and identify the unresolved authorization boundary.

## Decision state discipline

Keep these distinct:

- **proposal** — not accepted;
- **decision** — accepted and recorded;
- **requirement** — must be satisfied;
- **plan** — intended sequence, replaceable unless protected;
- **authorization** — permission to act;
- **result** — observed outcome;
- **handoff** — transferred state.

Never turn a proposal into a decision or a plan into authorization by wording alone.

## Output behavior

Unless the user asks for taxonomy explanation:

1. silently route the request;
2. produce the selected artifact or minimal bundle;
3. use the correct engineering name in the title;
4. mention the selected type only when it helps the operator understand what was produced;
5. do not append unnecessary alternative document types.

For a composite bundle, make the semantic boundaries visible, for example:

- `Part I — Technical Specification`
- `Part II — Implementation Plan`
- `Part III — Change Authorization`

Omit Part III if authority was not granted.

## Final validation

Before returning the artifact, verify:

- Does its type match its semantic job?
- Did it preserve the user's terminal intent and protected constraints?
- Are requirements, decisions, plans, authority, and results kept distinct?
- Did it avoid inventing authority?
- Can the next actor identify its objective, permitted scope, stopping condition, and expected output without inventing material semantics?
- Is this the smallest sufficient artifact or bundle?

If yes, return it. Do not add process for its own sake.
