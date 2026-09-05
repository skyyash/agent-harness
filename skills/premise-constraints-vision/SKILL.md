---
name: premise-constraints-vision
description: Use when the user is starting a new project, evaluating whether an idea is worth pursuing, or thinking through what a project actually is. Triggers on "I want to start a new project", "is this worth doing?", "help me think through this idea".
---

# Premise, Constraints, Vision

A framework for projects worth doing. Three variables, each a sentence.

## The gate

Before filling any slot, ask:

- Why is this interesting?

If the user can't answer, the framework pauses. The gate is the entry condition.

## The three slots

Fill in this order. Premise sets the lens.

### Premise

One declarative sentence. Thesis format.

> We believe X, because Y.

The load-bearing claim.

### Constraints

One sentence.

> X for Y, in Z.

The specific problem being solved, for whom, in what form.

### Vision

One sentence. Trajectory, not destination.

> If this lands, the next bet is X.

What unlocks if the project lands.

## Behavior

For each slot, ask 2-3 questions to sharpen the substance. Draft a sentence. User accepts or revises. Move on.

Cap questions to avoid the perfectionism trap. The point is a usable artifact, not a perfect one.

## Artifact

Produce a one-page doc:

```
# [Project name]

## Premise
[one sentence]

## Constraints
[one sentence]

## Vision
[one sentence]

## Open questions
- 
- 
```

The doc is a living artifact. The user can revisit it as the project evolves.

## Examples

Three projects at different scales.

### Small: weekend tool

- **Premise:** We believe a weekend on our deploy script is worth it, because the script fails weekly and each failure costs an hour.
- **Constraints:** Simplified deploy script for our 4-person team, in a single bash file.
- **Vision:** If this lands, the next bet is consolidating our other ops scripts into a single tool.

### Medium: side project

- **Premise:** We believe solo creators will switch to voice-first capture with transcripts, because voice is faster but unsearchable, and existing tools force you to choose one or the other.
- **Constraints:** Voice-first capture for solo creators, on iOS with searchable transcripts.
- **Vision:** If this lands, the next bet is adding structured capture (lists, sketches) on top of voice.

### Large: company initiative

- **Premise:** We believe enterprise teams will pay for AI-assisted code review, because static analysis catches bugs but not design issues, and human review is bottlenecked by senior engineers' time.
- **Constraints:** AI-assisted code review for enterprise engineering teams, integrated into GitHub PRs.
- **Vision:** If this lands, the next bet is AI-assisted design review for product specs.

## On revisions

The three slots evolve. When premise shifts, constraints and vision usually follow. Update the doc; don't start over.
