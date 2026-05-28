---
title: Service Delivery Runbook
type: runbook
tags: [operations, delivery, runbook, voice-agent]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/entities/trillet-ai]], [[wiki/concepts/voice-operating-layer]]
last_updated: 2026-05-28
status: draft
---

# Service Delivery Runbook

How a Good AI client goes from "signed up" to "live voice agent" in ~1 hour of founder time and ≤48 hours wall-clock [1, §8.1]. This is the load-bearing operations doc — every paying client moves through this runbook.

## Trigger

A new client has paid the setup fee + first month subscription. Or: a free-trial client has accepted activation.

## Pre-flight checklist (before starting Stage 1)

- [ ] Client has received the automated welcome email
- [ ] Client has received the Google Form link (intake)
- [ ] Client has received the 10-minute video tutorial link
- [ ] Calendar event scheduled: 30-min activation call within 48 hours
- [ ] Trillet account: confirmed within Studio plan limits (≤3 sub-accounts in use, ≤3 numbers active) — upgrade to Agency if at cap [2]

## Stage 1 — Client onboarding (15 min client time, automated)

**Owner:** automated workflow. **Founder time:** 0 minutes.

The client completes the Google Form supplying:

- Business name, ABN, primary contact, billing email
- Business hours (per day) and after-hours behaviour preference
- Departments / call routing rules (e.g. "press 1 for sales, 2 for service")
- Key contacts and transfer numbers
- Existing business phone number (the one callers will continue to dial)
- **Website URL** — Trillet's AI builder will read the site automatically to seed services, hours, pricing and FAQs into the agent's knowledge base [1, §8.1]
- Industry template selection (from Trillet's 36+ pre-built industry agents) [2]
- Voice persona preference (default: a clear Australian voice; voice clone available as add-on at $49 + PAYG) [1, §11.3]

**Output:** completed intake form in Google Workspace, ready for Stage 2.

## Stage 2 — Founder configuration (30 min founder time)

**Owner:** founder. **Founder time:** 30 minutes.

1. **Clone the template** in the Trillet platform (select the matching industry agent).
2. **Embed the intake data** into the agent's knowledge base — business hours, routing rules, key contacts.
3. **Configure integrations** the client has paid for (calendar, CRM, lead-form, Stripe billing). See [[wiki/entities/trillet-ai]] §"Native integrations included" for the full list and configuration approach.
4. **Set the voice** (default Australian, or custom clone if purchased).
5. **Run three test calls** simulating the most common caller intents (booking, FAQ, transfer). Confirm Verify → Ground → Act → Follow-through all work end-to-end [3].
6. **Send the client the review link** — they can call the agent themselves before going live.

**Pass criteria:** all three test calls complete without escalation to the founder's number. Booking lands in the calendar; CRM record created; SMS confirmation sent.

**Fail criteria:** any of the four phases (verify, ground, act, follow-through) breaks → fix before moving to Stage 3. Do not activate a half-broken agent.

## Stage 3 — Activation call (30 min founder time)

**Owner:** founder. **Founder time:** 30 minutes. **Client time:** 30 minutes.

Live call with the client.

1. **Walkthrough** of the client dashboard — where to see call logs, messages, transcripts.
2. **Connect the forwarding** — the client's existing business phone number is forwarded to the Trillet number per the platform's carrier-specific guide [2]. ~30 seconds at the carrier level. Client's customers never see a number change.
3. **Final live test call** with the client on the line — they hear their agent answer, take a booking, send a confirmation.
4. **Confirm activation** — explicit yes from the client. Service is now formally live.
5. **Send the post-activation email** — links to dashboard, support contact, the 30-day check-in calendar booking.

## Post-activation handoff

- Add to the [[wiki/operations/client-onboarding-sop|30-day check-in queue]].
- Add to the support escalation roster (the founder's direct line).
- Update [[wiki/REVENUE-MAP]] active-client count.
- Log to `wiki/log.md` (if the client is the first in a vertical, also create a case-study draft in `wiki/queries/`).

## Common failure modes & fixes

| Failure | Cause | Fix |
|---|---|---|
| Test call: agent doesn't understand the caller | Knowledge base seeded with thin website content | Manually add FAQs from the intake form into the Trillet KB |
| Test call: booking doesn't land in calendar | Calendar integration misconfigured | Reauth Google Calendar / Cal.com in the Trillet integration panel |
| Activation: forwarding doesn't work | Client's carrier guide outdated | Look up current guide; if missing, escalate to Trillet support (the platform maintains carrier-tested guides) [2] |
| Voice quality issues | Wrong voice profile / network at client side | Switch to fallback voice; advise client on bandwidth |
| Client wants a feature outside template scope | Scope creep | Quote separately at $1,500–$3,000 [1, §11.3]. If 10+ clients ask for the same thing, build a new tier template [1, §12.1] |

## Capacity per founder-week

At 60 min/deployment, the founder can theoretically do ~25–30 deployments per AM-block week. **Realistic ceiling: 8–10 deployments per week** once sales, support, and ops overhead are included [NEEDS KEV: confirm against first 3 client deployments — this is currently theoretical].

When weekly deployments exceed 6, trigger the VA-hire decision in the [[wiki/operations/capacity-plan|capacity plan]] (planned Month 6 per [1, §4]).

## Sources

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]]
- [2] [[wiki/entities/trillet-ai]]
- [3] [[wiki/concepts/voice-operating-layer]]

## [NEEDS KEV]

- Realistic per-week deployment ceiling — currently theoretical; calibrate against first 3 clients
- Carrier-specific forwarding edge cases (e.g. clients on legacy PBX) — runbook to be extended once observed
