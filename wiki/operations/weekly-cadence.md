---
title: Weekly Cadence
type: sop
tags: [operations, cadence, sop, weekly]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/operations/service-delivery-runbook]], [[wiki/operations/support-incident-runbook]]
last_updated: 2026-05-28
status: draft
---

# Weekly Cadence

What gets done every day, every week, every month. Formalises the work-week planner from [SEA plan §8.4] into an executable SOP, plus the daily and monthly cycles that wrap around it.

## Weekly grid (Monday–Friday)

| | Mon | Tue | Wed | Thu | Fri |
|---|---|---|---|---|---|
| **AM** | Client deployments & support | Sales & marketing (networking, outreach) | Client deployments & support | Sales & marketing (networking, outreach) | Business development & strategy |
| **PM** | Sales & marketing (follow-ups) | Product development & refinement | Sales & marketing (follow-ups) | Client meetings & onboarding | Bookkeeping & admin |
| **Evening** | Professional development (courses, research) | — | Professional development (courses, research) | — | — |

Source: [1, §8.4]. Designed for 35+ hrs/week to the business [1, §8.3].

## Daily recurring (every business day)

### Morning open (15 min)

- Check Trillet dashboard for overnight alerts (S1/S2 candidates)
- Check email for client messages
- Open [[wiki/_dashboard]] — red / orange rows first
- Set the day's top 3 from the dashboard's "Do next" column

### End of day (5 min)

- Update [[wiki/_dashboard]] if any row's status changed
- Flag tomorrow's first task

## Weekly recurring

### Monday AM — Deployment block

Process any client deployments queued from the prior week's sales activity. Per the [[wiki/operations/service-delivery-runbook|service delivery runbook]] — Stages 4–6 take ~60 min each. Realistic Monday AM throughput: 2–3 deployments.

### Monday PM — Sales follow-ups

Reply to demo-call no-replies. Send the next-step email to anyone who called the demo line (+61 8 7741 4191) last week. Process inbound LinkedIn / website form leads from over the weekend.

### Tuesday AM — Networking / outreach

In-person where possible: South Perth BNI chapter, Chamber of Commerce events, industry meetups for the target verticals (trades, hospitality, professional services). Per the SEA plan marketing approach [1, §9].

### Tuesday PM — Product development

The only block reserved for *building*, not delivering or selling. Use for:
- New template development (when 10+ clients have requested the same feature)
- Trillet integration refinement
- Knowledge base improvements
- This vault — wiki ingest of accumulated context

### Wednesday AM — Deployment block (mirror of Monday)

### Wednesday PM — Sales follow-ups (mirror of Monday)

### Thursday AM — Networking / outreach (mirror of Tuesday)

### Thursday PM — Client meetings & onboarding

The dedicated block for:
- New client kickoffs / Stage 3 demo calls
- 30-day check-ins (scheduled in this block by default)
- Quarterly performance summary email reviews
- Channel-partner conversations (Kismet introduction calls, white-label resale prospects)

### Friday AM — Business development & strategy

The week's only block reserved for *strategic* work:
- Review the dashboard — what moved, what stuck
- Update [[wiki/_dashboard]], [[wiki/log]], any wiki pages that need refresh
- Read / research (industry, competitors, platform updates)
- Plan next week's priorities

### Friday PM — Bookkeeping & admin

- Process S4 change requests (batched per [[wiki/operations/support-incident-runbook]])
- Send invoices for any deployments completed this week
- Reconcile income / expenses
- File any contracts, receipts, compliance paperwork
- BAS / GST prep (quarterly cadence triggers in this block)

### Evenings (Mon, Wed)

Professional development. Per SEA plan §5: $150/month allocated to AI research subscriptions, courses, webinars [1, §5]. Keeps the technical edge sharp; non-negotiable.

## Monthly recurring (first Monday of the month)

- **Capacity review** — 30 min per [[wiki/operations/capacity-plan]]. Active clients, sustained hours, support backlog, hire/upgrade decision.
- **Dashboard refresh** — review [[wiki/_dashboard]] in full. Update statuses, last-touched dates, do-next columns.
- **Wiki lint** — run `/llm-wiki:lint` or equivalent. Surface dangling links, orphan pages, sparse communities.
- **MRR snapshot** — record the active subscriber count and MRR. Track against the Y1 trajectory (target: $15–20K MRR by Month 12) [1, §4].
- **Risk register review** — walk [[wiki/operations/risk-register]]. Update status on each item. Add new risks from the prior month's incidents.

## Quarterly recurring

- **Quarterly performance emails go out** (automated; ~30 min to QA the batch)
- **BAS / GST lodgement** (with accountant — see [[wiki/operations/risk-register]] for tax compliance)
- **Insurance review** — BizCover policy still appropriate? Limits still right at current client count? [1, §12.2]
- **Trillet plan utilisation review** — Studio vs Agency upgrade decision per [[wiki/operations/capacity-plan]]
- **Founder skills review** — what gaps surfaced this quarter? Adjust professional-development spend
- **Pricing review** — has competitor pricing shifted? Have COGS shifted? Adjust customer-facing tiers if needed [NEEDS KEV: confirm pricing review cadence — quarterly assumed]

## Annual recurring

- **SEA program quarterly reporting** (whatever the SEA provider requires) [NEEDS KEV: confirm SEA reporting cadence and format]
- **Insurance renewal** (~$660–720/year per [1, §12.2])
- **ABN / business name renewal**
- **Income tax lodgement** (with accountant)
- **Year-end vault lint pass + archive of completed work**
- **Year-end strategic review** — Y2 plan against actuals, hire / structure decisions per SEA plan §10

## Calendar implementation

The grid above lives in Google Calendar as repeating events. Each block is a calendar event with the block's name. The agent (Trillet, Darling Good demo line) is configured to know the founder's availability against this grid — no human meetings get auto-booked into product-development or strategy blocks.

[NEEDS KEV: confirm the calendar setup is in place, or queue as a launch-checklist item.]

## Sources

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]]

## [NEEDS KEV]

- Pricing review cadence (quarterly assumed; could be 6-monthly)
- SEA provider quarterly reporting requirements
- Google Calendar block setup status (likely a launch-checklist item)
