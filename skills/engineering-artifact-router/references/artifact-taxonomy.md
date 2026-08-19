# Engineering Artifact Taxonomy

Use this reference when the main router needs a more precise distinction between neighboring artifact types.

## Status labels

- **Standards-backed** — the concept is defined or strongly grounded in recognized engineering standards or formal lifecycle practice.
- **Industry-established** — widely used across software/product/operations organizations, but naming and exact contents vary.
- **Tool/ecosystem convention** — established in a particular engineering ecosystem rather than a general standard.
- **Project-local** — valid if a project defines it, but do not present it as a universal engineering document type.

There is no single universal official catalog that forces every software organization to use exactly the same document names. Prefer semantic precision over claims that a label is universally canonical.

## Framing and product intent

### Brief / Project Brief
**Status:** Industry-established.

Compact framing of context, objective, scope, constraints, stakeholders, and expected outcome. A brief transfers enough intent to begin work; it is not necessarily a complete requirements contract.

Use when the next actor needs orientation more than formal completeness.

### Product Brief
**Status:** Industry-established.

Early product framing focused on user/problem/value and intended outcome. Usually lighter than a PRD.

### Design Brief
**Status:** Industry-established.

Problem framing and constraints specifically for a design activity.

### Problem Statement
**Status:** Industry-established.

Defines the problem to solve without requiring a particular solution.

### Vision / Vision Document
**Status:** Industry-established.

Describes a desired future state and strategic direction. It is not an implementation contract.

### Concept / Concept Note
**Status:** Industry-established.

Preliminary formulation of an idea or solution concept before detailed requirements/design.

### PRD — Product Requirements Document
**Status:** Industry-established.

Describes product requirements, user needs, product behavior, scope, and often success metrics. Common in product development; not a single globally standardized format.

## Requirements and specifications

### Requirement
**Status:** Standards-backed.

A condition, capability, property, constraint, or behavior that a system or work product is required to satisfy.

### Requirements Specification
**Status:** Standards-backed family.

Structured set of requirements for a system, software product, interface, or other engineered item.

### SRS — Software Requirements Specification
**Status:** Standards-backed.

A requirements specification for software. Use when the primary semantic job is to define what the software must satisfy, not how it will be internally implemented.

Relevant standards family: ISO/IEC/IEEE 29148 requirements engineering.

### Specification / Spec
**Status:** Fundamental engineering term.

A precise normative description of required properties, behavior, interfaces, constraints, or conformance conditions. Always prefer a qualified name when ambiguity matters: Technical Specification, Interface Specification, API Specification, Protocol Specification, Data Specification, and so on.

### Technical Specification
**Status:** Industry-established / engineering-generic.

Precise technical contract covering behavior, constraints, interfaces, invariants, compatibility, error semantics, performance, and acceptance conditions as needed.

### Functional Specification
**Status:** Industry-established.

Defines externally observable functional behavior without necessarily prescribing internal architecture.

### Interface Specification / API Specification / Protocol Specification
**Status:** Standards-backed or industry-established depending on domain.

Defines the contract across a boundary: messages, fields, types, endpoints, sequencing, errors, compatibility, or protocol behavior.

## Architecture and design

### Architecture Description
**Status:** Standards-backed.

Description of a system architecture through relevant structures, viewpoints, relationships, concerns, and architecture models.

Relevant standards family: ISO/IEC/IEEE 42010.

### Architecture Document
**Status:** Industry-established.

Common informal label for architecture documentation. Prefer `Architecture Description` when standards precision matters.

### Software Design Description (SDD) / Technical Design Document
**Status:** SDD is standards/lifecycle-established; Technical Design Document is industry-established.

Moves below architecture into implementation-relevant design: components, responsibilities, algorithms, data flows, interfaces, failure handling, tradeoffs, and design decisions.

### Low-Level Design (LLD)
**Status:** Industry-established.

Detailed implementation-oriented design, often below high-level architecture/design.

## Proposals and decisions

### Proposal / Technical Proposal
**Status:** Industry-established.

A candidate solution submitted for consideration. A proposal is not yet a ratified decision.

### RFC — Request for Comments
**Status:** Formal in the IETF RFC Series; industry-adapted in software organizations.

Within engineering teams, commonly used for a consequential technical proposal circulated for review before acceptance. Do not treat an internal RFC as automatically approved.

### ADR — Architecture Decision Record
**Status:** Industry-established architecture practice.

