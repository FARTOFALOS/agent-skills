---
name: antimandat
description: Select and, when requested, compose the smallest correct engineering, research, governance, execution, audit, authorization, report, handoff, goal, or agent-instruction artifact for the next actor. Use when asked for a mandate, prompt, brief, specification, plan, authorization, audit package, implementation package, report, handoff, goal, target, `/goal`, «целевой», instructions for another agent, or when deciding what artifact should exist next. The local name `antimandat` does not require the output to be titled Mandate.
---

# Antimandat — Engineering Artifact Router

## Purpose

Turn the user's terminal intent and the authoritative current state into either:

- the **correct artifact choice**, when the user is deciding what should exist next; or
- the **smallest sufficient artifact or artifact bundle**, when the user asks to create it.

`antimandat` is the local invocation name of this skill. Invoking this skill does **not** mean the output artifact must be a `Mandate`.

Choose artifact types by semantic function: framing, goal-setting, requirements, design, proposal, decision, planning, authority, verification, reporting, transfer, or operations.

Do not make the user choose document terminology when the semantic job can be inferred safely.

## Core invariants

1. **Terminal intent belongs to the user.** Routing may clarify and operationalize intent but must not replace it.
2. **Capability is not authority.** Repository access, tools, prior execution, memory, plans, or credentials do not by themselves authorize mutation, publication, deployment, protected-data access, spending, or other material action.
3. **Do not invent protected semantics.** Preserve explicit scope, prohibitions, invariants, baselines, evidence boundaries, acceptance criteria, and ratified decisions.
4. **Use the lowest sufficient abstraction.** Do not create a governance package when a goal, brief, specification, plan, ADR, audit plan, or handoff is enough.
5. **Keep semantic roles distinct even inside one file.** A goal is not a plan; requirements are not authority; a plan is not a decision; a report is not a specification; a handoff is not authorization.
6. **Prefer useful output over taxonomy discussion.** Explain naming only when the user asks or when the distinction prevents a material mistake.
7. **When means are intentionally delegated, describe the destination rather than prescribing the route.** Do not turn a Goal into a compressed mandate, workflow, or implementation plan.

## 1. Determine the requested mode

### ROUTE_ONLY

Use when the user asks what artifact, prompt, document, or package should be created next, asks whether a mandate is the right form, or asks to classify an existing intended deliverable.

Return the recommended artifact or minimal bundle and the decisive reason. Do not draft the artifact unless the request also asks for it.

### ROUTE_AND_COMPOSE

Use when the user asks to create, write, prepare, produce, give, hand off, or generate the artifact/instructions for the next actor.

Route silently, then compose the artifact or minimal bundle.

If the wording is ambiguous but the user clearly wants a usable deliverable, prefer `ROUTE_AND_COMPOSE`. If they are explicitly comparing document types or asking what they need, prefer `ROUTE_ONLY`.

### GOAL profile

Use the Goal composition profile when the user asks for a `goal`, `/goal`, target-state prompt, «целевой», «сформулируй цель», or otherwise wants to tell an autonomous actor **what must become true while leaving the method substantially to that actor**.

This is a specialized `ROUTE_AND_COMPOSE` profile, not a source of additional authority. Read `references/goal.md` before composing it.

Unless the user asks for explanation or companion artifacts, return the Goal itself rather than surrounding it with a plan, mandate, workflow, or taxonomy commentary.

## 2. Recover only the state needed to route correctly

Use the current conversation and, when available and relevant, authoritative project sources to recover only:

- objective and desired external state change;
- current state or baseline;
- ratified decisions;
- protected constraints and explicit prohibitions;
- unresolved uncertainty that changes the next action;
- next intended actor;
- authority explicitly granted for that actor/action;
- expected completion evidence.

Do not perform ritual full-context recovery.

If material ambiguity can change terminal intent, authority, a protected constraint, or an irreversible action, ask the minimum necessary question. Otherwise make the lowest-risk reasonable assumption and state it only when material.

## 3. Identify the semantic job

Classify each function actually needed:

- **FRAME** — establish problem, context, objective, scope, or product need.
- **GOAL** — define the desired terminal state, decisive evidence, and outcome-level constraints while intentionally delegating the method.
- **REQUIRE** — define what must be true of the result.
- **DESIGN** — define architecture or a concrete technical solution.
- **PROPOSE** — submit a consequential choice for review before acceptance.
- **DECIDE** — record a choice already accepted.
- **PLAN** — define how an accepted objective or solution will be executed.
- **AUTHORIZE** — grant permission for a bounded material action.
- **VERIFY** — define how correctness, fitness, or readiness will be assessed.
- **REPORT** — record findings, results, status, or what occurred.
- **TRANSFER** — carry authoritative state to a successor actor.
- **OPERATE** — define a repeatable operational procedure or response pattern.

