---
title: Client Onboarding SOP
type: sop
tags: [operations, onboarding, sop, client-journey]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/operations/service-delivery-runbook]], [[wiki/entities/trillet-ai]]
last_updated: 2026-05-28
status: draft
---

# Client Onboarding SOP

End-to-end procedure from "lead surfaced" to "30-day check-in complete". Wraps around the [[wiki/operations/service-delivery-runbook|Service Delivery Runbook]] (which only covers Stages 4–6 below).

## Stages

| # | Stage | Owner | Time | SLA |
|---|---|---|---|---|
| 1 | Lead qualified | Founder | 15 min | Same day |
| 2 | Demo call (Darling Good) | Founder + AI | 20 min | Within 48 hours of lead |
| 3 | Tier selection + payment | Founder + client | 15 min | Within 48 hours of demo |
| 4 | Intake form (Stage 1 of runbook) | Client (automated) | 15 min | Within 24 hours of payment |
| 5 | Configuration (Stage 2 of runbook) | Founder | 30 min | Within 24 hours of intake |
| 6 | Activation call (Stage 3 of runbook) | Founder + client | 30 min | Within 48 hours of payment |
| 7 | 30-day check-in | Founder | 20 min | At Day 30 |
| 8 | Quarterly performance summary | Automated email | n/a | First send at Day 90, then quarterly |

**Total client effort:** ~80 minutes spread across ~3 days.
**Total founder effort:** ~2 hours per client over the first 30 days, then ~5 min/quarter ongoing.

## Stage 1 — Lead qualified

A lead is *qualified* when:

- Decision-maker contacted (owner / partner / GM, not gatekeeper)
- Business has ≥1 phone-driven workflow (bookings, intake, enquiries) — the [[wiki/concepts/voice-operating-layer|voice operating layer]] needs something to operate on
- Budget signal: comfortable with $149–$499/mo + setup [1, §11.3]
- Target industry (one of Trillet's 36+ verticals, ideally) [2]

If the lead is not qualified, log to CRM as "nurture" and move on. Don't push the demo.

## Stage 2 — Demo call (Darling Good)

The phone call IS the demo. Hand the prospect the +61 8 7741 4191 number and let them experience the product before they hear another word from the founder [1, §9].

After their call, the founder follows up with a one-line message:

> *"That was an AI. It costs $149–$499/mo to put one of those on your business line. Want a real conversation about it?"*

Book a 20-minute follow-up. Use that call to:

- Identify which Trillet vertical template matches the prospect's business
- Confirm tier (Business Starter / Meetings & Bookings / Sales Lead / Property / Hospitality / Complete Custom) [1, §11.3]
- Walk through the [[wiki/operations/service-delivery-runbook|delivery model]] — what happens after they pay

## Stage 3 — Tier selection + payment

- Client picks tier
- Founder issues invoice (setup fee + first month) — payment method [NEEDS KEV: confirm payment processor — Stripe via Trillet, direct Stripe, or other]
- Send the automated welcome sequence (Stage 4 trigger)

## Stage 4 — Intake form

See [[wiki/operations/service-delivery-runbook]] §Stage 1.

If the client doesn't complete the intake within 24 hours of payment, the founder sends a single chase message. After 48 hours of silence, escalate (call them).

## Stage 5 — Configuration

See [[wiki/operations/service-delivery-runbook]] §Stage 2.

## Stage 6 — Activation call

See [[wiki/operations/service-delivery-runbook]] §Stage 3.

## Stage 7 — 30-day check-in

20-minute call. Standard agenda:

1. Performance review — calls handled, bookings made, transfers, any issues (pulled from the Trillet dashboard before the call)
2. Listen to one or two real call recordings together — does the agent sound right? Are there nuances to tune?
3. Optimisation pass — adjust prompts, add FAQs, refine routing if needed (apply same day, ~15 min founder time)
4. Upgrade conversation if appropriate — has their usage grown into the next tier?
5. Referral ask — *"Who else in your network would benefit?"* The referral one-month-free incentive is the ask vehicle [1, §9]

Log the check-in to CRM. If issues surfaced, create a follow-up task.

## Stage 8 — Quarterly performance summary

Automated email from the founder's account [NEEDS KEV: which tool generates the quarterly email — Trillet built-in, n8n workflow, or manual?]. Contents:

- Calls handled this quarter
- Average call duration
- Bookings created / converted
- Customer satisfaction (if collected)
- "How can we make this better?" — one-line invite to reply

Goal: reinforce ongoing value and surface upgrade triggers.

## Handoff rules

- **Sales → Delivery:** Stage 3 to Stage 4 happens *automatically* on payment. Founder doesn't manually trigger.
- **Delivery → Support:** after Stage 6 activation, the client is live. Direct support is the founder's email + phone until the VA is hired (Month 6) [1, §4].
- **Delivery → Retention:** Stage 7 30-day check-in is the formal handoff. Calendar reminder is set during Stage 6.

## Failure modes

| Failure | Impact | Response |
|---|---|---|
| Lead unqualified but pushy | Wasted demo time | Hold the qualification line; offer the Digital Health Check at $149 as a lower-touch entry [1, §11.3] |
| Client pays then ghosts on intake | Setup fee captured, no delivery | After 48 hours: call. After 7 days: pause and refund the unused subscription portion |
| Client signs up for wrong tier | Mismatch usage to plan | Catch at Stage 5 (configuration). Move them to the right tier same-day, prorate |
| 30-day check-in skipped | Retention risk | Hard rule: never skip. If client can't make the call, do an async written summary instead |

## Sources

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]]
- [2] [[wiki/entities/trillet-ai]]

## [NEEDS KEV]

- Payment processor and exact invoice flow (Stripe direct? Stripe via Trillet? Other?)
- Quarterly performance summary — automation owner and trigger
- Refund policy specifics — pro-rate rules for unused subscription