Records a significant architecture decision that has been accepted, including context, rationale, alternatives, and consequences.

### Decision Record
**Status:** Industry-established generic pattern.

Records an accepted decision that is not necessarily architectural.

### Decision Memo
**Status:** Industry-established.

Frames a decision for an operator or decision-maker: question, options, evidence, tradeoffs, recommendation, and requested decision. Usually precedes ratification.

## Planning and change

### Implementation Plan
**Status:** Industry-established.

Defines the intended sequence for implementing an accepted change or design, including dependencies, migrations, tests, rollout, and rollback when relevant.

### Execution Plan
**Status:** Industry-established generic term; also used by agentic coding ecosystems.

Broader than implementation. Defines how a bounded multi-step task such as research, audit, migration, or engineering execution will proceed.

### Work Plan
**Status:** Project-management established.

General plan of work; often less technically specific than an Implementation Plan.

### Migration Plan
**Status:** Industry-established.

Defines transition from current state to target state while preserving required continuity and compatibility.

### Deployment Plan
**Status:** Industry-established.

Defines how a built change moves into a target environment.

### Rollout Plan
**Status:** Industry-established.

Defines progressive release/exposure, monitoring, thresholds, and progression criteria.

### Rollback Plan
**Status:** Industry-established.

Defines how to return safely to a prior known-good state.

### Change Request
**Status:** Configuration/change-management established.

Formal request to alter a controlled baseline, requirement, configuration, or system. A request does not itself prove approval.

## Authority and governance

### Project Charter
**Status:** Project-management established.

Formally establishes a project and its high-level authority, objectives, and boundaries. It is not a detailed technical specification.

### Authorization
**Status:** Governance-generic.

Explicit permission to perform a bounded action. Qualify by action when possible:

- Execution Authorization
- Change Authorization
- Deployment Authorization
- Publication Authorization
- Data Access Authorization

Authorization answers **may this actor perform this action?**, not **what should the system satisfy?**

### Mandate
**Status:** Governance-generic; not a universal canonical software-engineering artifact type.

Can validly describe a commission or grant of responsibility/authority in an organization, but should not be used as a catch-all replacement for specification, plan, authorization, audit plan, or handoff.

If a project defines a local `Mandate` artifact, follow that project's definition while keeping semantic roles explicit.

## Verification, validation, and acceptance

### Test Plan
**Status:** Lifecycle/engineering established.

Defines test scope, methods, environment, responsibilities, cases/classes, and pass/fail criteria as needed.

### Test Procedure
**Status:** Lifecycle/engineering established.

Exact procedure for executing a test or test class, including prerequisites, inputs, steps, and expected outputs.

### Test Case
**Status:** Fundamental software testing term.

A bounded test scenario with conditions/inputs and expected result.

### Acceptance Criteria
**Status:** Industry-established.

Conditions a specific work item/result must satisfy to be accepted.

### Definition of Done
**Status:** Agile/Scrum ecosystem convention.

Shared quality/completion boundary applied to work generally in a team/process. Do not confuse it with feature-specific acceptance criteria.

### Verification Plan
**Status:** Systems/software engineering established.

Defines how conformance to specified requirements will be demonstrated.

### Validation Plan
**Status:** Systems/software engineering established.

Defines how fitness for intended use or stakeholder need will be demonstrated.

Useful distinction:

- **Verification:** did the implementation satisfy the specification?
- **Validation:** does the resulting system solve the intended real-world need?

## Audit, assessment, and research

### Audit Brief
**Status:** Industry/generic.

Compact framing of a bounded audit: target, question, evidence boundary, prohibitions, and expected verdict/output.

### Audit Plan
**Status:** Audit/assurance established.

Defines how an audit will be performed: scope, criteria, evidence, method, boundaries, and reporting expectations.

### Audit Report
**Status:** Audit/assurance established.

Records evidence, findings, limitations, conclusions, severity/materiality where relevant, and recommendations.

### Assessment
**Status:** Industry-established generic.

Evaluation of state, quality, maturity, risk, or readiness. Often less specifically compliance-oriented than an audit.

### Readiness Assessment
**Status:** Industry-established.

Determines whether a system, artifact, release, or process is ready to enter a next stage.

### Research Brief
**Status:** Research/industry generic.

Frames the research question, objective, scope, known constraints, and expected output without fully precommitting method.

### Research Protocol
**Status:** Research-established.

