# Goal — terminal-state delegation

Use this reference when `antimandat` is asked for a **goal**, **target**, **целевой**, **/goal**, or an equivalent instruction whose purpose is to give an autonomous actor a destination while deliberately preserving freedom over the route.

## Semantic role

A Goal describes **what must become true in the world or system for the task to be complete**.

It is not a compressed mandate, implementation plan, workflow, design, audit plan, or checklist. Its job is to maximize useful information about the desired terminal state while minimizing accidental prescription of how the executor should reach it.

A strong Goal gives the executor enough truth to choose methods autonomously:

- the object or system whose state should change;
- the desired capability or external result;
- the decisive observable evidence that makes completion real;
- quantitative thresholds when the terminal intent actually contains them;
- properties, meaning, or invariants that must survive the transformation;
- what is explicitly *not* the goal when an attractive false-green path could satisfy the wording while defeating the intent;
- the coherent finish state the user expects to exist.

Everything else is suspect until it proves that it changes the meaning of success.

## Core principle: describe the destination, not the route

For every candidate sentence, ask:

> Does this sentence constrain the desired result, its truth conditions, protected meaning, scope, or a false-green path — or does it merely tell the executor how I currently imagine getting there?

Keep the first category. Remove the second unless the method itself is an operator-owned constraint.

The Goal should usually **not** tell the executor:

- what order to inspect, diagnose, design, implement, test, or publish in;
- which architecture, mechanism, cache, framework, algorithm, tool, or decomposition to choose;
- how many agents to spawn or whether to delegate;
- when to narrate progress, checkpoint, or ask for reassurance;
- to repeatedly "double-check" or audit itself when correctness is already part of the terminal state;
- to prepare for a hypothetical future reviewer or to rely on one to repair the result;
- which implementation hypothesis from the current conversation should become the solution;
- to preserve a current mechanism merely because it currently carries a valuable property.

If such content is genuinely required, it belongs in a Specification, Plan, Authorization, Verification Plan, Runbook, or other distinct semantic artifact unless it is itself part of terminal intent.

## Goal construction

Build the Goal from the following layers, using only the layers that materially reduce ambiguity.

### 1. Desired reality

State the finished external condition in concrete terms.

Prefer:

> Transform `[current object]` into `[finished state]` where `[capability/result]` is true.

Avoid opening with a sequence of activities. Activities are means; the changed state is the goal.

### 2. Decisive evidence

Name the observation that would make the result real rather than rhetorical.

Prefer evidence at the level where value is actually realized: a real native path, deployed behavior, observed output, reproduced scientific result, accepted artifact, measured operating condition, or other end-to-end consequence.

Do not let a proxy silently replace the terminal result. A microbenchmark is not an operational speedup; green unit tests are not automatically a correct system; a design document is not an implemented capability.

### 3. Success threshold

Include a number, boundary, identity, or pass condition when the user actually owns one. Keep it outcome-level.

Do not invent thresholds merely to make the Goal look measurable.

### 4. Protected meaning and properties

State what valuable properties must remain true after the change: scientific meaning, user behavior, provenance, safety, compatibility, reliability, reversibility, institutional intent, or other protected outcomes.

Protect **properties**, not accidental implementations.

When useful, say explicitly that current mechanisms are replaceable means. This prevents the executor from preserving expensive structure merely because it happens to carry the protected property today.

### 5. False-green exclusions

Add only the exclusions necessary to stop a formally compliant result from defeating the substantive objective.

Examples of legitimate Goal-level exclusions:

- an easier final workload cannot establish a claimed speedup;
- hidden work cannot be moved outside the measured boundary if it still determines completion;
- a required guarantee cannot be replaced with unconditional success;
- a partial or simulated result cannot stand in for the required real one.

These clauses define **what does not count as success**. They should not become a catalogue of defensive process rules.

### 6. Coherent finish state

Describe the state that should exist when the actor is done. The result should sound like a stable new reality, not "progress was made" or "a proposal exists" unless the proposal itself is the terminal objective.

If a final report is useful, ask only for the evidence needed to expose the achieved state. Do not turn the reporting format into a second task.

## Responsibility without bureaucracy

A Goal should make the current executor own the resulting state.

Do not weaken ownership by telling the executor that another agent, auditor, reviewer, or future phase will later decide whether its work was acceptable, unless that handoff is itself part of the user's terminal intent.

Likewise, do not turn ownership into pre-action paralysis. If the user wants a working system rather than a formal certification, do not require exhaustive proof of complete equivalence before the executor can act. Express correctness as a property of the finished state and let the executor find sufficient evidence through its own work.

The useful middle is:

- freedom over methods;
- responsibility for the finished result;
- evidence proportionate to the claim;
- explicit genuine uncertainty when the terminal intent permits uncertainty;
- no license to defer known material failure to somebody else.

## Current state and source material

Include current-state facts only when they define the delta, scope, authoritative baseline, or meaning of success.

Do not dump project history into a Goal. If the project has an authoritative bootstrap or repository-native discovery mechanism, identify the target and let the executor recover replaceable operational detail from there.

Name external sources when their authority or semantic role matters. Do not prescribe reading order unless reading order is itself authoritative.

## Goal versus neighboring artifacts

- **Goal:** what should become true; methods intentionally delegated.
- **Brief / Problem Statement:** why the problem matters and how it is framed.
- **Specification:** exact requirements or technical contract the implementation must satisfy.
- **Design:** chosen architecture or solution structure.
- **Plan:** intended sequence of execution.
- **Authorization:** permission to perform a material action.
- **Verification Plan:** prescribed assessment method.
- **Mandate:** a governance package that may combine several of these roles.

A Goal does **not** create authority. If material mutation requires explicit authorization and the user has not already supplied it, keep the Goal clean and route the missing authority separately rather than smuggling permission into goal wording.

## Compression test

Before returning a Goal, remove any sentence whose deletion would leave the same terminal state, success truth conditions, protected meaning, scope, and authority boundary intact.

Then check the inverse: could a capable executor satisfy every remaining sentence while obviously missing the user's substantive objective? If yes, add the smallest missing outcome condition or false-green exclusion.

A Goal is complete when more procedural detail would narrow implementation freedom without improving the definition of success.

## Generic shape

Use this only as a structural pattern, not as mandatory boilerplate:

```text
<goal>
Transform [actual target/current state] into [desired finished state] where [capability or external result] is true.

The decisive evidence is [observable end-to-end result], with [threshold/identity] where materially required. [Partial/proxy outcome] does not satisfy the goal.

[Protected meaning/properties] remain true in the finished system. Existing [mechanisms/structures] are replaceable means unless they are themselves protected requirements.

The result does not count if [small set of realistic false-green paths].

The finish state is [coherent operational reality].
</goal>
```

Do not fill every paragraph merely because the pattern contains it. The smallest complete description of the desired reality is preferred.