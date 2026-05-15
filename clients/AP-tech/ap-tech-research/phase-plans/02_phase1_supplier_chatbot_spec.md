---
title: "Phase 1 — Supplier Response Chatbot · Spec v0.1"
prepared_for: AP Technologies (Charles Tang, Russell Nagy, Sean Tang)
prepared_by: Kev Tan, KTG
prepared: 2026-05-08
status: PRE-SPEC DRAFT — not yet validated with AP Tech
companion: 01_brainstorm.md, 04_process_flows.md
---

# Phase 1 · Supplier Response Chatbot — Spec v0.1

## 1. Problem

AP Tech's procurement and supply-chain function fields high volumes of **repetitive, low-judgement inbound** from a global supplier base — order status pings, COA forwarding requests, lead-time chasing, document re-sends, change-notification acknowledgments. With ~100 concurrent NPI projects across four sites and an order-of-magnitude expansion in supplier touchpoints from Vietnam ramp + post-CMEF pipeline, this volume is now the rate-limit on buyers' time for activities that actually move margin (negotiation, qualification, NCR resolution).

Manual response times stretch from minutes to days. Suppliers escalate. Buyers context-switch. ISO 13485 §7.4 (purchasing controls) requires every supplier interaction to be evidenced — a burden today, an asset if automated.

## 2. Goals

| # | Goal | Measure |
|---|---|---|
| G1 | Auto-handle **tier-1** supplier emails (status, doc retrieval, FAQ) | ≥ 60% of inbound auto-handled without buyer touch by Day 90 |
| G2 | **Cut median tier-1 response time** | Hours/days → < 5 minutes |
| G3 | **Reclaim buyer time** | ≥ 30 hours/week across procurement team by Day 90 |
| G4 | **Strengthen ISO 13485 §7.4 evidence** | Every bot interaction logged with structured supplier-evaluation metadata |
| G5 | **Zero brand-damage incidents** | No supplier complaint tied to bot misbehaviour |

## 3. Non-Goals (explicit)

- **Will not** negotiate price, commit to volumes, or modify POs.
- **Will not** handle non-conformance reports (NCR), supplier corrective actions (SCAR), or any conversation that touches product quality.
- **Will not** generate net-new content suppliers haven't seen — every fact grounded in ERP / QMS / portal lookup.
- **Will not** operate in languages outside English in v1 (Mandarin, Vietnamese phased in v1.1 if needed).
- **Will not** replace any role — this is buyer-augment, framed accordingly to the team.

## 4. Personas

| Persona | Need from bot |
|---|---|
| **Supplier rep** (e.g. resin manufacturer in Bavaria, tubing extruder in Suzhou) | Fast, accurate, polite answers to status / doc / logistics questions; clean handoff to human when needed |
| **AP Buyer / Procurement Officer** | Triage inbox automatically; only see what needs judgement; full transcript & evidence per supplier |
| **Sean Tang (QMS owner)** | Audit trail meeting ISO 13485 §7.4 + §4.2.4 records control |
| **Charles / Russell** | Buyer hours reclaimed translate to NPI velocity; visibility dashboard |

## 5. In-Scope Functions (v1)

| Function | Description | Source of truth |
|---|---|---|
| **Order status lookup** | "Where's PO 12345?" → status + ETA + carrier reference | ERP |
| **COA / Cert retrieval** | "Send latest COA for material lot ABC" | QMS / DMS |
| **Drawing / spec re-send** | "Resend rev 4 of drawing X" — only if requesting party is on the authorized recipient list | DMS + ERP supplier master |
| **Lead-time confirmation** | "Confirm lead time on next order of part Y" | ERP master data + supplier file |
| **Receipt acknowledgment** | "Did you receive shipment 778?" | ERP goods-receipt |
| **Change-notification logging** | Supplier emails a PCN — bot acknowledges, files in QMS, alerts buyer | Email parser → QMS |
| **FAQ** | Generic supplier questions (banking details, address, supplier portal access) | Static knowledge base |

## 6. Out of Scope (v1)

- Price quotes, contract terms, MOQ negotiation
- NCR / SCAR / 8D
- New supplier onboarding (qualification flow)
- Anything in Mandarin or Vietnamese
- Any supplier flagged as exclusive / NDA-restricted (allowlist controls)

## 7. Architecture — Recommended (Hybrid)

```
Supplier email
    ↓
M365 mail flow rule — tag, copy to bot mailbox
    ↓
Intent classifier (Claude Haiku / fine-tuned local) → low-risk vs escalate
    ↓
If low-risk:
  Retrieval layer: ERP (status, lead time) + QMS/DMS (docs) + portal (auth)
    ↓
  Response composer (closed-LLM, grounded only on retrieved facts)
    ↓
  Compliance gate: PII scrub, allowlist check, supplier NDA check
    ↓
  Send via M365 Graph (signed "AP Procurement Desk")
    ↓
  Audit log to QMS (interaction, retrieval sources, model version)
If escalate:
  Triaged into buyer's inbox with summary + suggested draft
```