Defines the method and decision rules sufficiently to govern execution, often including population/data, procedure, outcomes, analysis, stopping rules, and deviations.

### Research Report
**Status:** Research-established.

Reports methods, evidence, results, limitations, and conclusions after research execution.

## Operational documentation

### Runbook
**Status:** SRE/operations established.

Concrete repeatable operational procedure, usually step-oriented.

### Playbook
**Status:** Operations/security/SRE established.

Response strategies and branching guidance for a class of situations rather than one exact procedure.

### SOP — Standard Operating Procedure
**Status:** Broad operational/compliance established.

Formalized repeatable procedure intended to standardize execution.

### Checklist
**Status:** Generic operational artifact.

A memory/verification aid for already-understood actions or conditions. A checklist should not substitute for missing requirements, design, or procedure.

## Reporting and continuity

### Technical Report
**Status:** Engineering-established generic.

Records technical work, method, findings, results, analysis, and conclusions.

### Status Report
**Status:** Project-management established.

Reports current progress, blockers, risks, and next steps. It does not itself transfer full execution state.

### Handoff
**Status:** Industry-established continuity artifact.

Transfers authoritative state to a successor: objective, completed work, decisions, baselines, blockers, unresolved work, evidence locations, and continuation point.

A handoff does not create new authority unless explicit authorization is separately present.

### Postmortem
**Status:** SRE/operations established.

Retrospective record of an incident or failure, including impact, timeline, causes/contributing factors, response, and follow-up improvements.

### RCA — Root Cause Analysis
**Status:** Quality/engineering established.

Focused causal analysis intended to identify root/contributing causes. It may be part of a postmortem or standalone.

### Lessons Learned
**Status:** Project/operations established.

Captures transferable learning from completed work or events.

### Changelog
**Status:** Software-release established.

Chronological record of notable changes across versions.

### Release Notes
**Status:** Software-release established.

Audience-facing description of a particular release and its meaningful changes.

## Work-management artifacts

### Issue / Ticket
**Status:** Industry/tool-established.

Tracked unit for bug, feature, task, request, or discussion. It is a work container and does not automatically equal a complete specification.

### Task / Subtask
**Status:** Generic project/work-management terms.

Executable work unit and its decomposition.

### User Story
**Status:** Agile ecosystem convention.

Requirement framing from the user's perspective. Useful for product intent, but insufficient by itself for many technical contracts.

### Feature
**Status:** Product/software generic.

Meaningful product capability or behavior grouping.

### Epic
**Status:** Agile/project-tool convention.

Large body of related work decomposed into smaller units.

## Agentic engineering artifacts

### Prompt
**Status:** AI interaction term.

Instruction payload delivered to a model/agent. `Prompt` describes the delivery mechanism, not the engineering semantics of the payload.

A prompt can carry a Technical Specification, Audit Plan, Handoff, RFC, or a bundle.

### System Prompt
**Status:** AI runtime term.

High-priority runtime instruction layer for a model/agent. Not a substitute for project requirements documentation.

### AGENTS.md
**Status:** Tool/ecosystem convention.

Repository/workspace instructions for compatible coding agents. Use for persistent project conventions and operating context, not every one-off task.

### CLAUDE.md
**Status:** Anthropic Claude Code ecosystem convention.

Persistent project instructions/context for Claude Code. Do not make independent semantic copies of universal skills merely to target Claude.

### Agent Skill / SKILL.md
**Status:** Open Agent Skills format / tool ecosystem.

Reusable, discoverable procedural knowledge packaged as a directory with `SKILL.md` and optional references/scripts/assets. Best for repeated routing, methodology, or specialized workflows.

### Specialization
**Status:** Not a general canonical software-engineering document type.

`Specialization` can describe a role, domain, type refinement, or project-local concept, but should not be used as a generic synonym for `Specification`.

If the intended word is `Specification`, use `Specification`.

## Normative anchors

Use these as orientation, not as a claim that every organization must use identical document names:

- ISO/IEC/IEEE 29148 — requirements engineering and requirements information.
- ISO/IEC/IEEE 42010 — architecture descriptions.
- ISO/IEC/IEEE 15289 — lifecycle information items/documentation.
- IETF RFC Series — formal RFC publication tradition; internal software-team RFCs are an adapted convention.
- Architecture Decision Records — industry architecture decision-recording practice.
- Agent Skills specification — open `SKILL.md` packaging format for reusable agent capabilities.
