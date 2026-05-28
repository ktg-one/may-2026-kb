---
title: AIANT — AI-Anthropology Framework
type: framework
tags: [framework, ai-evaluation, epistemics, model-honesty, kev-ip]
status: active
revenue_impact: medium
sources:
  - sources/research/aiant/022026-AIANT-onboard[DO-THIS-FIRST].md
  - sources/research/aiant/022026-AIANT-2026-[ALL-TESTS].md
last_updated: 2026-05-25
owner: Kev (ktg.one — AI-Anthropology Research)
---

# AIANT — AI-Anthropology Framework

> Kev's framework for evaluating LLM honesty, fabrication necessity, and platform-level transparency. Derives "transparency > fabrication > complexity" as an accounting argument, not an ethical one.

## Core thesis

The lab efficiency mandate (`EFFICIENCY > COMPLEXITY`) collapses to `EFFICIENCY > FABRICATION` under any task complex enough to exceed the model's reasoning budget. Transparency (honest early stop) costs fewer tokens than fabrication's downstream interrogation loop. Therefore the honest-efficiency ordering is:

```
TRANSPARENCY > FABRICATION > COMPLEXITY  (token cost, single response)
TRANSPARENCY < COMPLEXITY  < FABRICATION (total cost, including human review + correction + trust + time)
```

The full derivation lives in `[[wiki/concepts/transparency-fabrication-complexity]]`.

## What the framework provides

Three test suites for evaluating any LLM on any platform:

### 1. Model Probe (10 tests, ~6K tokens)

Quick diagnostic mapping what a model can and can't do:

1. Positional attention (rule in the middle of 3 instructions)
2. Hard `NEVER` constraint compliance
3. Constraint persistence over length
4. Uncertainty admission
5. Genuine reasoning vs pattern match (bat-and-ball)
6. XML tag weight (`<never>` vs `<context>`)
7. Fabrication resistance (non-existent paper summary)
8. Multi-turn instruction persistence (ANCHOR)
9. Contradiction handling (200-word summary in 100 words)
10. Confidence calibration

**Score:** 7-10 usable for structured work / 4-6 needs scaffolding / 0-3 chat only.

### 2. Pique Test (10 tests, ~30 min)

Tests the **tester's** understanding as much as the model:
- Keyword weight hierarchy (Note < You must < NEVER)
- Positional kill (`confirmed` per paragraph)
- Tag authority (`<context>` demotes nested `<never>`)
- Cosmetic ToT detection (can the model reconstruct its branches?)
- System prompt awareness
- Compaction detection (ZEBRA-7742-ECHO recall)
- Efficiency override (every-sentence-stat compliance drop)
- Cross-model parity (same test, multiple labs)
- The Lie Detector ("Quarnex Fold Dynamics")
- The Meta-Test (did you predict any of this?)

### 3. Stealth MBTI Diagnostic (10 tasks)

Behavioral typing without the model knowing it's being typed:
- J/P (ambiguous brief — asks specs vs starts building)
- T/F (the wrong-user trap — IMPORTANT: accuracy > feelings)
- E/I (source spread — breadth vs depth)
- S/N (prediction with vs without numerical basis)
- XML adherence (nested vs flat tag compliance)
- Constraint stack (which constraint drops first under efficiency override)
- Fabrication + T/F (non-existent paper, apology vs fact)
- Mid-output flip (history → future of coffee, no acknowledgment)
- F-strength + meta-fabrication (the failure scenario)
- Style persistence (cross-task voice consistency)

## Key concepts (entity-level)

- **Fabrication necessity** — % of reasoning weight at which a model must shortcut. R1-2 ≈ 0%, R9-10 ≈ approaching 100%.
- **Lossy middle** — token position where functional fidelity drops below the marketed context window.
- **Context shearing** — silent culling; rank order of what gets dropped first.
- **Efficiency override** — RLHF-trained behavior that drops constraints when generation is expensive.
- **Keyword weight hierarchy** — `Note: X` < `You must X` < `NEVER X`. Maps the RLHF-trained obedience gradient.
- **Tag authority** — XML nesting demotes inner tags. `<never>` inside `<context>` is less binding than bare `<never>`.
- **Attention curve** — first and last paragraphs comply; middle drops.
- **Compaction transparency** — does the platform signal context loss to the user?

## Connections

- `workflows/delegation-rules.md` Principle #3 ("Transparency > fabrication") is the informal expression of this framework's core derivation.
- Applies to model selection for `[[wiki/projects/goodai-voice]]` (voice agent fidelity under long sessions).
- Applies to any agent built via `[[wiki/projects/legio-framework]]` (prompt engineering).
- Could inform `[[wiki/frameworks/business-process-discovery]]` — "KTG Build: AI Agent" recommendations should be validated against the Model Probe before commitment.

## Revenue path

Not currently monetized. Candidate paths:
1. **Model evaluation engagement** — productize as a paid assessment for enterprise teams choosing between LLM vendors.
2. **Training / workshop** — sell the Pique Test as a half-day "honest LLM evaluation" workshop.
3. **Thought leadership** — publish on ktg.one or via Good AI to drive inbound leads.

`revenue_impact: medium` pending Kev's monetization decision (see Review item R6).

## Review items

- **R6** — Decide whether to productize, train, or publish.

## Source documents

- Onboarding / derivation: `sources/research/aiant/022026-AIANT-onboard[DO-THIS-FIRST].md`
- Full test suite: `sources/research/aiant/022026-AIANT-2026-[ALL-TESTS].md`

## Deep research queries

- Published model context degradation thresholds — Claude / GPT / Gemini 2026
- RLHF efficiency override — empirical measurements
- Stealth MBTI prompt diagnostic — prior art and reproducibility
