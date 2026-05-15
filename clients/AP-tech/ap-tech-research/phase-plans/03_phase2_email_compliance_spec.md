---
title: "Phase 2 — Email Compliance / Leakage Scanner · Spec v0.1"
prepared_for: AP Technologies (Charles Tang, Sean Tang, Russell Nagy)
prepared_by: Kev Tan, KTG
prepared: 2026-05-08
status: PRE-SPEC DRAFT — not yet validated with AP Tech
companion: 01_brainstorm.md, 04_process_flows.md
---

# Phase 2 · Email Compliance / Leakage Scanner — Spec v0.1

## 1. Problem

AP Tech sits on a stack of high-value confidential information that travels constantly by email: blue-chip MedTech OEM customer drawings, internal extrusion process parameters that took 13 years to refine, supplier-confidential pricing, employee PII across four jurisdictions (SG, CN, VN, US), and — at the Irvine site — potentially **ITAR/EAR-controlled** technical data. A single mis-addressed email containing a customer's catheter drawing pack to the wrong recipient is a contractual breach, a regulatory risk, and a reputational hit that could cost an OEM relationship that took years to win.

Manual review at this scale is impossible. Microsoft Purview (if licensed under E5) catches deterministic patterns — credit cards, SSNs, document IDs — but misses **contextual leakages** ("the new die geometry for [Customer X]'s cardiac balloon" → no regex matches that, but it's the moat going out the door). FDA QMSR (effective Feb 2, 2026) raises the records-control bar — every leak risk needs traceable evidence of detection, review, and disposition.

## 2. Goals

| # | Goal | Measure |
|---|---|---|
| G1 | **Detect contextual IP leakage** that Purview alone misses | ≥ 90% TPR on Sean's seeded test corpus (50 known-leak benchmarks) |
| G2 | **Keep false-positive rate low enough to not break workflow** | ≤ 5% on randomly sampled production traffic |
| G3 | **Produce QMSR-aligned audit evidence** | Quarterly auto-generated evidence pack, ISO 13485 §4.2.4 + §7.5.6 + QMSR §820.180-aligned |
| G4 | **Pre-empt incidents** | 0 customer-notifiable or regulator-reportable leakages post-deploy |
| G5 | **Build employee trust, not surveillance fatigue** | < 10% of employees flag the system negatively in a 90-day pulse |

## 3. Non-Goals (explicit)

- **Will not** read private personal mail not sent through corporate accounts.
- **Will not** generate behavioural profiles of individual employees.
- **Will not** auto-block in v1 — only nudge / hold / quarantine. Block mode considered in v2 after FP rate is proven.
- **Will not** monitor inbound mail for content (only metadata for phishing — that's a separate IT scope).
- **Will not** replace IT's existing security stack — this complements, doesn't substitute.

## 4. Leakage Categories (taxonomy)

| Category | Example | Typical detection layer |
|---|---|---|
| **Customer IP** | Drawing of an OEM's catheter geometry sent to non-customer domain | LLM contextual classifier |
| **Internal IP** | Tri-layer co-extrusion thermal profile parameters in plain text to a personal Gmail | LLM + sensitivity labels |
| **PII** | Employee NRIC, payslip, medical info | Purview pattern + LLM |
| **ITAR / EAR-controlled** | US-restricted tech sent from Irvine to non-US persons at SG/Xiamen/BN | Recipient-jurisdiction check + LLM context |
| **Supplier-confidential** | One supplier's pricing forwarded to a competing supplier | LLM (recipient-domain awareness) |
| **Financial** | Unreleased financials, M&A discussions | Purview keyword + LLM |
| **Credentials / secrets** | API keys, passwords, VPN configs | Regex / dictionary |

## 5. Architecture — Recommended (Layered)

```
Outbound email (Outlook / Graph send)
    ↓
M365 mail flow rule — copy to inspection pipeline (does NOT delay send by default in v1)
    ↓
LAYER 1: Purview / regex / dictionary (deterministic)
    – credentials, PII patterns, doc-ID patterns → SCORED
    ↓
LAYER 2: Sensitivity-label inheritance check
    – is the attachment labelled Confidential / Restricted? → SCORED
    ↓
LAYER 3: Recipient analysis
    – external domain? competitor list? customer-program mismatch? → SCORED
    ↓
LAYER 4: LLM contextual classifier (Claude Sonnet 4.6, async, 200-800ms)
    – "Does this email contain customer-specific manufacturing IP being sent to a non-customer recipient?"
    – returns: severity (none / low / med / high / critical), category, reason, confidence
    ↓
DISPOSITION
    – none → done, log
    – low → nudge sender ("are you sure this should leave AP?")
    – medium → hold for 30 min, sender-self-review, auto-release if not flagged
    – high → quarantine to Sean's review queue
    – critical → quarantine + notify Charles + Sean immediately
    ↓
AUDIT LOG (immutable, QMSR-aligned)
    – every email evaluated, scored, dispositioned, with model version + reasoner output
```

## 6. Detection Layers — Why Each Exists

| Layer | Catches what cheaper layers miss | Latency |
|---|---|---|
| L1 Purview / regex | Zero-context patterns (credit cards, secrets) — no need to spend LLM tokens | Inline, <50ms |
| L2 Sensitivity labels | Documents already classified by their owner | Inline, <50ms |
| L3 Recipient analysis | Domain-aware risk (competitor list, customer-program coherence) | Inline, <100ms |
| L4 LLM contextual | Everything else — the moat. Catches paraphrased tech IP, customer-name drift, unusual content/recipient pairings | Async, 200-800ms |

L1-L3 run inline (no send delay). L4 runs async — by default v1 does **not delay sends**, so an LLM-flagged high-severity email is held *after* sending and recalled if needed, rather than blocking everyone for 800ms on every send. This is the critical UX trade-off — discuss with Charles before locking.

## 7. Severity Bands & Default Actions

| Band | LLM signal | Action v1 (nudge mode) | Action v2 (after FP rate proven) |
|---|---|---|---|
| None | n/a | — | — |
| Low | "small risk, low confidence" | Logged silently | Logged silently |
| Medium | "plausible IP/PII/ITAR" | Nudge popup to sender | Hold 30 min, sender self-review |
| High | "likely leak, high confidence" | Hold + Sean review queue | Block until Sean approves |
| Critical | "ITAR-controlled tech to non-US person OR customer drawing to competitor" | **Hold + Charles + Sean alerted within 5 min** | Block + alert |

## 8. False-Positive Policy

- **Track every false positive** flagged by users or reviewers.
- **Weekly tuning sprint** for first 60 days — adjust prompts, rebalance severity bands.
- **Right of appeal** — sender can mark "this is not a leak" and email releases. Appeals logged.
- **No personal performance metrics tied to flag rates** (avoid Goodhart's law and surveillance optics).

## 9. Privacy & Governance

| Concern | Posture |
|---|---|
| Singapore PDPA | Lawful basis = legitimate interest (IP protection); employee notice updated; DPO sign-off before go-live |
| China (PIPL) | Xiamen scanning policy reviewed with local counsel; cross-border transfer assessment for any flagged content moved to SG review |
| Vietnam | PDPD compliance check; same scope as SG |
| US (ITAR/EAR) | Irvine site scanning includes deemed-export controls; non-US-person reviewers cannot see ITAR-flagged content |
| Storage | Email content not retained beyond evaluation window unless flagged; flagged content retained per QMSR records-retention (typically 5+ years) |
| Reviewer access | Sean + designated QMS reviewers only; Charles for critical band; reviewers under enhanced confidentiality |
| Anonymisation | Aggregate metrics public to leadership; individual flag history not shared outside QMS reviewer role |

## 10. Audit Trail (QMSR-Aligned)

Every email evaluated produces a record:

```
{
  "msg_id": "...",
  "timestamp": "...",
  "sender": "...",
  "recipient_domains": [...],
  "attachments": [{ "name": "...", "label": "...", "hash": "..." }],
  "evaluations": {
    "L1_purview": { "match_count": 0, "categories": [] },
    "L2_labels": { "highest_label": "Internal" },
    "L3_recipient": { "external": true, "competitor_match": false, "customer_program_match": "OEM-X" },
    "L4_llm": { "severity": "high", "category": "Customer IP", "reason": "...", "model": "claude-sonnet-4-6", "version": "...", "confidence": 0.87 }
  },
  "disposition": "hold_review",
  "reviewer": "sean@ap-tech.com",
  "reviewed_at": "...",
  "outcome": "released | quarantined | escalated"
}
```

This evidence schema is the QMSR audit pack. It's also reusable as a sales asset in OEM audits ("here's how we protect your IP, programmatically").

## 11. Milestones & Timeline (90 days)

| Day | Milestone |
|---|---|
| 0-7 | Discovery — Sean ride-along, review past leak incidents, define seed corpus (50 emails), provision M365 admin access, legal/DPO sign-off |
| 8-21 | Build L1+L2+L3 (deterministic) — pipeline live in **observation-only** mode (logs everything, actions nothing) |
| 22-35 | Add L4 LLM classifier — still observation-only; tune prompts on Sean's seed corpus until ≥ 90% TPR / ≤ 10% FPR |
| 36-50 | Switch to **nudge mode** — sender pop-ups for Medium+, hold for High, alert for Critical |
| 51-70 | Expand to all four sites; add ITAR-specific posture for Irvine; weekly FP-tuning sprints |
| 71-90 | Audit pack v1 generated; OEM-audit dry-run with Sean; v2 hold/block planning if FP rate ≤ 5% |

## 12. Success Metrics

| Metric | Target Day 90 |
|---|---|
| TPR on seed corpus | ≥ 90% |
| FPR on production sample | ≤ 5% |
| Critical leaks pre-deploy (baseline 12-month) | tbd by Sean — likely 1-3 |
| Critical leaks post-deploy | 0 |
| Audit-pack generation time | <1 day automated |
| Employee negative-pulse score | < 10% |
| ISO 13485 / QMSR audit findings on email controls | 0 |

## 13. Risks & Mitigations

| Risk | Severity | Mitigation |
|---|---|---|
| Over-blocking — productivity revolt | High | Nudge mode for first 30 days, weekly tuning, right of appeal |
| Surveillance perception → trust damage | High | Frame as IP protection, transparent policy, no individual metrics |
| LLM hallucination — false flag on innocuous content | Medium | Confidence threshold; reviewer override; appeal logged |
| Cross-border data transfer (CN, VN) | Medium-high | Local-tenancy classifier where possible; legal review before go-live |
| ITAR exposure to non-US-person reviewer | Critical | Reviewer role scoped by jurisdiction; Irvine-flagged content only visible to designated US persons |
| Cost overrun on LLM tokens at scale | Medium | L1-L3 deterministic gating reduces L4 calls by 70%+; budget cap with circuit-breaker |
| Bot becomes single point of failure | Medium | Manual override path always available; failure mode = pass-through with log, not block-everything |

## 14. Pricing Alignment

This spec spans more than the standard 60-day Phase 2 engagement (S$80-120K). Recommendation:

- **Lean Phase 2** = L1+L2+L3 only (no LLM classifier) at S$60-80K / 45 days. Solid Purview-based DLP. Catches obvious. Misses context.
- **Full Phase 2** = all four layers, full audit pack at S$110-150K / 90 days. The recommended pitch.

If Charles wants both bots in parallel, the team-of-one constraint applies — sequence Phase 1 then Phase 2, or accept extended timeline.

## 15. Open Items (block on Charles's input)

See `01_brainstorm.md` §5 — questions Q6-Q10. Cannot finalise without M365 license tier, scope (outbound vs both), reviewer role definition, ITAR program inventory, and a real past-incident benchmark.

---

*v0.1 — to be revised once Charles returns the actual spec / answers the open questions.*
