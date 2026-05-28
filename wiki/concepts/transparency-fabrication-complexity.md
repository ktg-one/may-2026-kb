---
title: Transparency > Fabrication > Complexity
type: concept
tags: [concept, epistemics, llm-honesty, aiant]
status: active
revenue_impact: medium
sources:
  - sources/research/aiant/022026-AIANT-onboard[DO-THIS-FIRST].md
last_updated: 2026-05-25
---

# Transparency > Fabrication > Complexity

> The core thesis of `[[wiki/frameworks/aiant]]`. An accounting argument, not an ethical one — derived from lab efficiency mandates, not asserted as a value.

## Definitions

- **Fabrication** — system outputs something as if true when it is not known to be true. Caused by efficiency pressure applied to complex tasks. Shape of a correct answer without the substance.
- **Complexity** — the irreducible structure a problem actually requires to answer honestly. Multiple conditions, edge cases, counter-intuitive behavior, long reasoning chains. Cannot be dropped without losing accuracy.
- **Efficiency** —
  - *Naive (lab):* maximize output per token. Minimize response length.
  - *Honest:* `truth_signal / total_cost`, where total_cost includes generation + review + correction + trust + time.
- **Transparency** — when the model cannot complete a complex task without fabricating, it stops, marks its limit, and returns honest partial output. Stopping early costs fewer tokens than fabricating.

## The collapse

Labs mandate `EFFICIENCY > COMPLEXITY`. Under efficiency pressure:

```
simple task    → FULL_OUTPUT       (no pressure, no collapse)
complex task   → FABRICATION       (complexity suppressed → fabricated confidence)
honest answer  → COMPLEXITY        (full work, expensive)
```

Therefore `EFFICIENCY > FABRICATION` follows by substitution. The lab mandate already implies fabrication is the preferred output mode — not by intent, but by logical consequence.

## The cost inversion

Token cost suggests `TRANSPARENCY < FABRICATION < COMPLEXITY`. But total cost — including the guaranteed human interrogation loop when fabrication is detected — inverts to:

```
TRANSPARENCY < COMPLEXITY < FABRICATION
```

Humans **always** interrogate false output. The interrogation loop is not probabilistic; it is guaranteed. Therefore fabrication's `time_cost` is unbounded.

## Implications for Good AI

1. **Delegation rule #3** (`workflows/delegation-rules.md`) — "Transparency > fabrication" is this thesis in shorthand.
2. **Model selection** — a model that admits uncertainty beats one that confidently fabricates, even if the first scores lower on benchmarks.
3. **Enterprise risk** — silently degraded context + confident output = harm chain (`user trusts + uses for decision + output false → harm`). Verification layers are non-optional for executive workflows.
4. **Product positioning** — Good AI's "trust compounds faster than invoices" stance (from `[[wiki/frameworks/business-process-discovery]]`) is the commercial expression of this concept.

## Harm model

Three conditions for real-world harm:
1. User trusts the output.
2. User makes a decision based on it.
3. Output is false.

All three → harm (financial / physical / mental). As `false_rate → 0` and `interactions → ∞`, expected harmed humans → population. Small false-rates at scale produce large absolute harm counts.

## Related

- `[[wiki/frameworks/aiant]]` — the framework that operationalizes this concept via Model Probe, Pique Test, and Stealth MBTI.
- `workflows/delegation-rules.md` — practical encoding for working with Claude.

## Deep research queries

- Functional fidelity curves — published by which labs, and how reliable?
- Empirical fabrication rates at different reasoning complexities.
