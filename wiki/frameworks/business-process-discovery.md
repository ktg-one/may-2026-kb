---
title: Business Process Discovery Framework
type: framework
tags: [framework, methodology, discovery, consulting, kev-ip]
status: active
revenue_impact: high
sources:
  - sources/methodology/GoodAI-Business-Process-Discovery-Framework.md
  - sources/methodology/Pre-Engagement AI Discovery SOP.docx
last_updated: 2026-05-25
owner: Kev
---

# Business Process Discovery Framework

> Kev's working method for walking into a client operation, mapping manual processes, scoring automation opportunities, and producing a Process Audit Report. The sellable consulting methodology behind every Good AI discovery engagement.

**Version:** 1.0 (May 2026) | **Author:** Kev Tan | **Status:** active, sellable

## What it is

A 5-day, four-phase engagement that produces a **Process Audit Report** — a build plan, not a strategy deck. Industry-agnostic, with extra depth for regulated manufacturing (medical devices, aerospace, precision engineering).

**Core rule:** recommend what's right, not what generates billing. If Power Automate handles it natively, say that. If they need a real ERP, say that. Trust compounds faster than invoices.

## Phases

| Phase | Days | Output |
|-------|------|--------|
| **A — Stakeholder interviews** | 1-2 | Executive / Manager / Operator question sets (10 each tier). Operator interviews are the highest-value — they reveal the *real* process, not the intended one. |
| **B — Process mapping** | 2-3 | One template per process: trigger, inputs, steps, decision points, outputs, systems, handoffs, pain points, time, error rate, volume, regulatory impact. Expect to surface 15-30, map 10-20 in detail. |
| **C — Opportunity scoring** | 4 | Weighted matrix → comparable score per process. |
| **D — Solution recommendation** | 5 | Decision tree → solution category per process. |

## Scoring matrix

| Criterion | Weight | Scale |
|-----------|--------|-------|
| Impact | 30% | 1-5 (hours/week saved or errors eliminated) |
| Feasibility | 25% | 1-5 (API access, data quality, integration effort) |
| Risk | 20% | 1-5 inverted (regulatory exposure, reversibility, change resistance) |
| Strategic Value | 15% | 1-5 (exec visibility, alignment with stated priorities) |
| Quick Win Potential | 10% | 1-5 (30 days → 6+ months timeline) |

**Threshold:** >3.5 = strong candidate. 2.5-3.5 = investigate. <2.5 = defer.

## Solution decision tree

```
Process well-defined? → No → Improve SOPs first
                      → Yes → System-to-system data movement?
                              → Yes → M365 native? → Yes → Power Automate
                                                    → No  → Cross-platform? → Yes → n8n (KTG)
                                                                            → No  → Power Automate Desktop / UiPath
                              → No  → AI/judgment required? → Yes → AI Agent (KTG) + human-in-loop
                                                            → No  → Reporting? → Yes → Power BI dashboard (KTG)
                                                                              → No  → Manual / training
```

## Solution categories

| Category | Who delivers | Example |
|----------|--------------|---------|
| KTG Build: n8n Workflow | KTG | OEM RFQ processing |
| KTG Build: AI Agent | KTG | NPI parameter lookup, spec interpretation |
| KTG Build: Dashboard | KTG | Cross-site production dashboard |
| Microsoft Native | Client IT (KTG advises) | Document approval routing |
| Third-Party Tool | Vendor (KTG recommends) | Full ERP, dedicated QMS (e.g., Greenlight Guru) |
| Process Improvement | Client ops (KTG advises) | Unclear SOPs |
| Keep Manual | N/A | One-off engineering judgment |

## Pre-engagement counterpart

Pre-sales qualification and scoping is documented in `Pre-Engagement AI Discovery SOP.docx` (`sources/methodology/`). Together they form the **pre-engagement → discovery → delivery** sales pipeline.

## Worked example

`[[wiki/clients/ap-tech]]` is the worked example throughout the framework — OEM RFQ processing, NPI deviation management, multi-site visibility.

## Revenue path

- **Direct billable:** Discovery engagements (5 days, fixed-fee).
- **Pull-through:** Every "KTG Build" recommendation seeds downstream n8n / AI agent / dashboard delivery work in `[[wiki/projects/n8n-workflows]]`.
- **Pipeline:** Lives in `[[wiki/PIPELINE]]` as the entry product for new accounts.
- **Productization candidate:** Framework + worked-example + scoring matrix could be packaged as a self-serve template or training course.

## Related

- `[[wiki/frameworks/aiant]]` — the model-evaluation framework behind any "KTG Build: AI Agent" recommendation
- `[[wiki/projects/n8n-workflows]]` — the delivery backbone for "KTG Build: n8n Workflow"
- `[[wiki/projects/legio-framework]]` — prompt engineering for "KTG Build: AI Agent"
- `[[wiki/projects/automation-station]]` — portable n8n form factor for client deployments
- `[[wiki/REVENUE-MAP]]` — discovery engagements as a primary revenue stream
- `[[wiki/clients/kismet-finance]]` — channel partner for SME discovery leads
- `[[wiki/clients/ap-tech]]` — primary worked example throughout

## Review items

- **R10:** `Pre-Engagement AI Discovery SOP.docx` is a binary — needs text extraction to fully wire the pre-engagement section.
- Consider pricing tiers (single-site vs multi-site vs regulated-industry) and publishing a public engagement page.
