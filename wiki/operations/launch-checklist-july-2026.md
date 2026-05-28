---
title: Launch Checklist — July 2026
type: checklist
tags: [operations, launch, checklist, july-2026]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/operations/_index]], [[wiki/entities/trillet-ai]]
last_updated: 2026-05-28
status: draft
launch_target: 2026-07-06
---

# Launch Checklist — July 2026

Week-by-week launch sequence for Good AI Australia's productised voice-agent service. Target: **first business week of July 2026 (week of 6 July)** [NEEDS KEV: confirm exact launch date — assumed Monday 6 July 2026 throughout].

Today is 28 May 2026 — five weeks out. Move with the launch-week date pulling everything backward.

Mark items: ☐ pending · ◐ in progress · ☑ done · ⊘ blocked / [NEEDS KEV]

---

## T-5 weeks · Week of 1 June 2026 — Foundation lock

The "is this actually going to ship?" gate. Cleared = green light to invest the rest of the cash from the Kismet contract savings into launch.

### SEA program

- ☐ Submit the SEA business plan with all 11 [NEEDS KEV] items cleared (see SEA plan redraft `[NEEDS KEV]` section) [1]
- ☐ SEA Allowance fortnightly rate confirmed in writing
- ☐ Business mentor first meeting booked

### Legal & financial

- ☐ Accountant engaged (Perth local firm) [1, §5] ⊘ [NEEDS KEV — see [[wiki/operations/risk-register]] OPS-007]
- ☐ ABN / business name registration certificate filed in vault under `assets/legal/`
- ☑ **Service agreement template written up** (per Kev 2026-05-28; final lawyer pass before signing first client)
- ☐ **Privacy Policy + ToS finalised** — drafts at [[wiki/legal/privacy-policy-draft]] + [[wiki/legal/terms-of-service-draft]] queued for lawyer review; needed before goodai.au is public
- ☐ Insurance certificate of currency on file (BizCover SMB combined policy already bound at ~$55–60/mo) ☑ [1, §12.2]
- ☐ Bank account / payment flow live — see [[wiki/operations/payment-processor-setup]]; path decision (A/B/C) is the gate

### Technical platform

- ☐ Trillet Studio plan ($99/mo) activated against Good AI's billing
- ☐ Demo line +61 8 7741 4191 confirmed within Trillet's included allocation (3 numbers in Studio) [2]
- ☐ Second number purpose-assigned (sales / support split?) [NEEDS KEV]
- ☐ Backup data residency check — confirm Australian residency configured at the Trillet account level [2]

### Vault & operations

- ☑ Operations Handbook drafted (this cluster)
- ☐ Operations docs reviewed and tightened where [NEEDS KEV] is high-priority
- ☑ Project dashboard live ([[wiki/_dashboard]])
- ☑ `purpose.md` + `CLAUDE.md` schema sorted

---

## T-4 weeks · Week of 8 June 2026 — Product readiness

The five proof-of-concept agents from pre-Trillet predate the current launch platform [1, §5]. Re-build the productised offering on Trillet so it's ready for live customers.

### Trillet configuration

- ☐ Seven customer-tier templates built and tested on Trillet [1, §11.3]
  - ☐ Business Starter (300 min / $149/mo)
  - ☐ General Enquiries Assistant (400 min / $170/mo)
  - ☐ Meetings & Bookings (600 min / $199/mo)
  - ☐ Sales Lead Generation (800 min / $249/mo)
  - ☐ Property Management (1,000 min / $299/mo)
  - ☐ Food & Hospitality (1,200 min / $299/mo)
  - ☐ Complete Customised (1,400 min / $499/mo)
- ☐ Reconcile included-minutes-per-tier ambiguity in the pricing table [NEEDS KEV — SEA plan §11.3 still flagged]
- ☐ "Darling Good" demo persona deployed on the demo line
- ☐ End-to-end test: call the demo line, take a booking, confirm calendar event lands, SMS confirmation sent — all four phases (verify · ground · act · follow-through) confirmed [3]