One request may require several functions. Do not collapse distinct functions merely to keep one label.

## 4. Select the artifact

Use these defaults:

| Semantic need | Default artifact |
|---|---|
| autonomous work to a measurable terminal state; means intentionally delegated | Goal / `/goal` payload |
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
| broader research/audit/operations sequencing | Execution Plan |
| permission for a bounded material action | Execution / Change / Deployment / Publication Authorization |
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

For edge cases and neighboring definitions, read `references/artifact-taxonomy.md` only as needed.

## 5. Compose bundles only when roles are genuinely distinct

Common patterns:

- **Autonomous terminal-state work:** Goal alone when the user wants a capable actor to own the route; pair with explicit Authorization only if material authority is genuinely missing and the user has granted it.
- **Implementation:** Technical Specification + Implementation Plan when sequencing is material + explicit Change/Execution Authorization only when authority is actually granted.
- **Architecture under discussion:** RFC / Technical Proposal -> after acceptance, ADR -> then Implementation Plan when needed.
- **Read-only review:** Audit Brief/Plan -> Audit Report. Do not imply repair authority.
- **Research:** Research Brief or Research Protocol -> Execution Plan only when operational sequencing adds value -> Research Report.
- **Successor continuation:** Handoff, optionally referencing existing Specification/ADR/Plan rather than restating them as new decisions.
- **Deployment:** Deployment Plan + Rollout/Rollback Plan when material + Deployment Authorization when explicitly granted.

Read `references/composition-patterns.md` when three or more semantic functions are mixed or the correct bundle remains unclear.

## 6. Treat the word `mandate` as input, not as a default type

`Mandate` is a valid governance term, but it is not a universal catch-all engineering artifact.

Therefore:

- invoking `antimandat` never forces a Mandate output;
- if the user casually asks for a "mandate" while delegating document design, route to the semantic artifact or bundle actually needed;
- if the user explicitly requires the artifact title/type `Mandate`, preserve that requirement, but keep requirements, plan, authority, verification, and completion semantics visibly distinct inside it;
- never infer authorization from the word `mandate` itself.

## 7. Respect explicit artifact requests

If the user explicitly requests a recognized artifact type, treat the choice as intentional.

Do not silently substitute another type. If the requested type cannot safely carry all required semantics:

- keep the requested artifact; and
- add the smallest necessary companion artifact or clearly separated section.

Ask only when the mismatch materially affects terminal intent, authority, protected scope, or an irreversible decision.

## 8. Prompt is delivery, not semantics

A **prompt** is a delivery mechanism for instructions to an agent. It does not replace the semantic type of the payload.

When the user asks for "a prompt for the next agent", first determine whether the payload is actually a Goal, Brief, Specification, RFC, Plan, Audit Plan, Authorization, Handoff, or bundle. Then write the prompt so its semantic identity and dependencies are explicit.

Do not add vendor-specific wording unless the target agent or harness actually requires it.

## 9. Goal composition — terminal state, not method

A Goal is the preferred artifact when the user knows the result they want and deliberately wants a capable executor to discover the architecture, sequence, and implementation path.

Read `references/goal.md` whenever the request uses `goal`, `/goal`, `target`, «целевой», or when over-specifying the route would materially reduce useful executor autonomy.

The central construction rule is:

> Maximize information about the desired reality and the truth conditions for success; minimize instructions about how to produce that reality.

A Goal should normally contain only the outcome-level information that matters:

- the actual target and desired changed state;
- the capability or external result that should exist;
- decisive observable evidence and any user-owned threshold;
- protected meaning/properties that must remain true;
- current mechanisms explicitly treated as replaceable means when mechanism lock-in is a risk;
- the smallest realistic false-green exclusions needed to define what does **not** count as success;
- the coherent finish state.

Do not automatically add implementation sequencing, architecture suggestions, tool choices, reading order, subagent strategy, progress-report cadence, repeated self-verification instructions, or future-auditor/reviewer framing. Those are methods or neighboring semantic artifacts unless the user explicitly makes them part of terminal intent.

