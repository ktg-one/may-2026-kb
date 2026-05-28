---
title: Operations Handbook — Good AI Australia
type: handbook
tags: [operations, handbook, launch, sole-trader]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/good-ai]], [[wiki/entities/trillet-ai]], [[wiki/entities/kevin-tan]], [[wiki/concepts/voice-operating-layer]], [[purpose]]
last_updated: 2026-05-28
status: draft
---

# Operations Handbook — Good AI Australia

How Good AI Australia actually delivers, supports, scales, and survives as a sole-trader productised voice-agent service. Built for the **July 2026 SEA launch** [NEEDS KEV: confirm exact target launch date — first business week of July assumed throughout].

The handbook indexes the operations layer. Each linked document is a tight, scannable runbook or SOP — not academic prose. Operations docs are drafts (`status: draft`) until field-tested with the first 3 clients.

## Operating philosophy

Three principles, repeated:

1. **"Build once, deploy many."** Every client deployment fits the [[wiki/operations/service-delivery-runbook|3-stage delivery model]] (~1 hour founder time, 48-hour SLA). Anything that doesn't fit, gets quoted separately at premium — that's the scope-creep firewall [1, §12.1].
2. **Trillet absorbs the operational complexity.** The platform handles telephony, LLM, voice, transcription, certifications. Good AI's job is configuration, client relationship, and the integration layer (Calendar, CRM, lead-form, Stripe). Don't rebuild what Trillet already gives [2].
3. **Stay fluid.** Operating policies in this handbook are revisable. If the latest tool changes the picture, update the doc, don't defend the prior version. See `feedback-stay-fluid-policy` in memory.

## Read order (cold start for any new ops resource — VA, contractor, future Claude)

1. [[purpose]] — why Good AI exists
2. [[wiki/good-ai]] — what we sell and to whom
3. [[wiki/concepts/voice-operating-layer]] — the substantive capability we deliver
4. This file
5. [[wiki/operations/launch-checklist-july-2026]] — what we're doing this week
6. [[wiki/operations/weekly-cadence]] — what we do every week
7. [[wiki/operations/service-delivery-runbook]] — how a client goes live
8. [[wiki/operations/client-onboarding-sop]] — the full client journey
9. [[wiki/operations/support-incident-runbook]] — when things break
10. [[wiki/operations/capacity-plan]] — when we hire
11. [[wiki/operations/risk-register]] — what could go wrong

## Documents in this cluster

### Pre-launch & launch (active now)

| Doc | Type | What it covers |
|---|---|---|
| [[wiki/operations/launch-checklist-july-2026]] | checklist | Week-by-week launch sequence from T-5 to T+4 weeks |

### Recurring operations (live from Day 1)

| Doc | Type | What it covers |
|---|---|---|
| [[wiki/operations/service-delivery-runbook]] | runbook | The 3-stage method: onboarding → configuration → activation |
| [[wiki/operations/client-onboarding-sop]] | sop | End-to-end client journey from sale to 30-day check-in |
| [[wiki/operations/weekly-cadence]] | sop | Daily / weekly / monthly recurring tasks |
| [[wiki/operations/support-incident-runbook]] | runbook | Response sequence when an agent fails or a client reports an issue |

### Strategic operations (reviewed monthly)

| Doc | Type | What it covers |
|---|---|---|
| [[wiki/operations/capacity-plan]] | plan | Sole-founder throughput math; hire triggers |
| [[wiki/operations/risk-register]] | register | Tracked operational risks with owner, impact, mitigation, status |

### Queued for next compile pass (Tier 3)

- `wiki/operations/vendor-management-sop.md` — Trillet relationship management, plan-upgrade triggers, migration contingency activation
- `wiki/operations/compliance-operations-sop.md` — privacy handling, ISO/IEC 42001 management cycle, audit trail
- `wiki/operations/kpi-dashboard-spec.md` — what gets measured monthly, where it lives, who reviews

## Key operating parameters (current)

| Parameter | Value | Source |
|---|---|---|
| Voice platform | Trillet AI Pty Ltd, Studio plan ($99/mo flat) | [2] |
| Phone numbers included | 3 in Studio; 10 in Agency; +$5/mo each | [2] |
| Per-minute overage | $0.12/min (Studio / Agency) | [2] |
| Founder time per deployment | ~60 minutes | [1, §8.1] |
| Client-facing deployment SLA | 48 hours from client info supplied | [1, §3] |
| Y1 target — active subscribers | 60 by Month 12 | [1, §4] |
| Y1 target — MRR | $15–20K by Month 12 | [1, §4] |
| Y1 target — break-even | Month 4–5 | [1, §11.4] |
| Founder weekly hours | 35+ during SEA program | [1, §8.3] |
| First VA hire | Month 6 trigger | [1, §4] |
| Insurance | BizCover combined SMB ~$55–60/mo (bound) | [1, §12.2] |

## Hard rules (apply to every operation)

- **Drafts only.** Operations docs are `status: draft` until field-tested. Update on every real client engagement.
- **Sourced facts only.** Every $, %, date, named claim cites the source page by [N]. If a fact isn't sourced, flag `[NEEDS KEV: <what's needed>]` inline.
- **Update CLAUDE.md when a new doc type emerges.** The "Page types in use" table is the schema. Don't add a new type silently.
- **Compatible with the auto-memory layer.** Personal context (ADHD parallel-projects, stay-fluid policy, no-menus-when-authorised) sits in `memory/MEMORY.md` and is read at session start.

---

## Sources

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]] — SEA business plan
- [2] [[wiki/entities/trillet-ai]] — voice platform partner
- [3] [[wiki/concepts/voice-operating-layer]] — capability model
- [4] [[wiki/entities/kevin-tan]] — founder profile
- [5] [[wiki/good-ai]] — company root
- [6] [[purpose]] — vault soul