### Integrations

- ☐ Google Calendar integration tested
- ☐ Google Forms intake form built (Stage 1 of [[wiki/operations/service-delivery-runbook]])
- ☐ Welcome email automation built and tested (n8n or Trillet built-in)
- ☐ Stripe / payment processor wired end-to-end
- ☐ CRM choice committed and connected [NEEDS KEV — HubSpot, GoHighLevel, or other?]

---

## T-3 weeks · Week of 15 June 2026 — Brand & marketing assets

The website goes live this week; marketing collateral is ready before any prospect can find it.

### Website (goodai.au)

- ☑ **goodai.au website built and live** (per Kev 2026-05-28 — base site exists, no AI on it yet)
- ☐ **AI-on-site Phase 1 complete** — chat widget + demo-call CTAs + call-recording examples per [[wiki/operations/ai-on-site-playbook]]. **CRITICAL GATE: do not push public traffic to the site until Phase 1 is live.**
- ☐ Each tier page tightened: setup fee, monthly, included minutes, what's added vs. lower tier, example call recordings or "call the demo line" CTA
- ☐ Industry-specific landing pages for the focus verticals: trades, hospitality, professional services, property management, retail [1, §2] — Phase 3 of AI-on-site playbook, post-launch
- ☑ Embedded "call the demo" CTA leading to +61 8 7741 4191 (assumed shipped with base site; verify placements per AI-on-site playbook §1.2)

### Marketing collateral

- ☐ "Perth Pioneers" Month 1 free programme: landing page + signup form + 20-slot cap counter [1, §9]
- ☐ 12+1 annual prepay offer page (8.3% effective discount) [1, §9]
- ☐ Referral program one-pager (one month free per successful referral) [1, §9]
- ☐ ROI comparison sheet: $149–$499/mo vs $60K+ receptionist [1, §3]
- ☐ Industry case-study templates ready to populate (Manaa, Sun Island Bali, Hewson — pull from `wiki/clients/`)
- ☐ Local SEO: Google Business Profile claimed and optimised for "AI voice agent Perth", "AI receptionist WA", etc. [1, §9]

### Networking calendar

- ☐ South Perth BNI chapter — first three meeting dates in calendar
- ☐ Chamber of Commerce next event in calendar
- ☐ Industry-specific meetups identified (trades / hospitality)

---

## T-2 weeks · Week of 22 June 2026 — Soft launch (friends-and-family)

Activate the first ~3 friendly clients before the public launch. Calibrate every step of the [[wiki/operations/service-delivery-runbook|service delivery runbook]] against real humans.

- ☐ Identify 3 willing soft-launch clients [NEEDS KEV — names and verticals]. Existing relationships preferred so feedback is direct and forgiving.
- ☐ Run each through full Stages 1–6 of the runbook
- ☐ Measure: total client time, total founder time, time from payment to activation
- ☐ Capture: what broke, what was confusing, what took longer than estimated
- ☐ Update [[wiki/operations/service-delivery-runbook]] and [[wiki/operations/client-onboarding-sop]] with the real-world deltas
- ☐ Recalibrate [[wiki/operations/capacity-plan]] per-client effort numbers against actuals
- ☐ Pull one case study from a willing soft-launch client (anonymised if needed)
- ☐ Confirm support runbook — run one fake S2 incident with a soft-launch client's permission, time the response

---

## T-1 week · Week of 29 June 2026 — Sales activation

Final week before live. Soft-launch wins become public proof points; outreach goes live.

