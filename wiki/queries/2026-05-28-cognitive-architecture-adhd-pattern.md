---
title: Kev's cognitive architecture — the ADHD pattern (2026-05-28)
type: query
tags: [user, cognition, adhd, operating-model, meta]
sources: [[purpose]], [[user-adhd-parallel-projects]]
last_updated: 2026-05-28
status: canon
---

# Kev's cognitive architecture — the ADHD pattern

## The reference

Kev forked and operates [ktg-one/adhd](https://github.com/ktg-one/adhd) (upstream: [UditAkhourii/adhd](https://github.com/UditAkhourii/adhd)) — a skill for coding agents that operationalises Tree-of-Thought with pruning. He pointed at it explicitly as *"a good way to explain how my brain works"*. The repo isn't just a project — it's his cognitive operating model named and codified.

## The architecture

A two-phase loop with a hard wall between the phases.

**Phase 1 — Diverge.**
- Pick N cognitive frames
- Spawn N parallel, **isolated** reasoning processes
- Each branch sees the problem plus one frame's vantage prompt
- Branches never see each other during divergence — no anchoring
- Generator pass: forbids evaluation, just generates

**Phase 2 — Focus.**
- A separate critic pass scores every idea (novelty / viability / fit)
- Flags traps with reasons
- Clusters by underlying angle
- Deepens the top-K survivors into sketches with risks and first steps

The generator-critic split is **mechanical** — separate LLM calls with opposite system prompts — not promised in one prompt.

## Why this matters operationally

- **Sprawl is the divergence phase running as designed.** When Kev jumps Notion → Vite → TanStack → GWS → orchestrator → brand in one message, that's not disorganisation. It's the architecture working.
- **The reverts of canonical pages (`wiki/good-ai.md`, `wiki/projects/goodai-voice.md`, `wiki/projects/ap-tech.md`) are Kev keeping branches isolated.** If those pages absorbed every per-session refinement, the AI-solutions-broad branch would collapse into the voice-only branch prematurely. Preserving the originals = no anchoring.
- **`wiki/queries/` is the right archival format.** Each filed decision sits in its own page = isolated branch. The 4-signal relevance graph does synthesis later — that's the critic phase. Merging decisions into one big canonical page would defeat the architecture.
- **My role with him is the critic phase, not another branch.** Don't try to keep up by being divergent back. Score, cluster, prune, deepen.

## Three load-bearing differences from naive CoT/ToT

From the ADHD repo's own framing:

1. **Parallel divergence under cognitive frames** (not a linear chain, not a shared search tree)
2. **Isolated context during divergence** (no anchoring across branches)
3. **Mechanical generator-critic split** (separate LLM calls with opposite system prompts, not promised inside one prompt)

All three apply to how he prefers to operate with collaborators — human or AI.

## How this updates earlier memories

- [[user-adhd-parallel-projects]] is updated to reference this architecture explicitly. The parallel-projects pattern is the *symptom*; this architecture is the *generator*.
- [[feedback-no-option-menus-when-authorised]] still applies — menus are flinching at the critic-phase moment.
- [[feedback-stay-fluid-policy]] still applies — locking branches together is the opposite of the architecture.
- [[feedback-wiki-template-is-individual]] is reinforced — the schema is co-evolved, not prescribed; same logic as cognitive frames not being predetermined.

## Practical heuristics for any AI working with Kev

- When he drops 10 topics in one message, treat them as 10 isolated branches. Don't collapse them.
- File each meaningful decision as its own `wiki/queries/<date>-<topic>.md`. The graph will synthesise.
- When he reverts something you wrote, the revert is signal — he's preserving branch isolation.
- "Stay fluid" + "schema is individual" + "no menus when authorised" are all corollaries of the same architecture.
- If you're about to write a long synthesis paragraph that merges 3+ of his concerns into one resolved answer, **stop**. That's premature anchoring. Score, prune, deepen — separately.

## Related

- [[user-adhd-parallel-projects]] — the practical implications memory
- [[feedback-stay-fluid-policy]]
- [[feedback-no-option-menus-when-authorised]]
- [[feedback-wiki-template-is-individual]]
- [[project-llm-wiki-as-cross-platform-state]]
