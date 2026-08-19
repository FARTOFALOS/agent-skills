# Artifact Composition Patterns

Use this reference only when one request spans multiple semantic functions or the correct package is ambiguous.

## Principle

A single delivery file may contain multiple artifact roles, but the roles must remain explicit.

Prefer:

`Technical Specification + Implementation Plan + Change Authorization`

over:

`Implementation Mandate`

when the real payload contains requirements, sequencing, and permission.

Do not create a bundle simply because a task is large. Create one only when separate semantic roles are actually required.

## Pattern 1 — New implementation, requirements already decided

Use when the desired behavior is settled and the next actor should build it.

1. **Technical Specification**
   - target behavior;
   - interfaces;
   - invariants;
   - constraints;
   - acceptance criteria.
2. **Implementation Plan** only if sequencing, migration, or risk makes planning material.
3. **Change/Execution Authorization** only when the current user/authority explicitly grants the bounded mutation.

If authorization is absent, stop the package at specification/plan and identify the missing authority boundary.

## Pattern 2 — Architecture choice not yet accepted

Use when multiple consequential technical options remain genuinely open.

1. **RFC / Technical Proposal**
   - problem/context;
   - options;
   - evidence;
   - tradeoffs;
   - recommendation;
   - decision requested.
2. After acceptance, create an **ADR / Decision Record**.
3. Then create an **Implementation Plan** if execution is non-trivial.

Do not write the ADR before the decision exists.

## Pattern 3 — Architecture choice already ratified

Use when reopening alternatives would be drift.

1. Reference or create the **ADR / Decision Record**.
2. Create the **Technical Design Document** if implementation detail remains unresolved.
3. Create the **Implementation Plan** if sequencing matters.
4. Add explicit authorization only when granted.

Do not produce a new RFC merely because another implementation is possible.

## Pattern 4 — Cold read-only audit

Use when another actor must independently inspect evidence without changing the target.

1. **Audit Brief** for a compact cold review, or **Audit Plan** for a detailed method.
2. State:
   - exact target;
   - evidence boundary;
   - prohibited actions;
   - evaluation criteria;
   - verdict/output contract;
   - how missing evidence is treated.
3. Output is an **Audit Report**.

Do not add mutation or repair authority to the audit package unless separately authorized.

## Pattern 5 — Readiness gate

Use when the next question is "may this advance to the next stage?"

1. **Readiness Assessment** defining the target stage and readiness criteria.
2. Evidence-backed verdict.
3. If defects are found, create a separate **Change Request**, **Technical Specification**, or remediation plan as appropriate.

Do not silently convert assessment into repair.

## Pattern 6 — Scientific/research investigation

Choose based on methodological maturity.

### Exploratory
Use **Research Brief** when the question is known but the method should remain adaptable.

### Precommitted / protected method
Use **Research Protocol** when population, data, estimand, method, stopping rules, exposure rules, or analysis boundaries must be fixed before execution.

### Operationally complex
Add an **Execution Plan** only if sequencing, tooling, or state transitions matter beyond the protocol itself.

### Completion
Return a **Research Report** with evidence, results, limitations, and conclusions.

Never treat the Research Protocol as authorization to access protected data or perform irreversible exposure unless that authority is explicitly part of the governing system.

## Pattern 7 — Baseline-controlled repair

Use when a known defect should be repaired without changing protected semantics.

1. **Change Request** if approval to change the baseline is still pending.
2. **Narrow Technical Specification** defining:
   - defect;
   - required correction;
   - protected invariants;
   - forbidden semantic changes;
   - acceptance criteria.
3. **Implementation Plan** if non-trivial.
4. **Change Authorization** only after/when explicitly granted.
5. Verification evidence after implementation.

Do not hide semantic expansion inside a "repair" label.

## Pattern 8 — Deployment/release

Use when implementation is complete and the remaining state change is operational deployment.

1. **Deployment Plan**.
2. **Rollout Plan** when progressive release matters.
3. **Rollback Plan** when recovery is material.
4. **Deployment Authorization** when explicitly granted.
5. **Release Notes** or deployment report after completion when needed.

Implementation approval does not automatically imply deployment approval.

## Pattern 9 — Successor agent continuation

Use **Handoff** when the objective is continuity rather than a new decision.

A good handoff contains only the authoritative state needed to continue:

- objective;
- current baseline/state;
- completed work;
- ratified decisions;
- protected constraints;
- unresolved blockers/unknowns;
- evidence/artifact locations;
- exact continuation point;
- currently valid authority, if explicitly known.

Do not turn historical permission into standing authority.

If the successor also needs a new bounded task, pair the Handoff with the appropriate Brief/Specification/Plan rather than making the Handoff itself carry new semantics.

## Pattern 10 — Incident/failure learning

Use **Postmortem** when the goal is to understand an event and improve the system.

Use **RCA** when the narrower objective is causal explanation.

Follow-up changes should become separate:

- Decision Records;
- Change Requests;
- Technical Specifications;
- Implementation Plans.

Do not treat recommendations in a postmortem as automatically approved changes.

## Pattern 11 — Repeatable operational work

Use **Runbook** when operators should follow a stable exact procedure.

Use **Playbook** when operators need branching response strategies.

Use **SOP** when organizational standardization/compliance is the central purpose.

Use **Checklist** only as a compact verification aid; do not use it to replace missing procedure or requirements.

## Pattern 12 — Agent prompt delivery

When the user asks for "a prompt for Codex/Claude/the next agent":

1. infer the semantic artifact type first;
2. title the payload with that type;
3. make dependencies and authority explicit;
4. write the content so a capable cold executor can act without inventing material semantics;
5. avoid vendor-specific wording unless the target agent actually requires it.

Examples of routing:

- "Tell the next agent what we know and where to continue" -> **Handoff**.
- "Tell the next agent exactly what behavior to build" -> **Technical Specification**.
- "Have the next agent decide whether this architecture is sound, read-only" -> **Audit Brief/Plan**.
- "Give the next agent permission to implement the already specified change" -> **Change/Execution Authorization**, usually paired with the existing Specification.
- "We have not chosen between A and B; prepare this for engineering review" -> **RFC / Technical Proposal**.

## Anti-patterns

### The universal mandate
One long document called `MANDATE` containing problem framing, requirements, design choices, execution steps, permission, tests, and handoff state.

**Repair:** split semantic roles, even if they remain sections of one delivery file.

### Plan-as-authority
"Implement, commit, and push according to this plan" when no actor with current authority granted mutation/push.

**Repair:** preserve the plan; mark authorization unresolved.

### Proposal-as-decision
An RFC recommendation described as settled truth.

**Repair:** keep it proposal-state until explicit ratification/evidence of accepted decision.

### Handoff-as-canon rewrite
A successor handoff restates old decisions with altered semantics.

**Repair:** point to authoritative decisions/specifications and summarize without changing them.

### Audit-with-repair-creep
A read-only audit discovers a defect and immediately modifies the target.

**Repair:** report the defect; route repair into a separate authorized change artifact.

### Checklist-as-specification
A list of boxes stands in for undefined behavior or acceptance semantics.

**Repair:** create the missing specification/procedure; use checklist only for confirmation.

## Final bundle test

Before delivering a multi-artifact package, ask:

1. Which distinct semantic functions are present?
2. Could any component be removed without losing necessary meaning or safety?
3. Is any authority merely inferred?
4. Is any proposal being presented as ratified?
5. Are protected requirements mixed with replaceable implementation methods?
6. Does the next actor know what is authoritative and what is merely guidance?

Keep only the minimal bundle that passes this test.