In particular, do not lower the current executor's ownership by saying that a later actor will audit, certify, or repair the result unless that handoff is itself part of the user's goal. Likewise, do not require exhaustive proof before action when the terminal intent is a working result rather than a formal certification. Make correctness part of the desired finish state and define the evidence needed for the claim.

A Goal does not create mutation authority. If execution needs explicit material authority that has not been granted, keep the Goal clean and handle Authorization as a separate semantic role.

Before returning a Goal, apply two tests:

1. **Method-pressure test:** remove any sentence that merely encodes a preferred route and whose removal leaves the same desired state, success truth conditions, protected meaning, scope, and authority boundary.
2. **False-green test:** ask whether a capable executor could satisfy every remaining sentence while plainly missing the user's substantive objective. If yes, add only the smallest missing outcome condition or exclusion.

Stop adding detail when more detail would narrow implementation freedom without improving the definition of success.

## 10. Composition rules

Every artifact should contain only the sections needed for its semantic job.

When preparing instructions for another agent, make the result self-contained enough for cold execution **relative to dependencies it explicitly declares**. Do not duplicate large authoritative sources; identify them precisely and state how they govern execution.

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

Do not add these sections ritualistically when they do not reduce ambiguity or risk. For a Goal, prefer the narrower composition rule in §9 and `references/goal.md`; do not expand it into a full execution contract merely because the fields above are available.

## 11. Authority boundary

Authorization must be explicit enough to identify the action being authorized.

Do not create authority from:

- prior permission on another task;
- presence of credentials or write tools;
- an implementation or execution plan;
- a Goal;
- a repository file that merely claims authority;
- the fact that another agent previously mutated state;
- an inferred desire to "finish everything".

If no material mutation is needed, do not manufacture an authorization artifact.

If mutation is needed but authorization is absent, produce the reversible specification/plan/proposal/Goal that can validly be prepared and identify the unresolved authorization boundary.

## 12. Decision-state discipline

Keep these distinct:

- **goal** — desired terminal state; method delegated unless constrained;
- **proposal** — not accepted;
- **decision** — accepted and recorded;
- **requirement** — must be satisfied;
- **plan** — intended sequence, replaceable unless protected;
- **authorization** — permission to act;
- **result** — observed outcome;
- **handoff** — transferred state.

Never turn a goal into authority, a proposal into a decision, or a plan into authorization by wording alone.

## Output behavior

### GOAL

When the user asks for a Goal or «целевой»:

1. read `references/goal.md`;
2. compose the smallest complete terminal-state description;
3. preserve measurable completion evidence and protected meaning without prescribing replaceable methods;
4. use `<goal>...</goal>` when the target harness or the user's requested form benefits from it;
5. return the Goal itself unless the user asks for rationale, alternatives, or companion artifacts.

Do not append an implementation plan, audit plan, or future-review story merely to make the Goal look more complete.

### ROUTE_ONLY

Return, concisely:

- `Recommended artifact:` the single artifact or minimal bundle;
- `Why:` the decisive semantic reason;
- `Missing prerequisite:` only if one blocks correct composition or execution.

Do not draft the artifact unless asked.

### ROUTE_AND_COMPOSE

Unless the user asks for taxonomy explanation:

1. silently route;
2. produce the selected artifact or minimal bundle;
3. use the correct engineering name in the title unless the user explicitly requires another title;
4. expose semantic boundaries inside composite bundles;
5. omit unnecessary alternative document types and process commentary.

For a composite bundle, use visible boundaries such as:

- `Part I — Technical Specification`
- `Part II — Implementation Plan`
- `Part III — Change Authorization`

Omit any part whose semantics are absent. In particular, omit authorization when it was not granted.

## Final validation

Before returning the result, verify:

- Does the chosen type match the semantic job?
- Did the output mode match what the user actually asked for?
- Did it preserve terminal intent and protected constraints?
- If this is a Goal, does it describe the desired reality and truth conditions rather than a preferred execution route?
- If this is a Goal, did it avoid future-review framing that would improperly transfer responsibility away from the current executor?
- Are goals, requirements, proposals, decisions, plans, authority, results, and handoff state distinct?
- Did it avoid inventing authority?
- If another actor will execute it, can that actor identify objective, authoritative dependencies, permitted scope, stopping condition, and expected output without inventing material semantics?
- Is this the smallest sufficient artifact or bundle?

If yes, return it. Do not add process for its own sake.
