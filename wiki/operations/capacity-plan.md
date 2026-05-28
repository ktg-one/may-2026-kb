---
title: Capacity Plan
type: plan
tags: [operations, capacity, planning, scaling]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/operations/service-delivery-runbook]], [[wiki/operations/client-onboarding-sop]]
last_updated: 2026-05-28
status: draft
---

# Capacity Plan

How many concurrent clients can a sole-founder business deliver to before it breaks. When to hire. When to upgrade the platform plan. Reviewed monthly.

## The math (current)

### Founder weekly hour budget

35+ hours/week to the business during the SEA program [1, §8.3].

### Founder weekly allocation (from [[wiki/operations/weekly-cadence]] / SEA plan §8.4)

| Block | Hours/week | Purpose |
|---|---|---|
| Client deployments + support | ~10–12 | Stages 4–6 of onboarding + S1/S2 incidents |
| Sales & marketing | ~10–12 | Networking, outreach, follow-ups, demo calls |
| Product development | ~4–6 | New templates, integrations, optimisations |
| Client meetings + 30-day check-ins | ~4 | Retention work |
| Business development & strategy | ~2 | Friday AM strategic block |
| Bookkeeping & admin | ~2 | Friday PM block |
| Professional development (evenings) | ~4 | Mon + Wed evening |

### Per-client effort

| Phase | Founder time | Frequency |
|---|---|---|
| Initial deployment (Stages 4–6) | ~60 min | Once per client |
| 30-day check-in | ~20 min | Once per client at Day 30 |
| Quarterly summary | ~5 min | Every 90 days |
| Average support / change requests | ~15 min/month | Ongoing |

**Steady-state per client per month: ~20 min** (after the initial deployment + Day-30 check-in are amortised).

## Throughput ceilings (theoretical)

| Stage | New deployments / week | Total active clients supportable |
|---|---|---|
| **Solo, no VA** (Months 1–5) | ~6 new/week | ~30 active before support overhead breaks the week |
| **Solo + VA at 20 hrs/wk** (Month 6+) | ~10 new/week | ~60 active (the Y1 target) [1, §4] |
| **Solo + VA + technical contractor** (Year 2) | ~15 new/week | ~100+ active [1, §10] |

**[NEEDS KEV: these ceilings are derived from the per-client effort estimates above. Calibrate against the first 5 real client deployments before treating as planning ground truth.]**

## Hire triggers

Hire the **VA (Month 6 per SEA plan §4)** when **any two** of these are true:

- Active client count ≥ 15
- Support backlog (S3 + S4 tickets not actioned within SLA) ≥ 10
- Founder weekly hours sustained > 45 for three weeks running
- Sales pipeline is producing > 6 qualified leads/week and the founder is dropping the demo call slot

VA scope at hire: onboarding admin, support triage (route S3/S4 to founder-batch), retainer relationship management, documentation maintenance, scheduled comms (30-day check-ins, quarterly summaries).

**Estimated VA cost:** $4–6K/month at 20 hrs/week ([NEEDS KEV: confirm Perth VA rate or offshore VA preference]).

Hire the **technical contractor (Year 2 per SEA plan §10)** when:

- Active client count ≥ 35
- Custom development projects > 2/month (revenue >$3K/mo just in custom work)
- Founder is consistently the bottleneck on integration work

Hire the **first full-time employee (Year 3 per SEA plan §10)** when:

- $300K annual revenue trajectory established [1, §10]
- Founder can fund a salary without dipping into runway
- Operations are documented well enough to onboard someone in <4 weeks

## Trillet plan upgrade triggers

### Studio → Agency ($99 → $299/mo)

Upgrade when **any** of:

- Active clients > 3 (Studio limits sub-accounts to 3) [2]
- Need a custom domain for white-label resale [2]
- Monthly call minutes > 100 (Studio includes 100) — overage at $0.12/min could be cheaper than upgrade for some months, recalc per month [2]
- First white-label reseller signs (Agency tier supports custom minute markup which Studio doesn't) [2]

### Agency → Enterprise

Upgrade when:

- Active clients > 50 (Agency unlimited but operationally heavy past 50 without a dedicated tenant manager)
- Any client requires on-premise / private-cloud deployment for compliance [2]
- Custom integrations beyond the native list

**[NEEDS KEV: Trillet Enterprise pricing isn't published — engage Trillet sales when the trigger fires.]**

## Risk: capacity overshoot

Most-likely failure mode for a sole-founder service: **sales activates faster than ops can absorb**. The Kismet channel could surface clients quickly per the funding pitch — if it activates before the VA is hired, quality of delivery drops, support backs up, and the brand takes the hit.

Mitigation (operational):

- **Stagger demand intentionally.** Don't activate all channel partners simultaneously [SEA plan §12 — "Sequenced hiring. Don't activate all channel partners simultaneously."]
- **Hold a waitlist.** If new-deployment requests exceed 6/week, take payment but schedule the activation 1–2 weeks out. Honest expectation-setting beats blown SLA.
- **Hire the VA earlier than planned** if the trigger conditions hit before Month 6.

## Monthly review cadence

First Monday of each month, the capacity plan gets a 30-minute review:

- Active client count vs. last month
- Sustained founder weekly hours
- Support backlog size
- Sales velocity (qualified leads/week)
- Trillet plan utilisation (numbers used, minute consumption)
- Decision: hire / upgrade / hold

Outcome logged to `wiki/log.md` as a `## [YYYY-MM-DD] capacity | ...` entry.

## Sources

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]]
- [2] [[wiki/entities/trillet-ai]]

## [NEEDS KEV]

- Calibrated per-client effort against first 5 real client deployments
- Perth VA monthly cost (vs offshore alternative)
- Trillet Enterprise tier pricing (engage Trillet sales when threshold approached)