**Component choices:**

| Layer | Choice | Why |
|---|---|---|
| Transport | M365 (Outlook + Graph API) | Already in stack; no auth re-platform |
| Routing / orchestration | n8n or Power Automate | Kev has deep n8n; Power Automate if AP prefers M365-native |
| Intent classifier | Claude Haiku 4.5 (or self-hosted Qwen-2.5-7B for IP) | Cheap, fast, good enough for tier-1 routing |
| Retrieval | Direct API to ERP / QMS — **no vector DB in v1** | Most queries are structured lookups; semantic search only on FAQ |
| Response composition | Claude Sonnet 4.6 with grounded RAG | Best instruction-following for compliance-tight prose |
| Audit / logging | Azure Log Analytics + write-back to QMS evidence table | QMSR §820.180-aligned |

## 8. Integrations Needed

- **ERP** — read-only API for PO status, lead times, supplier master
- **QMS / DMS** — read for COA / drawings; write for interaction records
- **M365 Graph** — read inbox tag, send-as bot mailbox
- **Supplier portal** (if exists) — auth check
- **HR/Identity directory** — to flag if a buyer is the right route for escalation

## 9. Voice & Tone Rules (CDMO-grade)

- **Formal but not stiff.** "Confirmed — PO 12345 ships 14 May from Singapore via DHL. Tracking: [link]. — AP Procurement Desk."
- **Never apologise on AP's behalf.** Defer to a buyer for anything that warrants it.
- **Signature**: "AP Procurement Desk · automated response" — supplier knows it's a bot, can request a human reply.
- **Mandarin / Vietnamese**: routed to human in v1.
- **One thread, one persona** — the bot doesn't switch identity mid-thread.

## 10. Milestones & Timeline (90 days)

| Day | Milestone |
|---|---|
| 0-7 | Discovery — buyer ride-along (3 days), inbox audit (1 month of supplier emails), ERP/QMS API access provisioned |
| 8-21 | Build v0 — single use case (order status), single buyer's inbox, shadow mode (drafts only — buyer reviews + sends) |
| 22-35 | Expand — add COA retrieval, FAQ; widen to 3 buyers, still shadow mode |
| 36-50 | Switch to **assist mode** — bot sends auto-replies for high-confidence intents only; buyer reviews edge cases async |
| 51-70 | Expand to all of Singapore procurement; add change-notification handling; instrument metrics |
| 71-90 | Hardening — failure modes, escalation paths, audit pack v1; prep Xiamen rollout (Phase 2 of this engagement) |

## 11. Success Metrics

| Metric | Baseline (estimate, validate Day 0-7) | Target Day 90 |
|---|---|---|
| % tier-1 emails auto-handled | 0% | ≥ 60% |
| Median tier-1 response time | 4-12 hours | < 5 minutes |
| Buyer hours / week on tier-1 | ~40 hrs (team) | < 10 hrs |
| ISO 13485 §7.4 evidence completeness | Manual / variable | 100% structured |
| Supplier complaints attributable to bot | n/a | 0 |
| Hallucination rate on response facts | n/a | < 0.5% (audited weekly) |

## 12. Risks & Mitigations

| Risk | Severity | Mitigation |
|---|---|---|
| Bot quotes wrong status / lead time | High | Grounded retrieval only; "I don't know — routed to a buyer" is an acceptable answer |
| Supplier feels brushed off by bot | Medium | Always include "reply to this email to reach a person" in signature; escalate on second message in same thread |
| ERP API rate limits / outages | Medium | Cache + graceful degradation; bot says "checking — back to you within the hour" rather than hallucinating |
| Buyer over-trusts auto-reply, misses edge case | Medium | Weekly QA review for first 60 days; sampled audit thereafter |
| ISO 13485 finding on records control | High | QMS write-back from Day 1; Sean reviews evidence schema before go-live |
| NDA breach via doc re-send | High | Allowlist of recipients per drawing; bot refuses if mismatch + escalates to buyer + Sean |

## 13. Pricing Alignment

This spec sits inside Phase 1 of the engagement model from the meeting brief (S$40-60K fixed, 30 days). **However**, scope above is wider than 30 days for one person — recommend either:
- **Compressed Phase 1** = MVP only (order status + FAQ in shadow mode for one buyer) at S$45K / 30 days
- **Extended Phase 1** = full 90-day spec at S$80-110K (effectively this rolls Phases 1+2 of the engagement model into one Supplier Bot delivery)

Charles to choose. Recommend starting with the compressed pilot to prove signal before committing to the wider build.

## 14. Open Items (block on Charles's input)

See `01_brainstorm.md` §5 — questions Q1-Q5. Cannot finalise architecture or price without ERP identity, volume figures, language requirements, and signing-identity decision.

---

*v0.1 — to be revised once Charles returns the actual spec / answers the open questions. Track changes with v0.2, v0.3, etc.*
