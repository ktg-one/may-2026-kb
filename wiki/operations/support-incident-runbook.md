---
title: Support & Incident Runbook
type: runbook
tags: [operations, support, incident, runbook]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/entities/trillet-ai]], [[wiki/operations/service-delivery-runbook]]
last_updated: 2026-05-28
status: draft
---

# Support & Incident Runbook

What to do when something goes wrong. Two paths: (1) **support** — the client has a question or wants a change; (2) **incident** — something is broken and a paying client is affected.

## Severity classes

| Class | Definition | First response SLA | Resolution SLA |
|---|---|---|---|
| **S1 — outage** | Agent not answering at all for ≥1 client. Trillet platform-side outage. | 30 minutes | 4 hours |
| **S2 — degraded** | Agent answering but materially failing (verify / ground / act / follow-through broken). One client affected. | 2 hours | 1 business day |
| **S3 — issue** | Agent works but client reports an annoyance or unexpected behaviour. | 1 business day | 3 business days |
| **S4 — change request** | Client wants a tweak (new FAQ, new routing rule, voice change). | 2 business days | 5 business days |

**[NEEDS KEV: confirm SLAs are appropriate for the Starter tier vs Enterprise tier. The SEA plan doesn't formalise per-tier SLAs.]**

## Triage flow

```
Issue arrives (email / phone / Trillet dashboard alert)
        │
        ▼
Is the agent answering at all? ──── No ──► S1 path
        │ Yes
        ▼
Is the core flow (verify·ground·act·follow-through) intact? ──── No ──► S2 path
        │ Yes
        ▼
Is the client blocked from running their business? ──── No ──► S3 or S4 path
        │ Yes
        ▼
Treat as S2
```

## S1 — outage path

**Symptoms:** client reports agent not picking up; calls failing; Trillet dashboard shows red.

1. **Acknowledge to the client within 30 minutes.** "We're on it. Updating you within the hour."
2. **Check Trillet status page first.** If platform-wide → wait, communicate, do not attempt local fix. Trillet's 99.97% SLA covers this [2].
3. **If client-specific:**
   - Check call-forwarding at the carrier level (the most common cause). Walk the client through verifying it.
   - Check Trillet number assignment hasn't drifted.
   - Re-test from the founder's phone.
4. **Workaround:** if Trillet platform is down for >2 hours, advise the client to switch forwarding back to their original answering setup. Resume forwarding to Trillet once status is green.
5. **Post-incident:**
   - Refund the day pro-rata as goodwill (no-questions)
   - Write a one-paragraph incident note in `wiki/queries/incidents/<date>-<client>.md` (creates the incident-log cluster)
   - Update this runbook with the failure mode if it's new

## S2 — degraded path

**Symptoms:** agent answers but bookings don't land, knowledge base returning wrong info, integrations broken.

1. **Acknowledge within 2 hours.**
2. **Pull the last 5 call transcripts** from the Trillet dashboard. Listen / read end-to-end. Identify which of the four phases is failing.
3. **Common fixes by phase:**
   - **Verify** failing → check 2FA / identity-check configuration; client's CRM credentials may have rotated
   - **Ground** failing → knowledge base is stale (client changed their website / hours); re-run the website-scrape, edit FAQs
   - **Act** failing → integration credentials expired (Google Calendar, HubSpot, etc.); reauth in Trillet
   - **Follow-through** failing → SMS / email configuration; check Twilio / SMTP at Trillet side
4. **Fix, re-test with three live test calls** before declaring resolved.
5. **Notify the client** with the root cause in one paragraph.

## S3 — issue path

**Symptoms:** agent works but client says "it sounds weird" / "missed a nuance" / "could it also do X".

1. **Acknowledge within 1 business day.**
2. **Pull example calls** the client flagged.
3. **Decide:** is this a *configuration tweak* (within tier) or a *new feature* (outside tier)?
   - **Configuration tweak** → fix in <30 min, no charge
   - **New feature** → quote separately at $1,500–$3,000 per the scope-creep rule [1, §12.1]. If 10+ clients want the same thing, build a new template [1, §12.1]
4. **Log** to `wiki/queries/<date>-<client>-issue.md` so patterns emerge over time.

## S4 — change request path

**Symptoms:** client wants to add an FAQ, a routing rule, a new voice line.

1. **Batch these.** Don't context-switch on every micro-request. Process change requests in the **Friday afternoon** "Bookkeeping & Admin" block per [[wiki/operations/weekly-cadence]].
2. **Apply changes** in Trillet. ~5–10 min per typical change.
3. **Run one test call** to confirm.
4. **Confirm to client.**

## Escalation to Trillet support

Escalate when:

- Platform-side issue can't be diagnosed locally
- Compliance question (HIPAA, GDPR, TCPA, AU residency) requires platform-side confirmation
- Pricing dispute / billing anomaly
- Feature genuinely missing from Trillet (file as a product request, not an incident)

**Trillet channels:** documented support email + community Discord per platform docs at `docs.trillet.ai` [2]. **[NEEDS KEV: confirm direct support email / priority-support escalation path on the Studio plan vs Agency plan — Studio gets "priority support" but the SLA isn't published.]**

## Communication templates

### S1 first-response (within 30 min)

> Subject: Service issue — we're on it
> 
> [Client name], we're aware [agent name] isn't picking up. The team is on it now and we'll have an update within the hour. If you need to capture leads in the meantime, switch your forwarding back to [their original setup] — I'll let you know the moment we're back.

### S2 resolution

> Subject: Resolved — [one-line root cause]
> 
> [Client name], your agent is back to full function. Root cause was [one paragraph in plain English]. We've tested three live calls end-to-end and confirmed [the broken phase] is working. Quarterly check-in still on for [date].

### S3 / S4 acknowledgment

> Subject: Got it — change request logged
> 
> [Client name], received. I've queued the change for Friday's batch. You'll see the update on the agent by end of day Friday.

## Logging discipline

Every incident, however small, gets a one-paragraph entry in `wiki/queries/incidents/`. Over time this becomes the case library that lint surfaces patterns from.

Append a line to `wiki/log.md` for any S1 or S2:

```
## [YYYY-MM-DD] incident | <client> S1/S2 — <one-line cause and resolution>
```

## Sources

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]]
- [2] [[wiki/entities/trillet-ai]]

## [NEEDS KEV]

- Per-tier SLAs (S1/S2/S3/S4 response and resolution times)
- Trillet priority-support escalation channel for the Studio plan
- Refund policy for S1 outages — flat day pro-rata or other rule