- ☐ Soft-launch case study published on goodai.au
- ☐ Kismet channel: brief the four BDMs (Josh, DJ, Shane, Lea) on the live product — pricing, demo line, intake flow [1, §9 channel partner economics]
- ☐ White-label resale outreach: 3 Perth agencies / consultants / MSPs identified and contacted (web devs, marketing agencies, IT MSPs, bookkeepers) [1, §9]
- ☐ AP Tech referral testimonial captured in writing [1, §5 — declined-but-referrer]
- ☐ Google Ads campaigns live — keywords: "Perth business answering service", "AI for tradesmen WA" [1, §9]
- ☐ LinkedIn announcement scheduled for launch-day
- ☐ Facebook community groups: announcement drafted for South Perth business forum, Perth tradie networks [1, §9]
- ☐ Email to existing network ready to send launch-day morning

---

## Launch week · Week of 6 July 2026 — Go live

- ☐ Monday 6 July: announcement posts go live on LinkedIn + email list
- ☐ "Perth Pioneers" Month 1 free programme open (first 20 clients) [1, §9]
- ☐ Demo line monitored — every call answered by founder personally within 4 hours if Darling Good can't close it [3]
- ☐ Networking event attendance: at least 2 in-person events this week
- ☐ Daily founder check-in time set for incidents (15-min morning + 15-min afternoon)
- ☐ Capacity gate: hold a waitlist if new-deployment requests exceed 6/week per [[wiki/operations/capacity-plan]]
- ☐ Daily log entries to `wiki/log.md` for the first two weeks (`## [YYYY-MM-DD] launch | <one-line>`)

---

## T+1 week · Week of 13 July — Stabilise

- ☐ All Week-1 clients through Stage 6 activation
- ☐ Friday review: what broke, what took longer than the runbook said, update the runbooks
- ☐ Update [[wiki/operations/risk-register]] with anything that surfaced
- ☐ First retention email send to Week-1 clients (early relationship-builder)
- ☐ Capacity check: any of the VA-hire triggers firing yet?

---

## T+2 weeks · Week of 20 July — First refinement pass

- ☐ Aggregate the Week-1+2 incident log — patterns?
- ☐ Adjust template prompts based on real-call data
- ☐ Adjust pricing pages if any tier is misfiring (under/oversold)
- ☐ Channel-partner debrief: how many qualified leads from each source?

---

## T+3 weeks · Week of 27 July — 30-day reviews begin

- ☐ First soft-launch clients hit their 30-day check-in (carry over from T-2 weeks)
- ☐ Lessons feed into [[wiki/operations/client-onboarding-sop]] Stage 7

---

## T+4 weeks · Week of 3 August — End of launch month 1

- ☐ End-of-month review: active client count, MRR, sales pipeline, support backlog, time-to-activation actuals
- ☐ Compare to Phase 1 SEA plan targets (Months 1–2: development complete, ABN secured, website live, plan approval) — most should be already true; check anyway [1, §4]
- ☐ Decide: continue at current cadence, or pull the VA hire forward?
- ☐ Write the launch-month retrospective into `wiki/queries/launch-retro-aug-2026.md` and file back into the wiki

---

## Roll-back / fallback gates

If by T-2 weeks any of the following are red, **delay the launch by 4 weeks** (target Aug instead of July) rather than ship broken:

- Trillet platform not configured end-to-end (all 7 tiers tested)
- Website not live
- Payment processor not flowing
- Insurance not bound
- Soft-launch clients couldn't be activated through Stages 1–6 in budget time

A 4-week delay is much cheaper than launching with broken delivery and burning reputation in Perth's small business community.

---

## Sources

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]]
- [2] [[wiki/entities/trillet-ai]]
- [3] [[wiki/concepts/voice-operating-layer]]

## [NEEDS KEV]

- Exact launch date (Monday 6 July 2026 assumed)
- Accountant engaged (firm name)
- Payment processor flow chosen (Stripe direct vs Stripe via Trillet)
- CRM choice committed (HubSpot vs GoHighLevel vs other)
- Three soft-launch client names + verticals
- Second phone number purpose (sales / support / other)
- Final included-minutes-per-tier reconciliation (the SEA plan §11.3 ambiguity)
- SEA Allowance fortnightly rate (for cashflow forecast that the SEA submission requires)
