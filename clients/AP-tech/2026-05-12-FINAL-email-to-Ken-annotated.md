---
title: "FINAL — Email to Ken Ng (AP Tech), annotated against his message"
date: 2026-05-12
recipient: Ken Ng <ken.ng@ap-tech.com>
send_from: kevinktg@goodai.au (Good AI Australia business address)
status: ready-to-send draft — review fresh tomorrow, hit send before noon SGT
length: ~700 words — matches Ken's directness
authored_by: Kevin Tan / Good AI Australia (via Claude tonight)
---

# FINAL Email to Ken — Annotated to His Message

> **Subject line:** Re: AP Tech Purchase Process — read it, point-by-point
>
> **From:** kevinktg@goodai.au
> **To:** ken.ng@ap-tech.com
> **CC:** (leave blank for first reply — Charles can be added by Ken if he wants)

---

## The email body (copy-paste ready below this line)

Hi Ken,

Thanks for the brief and the PDF — I've been through it carefully. Going point-by-point on your structure so you can see I read it, then a couple of clarifiers I need from you before we lock anything.

**On the problem statement and the four inefficiencies you identified** — confirmed. Manual relay through Purchasing as a pass-through, no parallel processing, slow supplier outreach, manual error-prone tracking. Your §3.1 matrix nailed it. I'm not going to relitigate any of that.

**On the evidence — the 30+ emails for one purchase and the Mar 2 → Mar 17 cycle** — believed and noted. Your benchmark of 8–12 emails and 3–5 business days for an efficient equivalent is the right comparable. Acceptance criteria for our build is your §5.5 KPI progression, not numbers I make up.

**On your nine intended outcomes** — here's how we'd deliver each, mapped to specific Microsoft services in your existing tenant rather than the generic open-source stack the PDF originally suggested. This is the change I'd propose to make: shift the architecture from "Claude + FastAPI + PostgreSQL + SerpAPI + React" to a Microsoft-native stack you already pay for. Same outcomes, no new vendors, your IT team controls everything.

1. **Parallel processing of POs** → Azure Service Bus + Azure Functions, parallel workers per request. Engineers submit via Microsoft Teams using Microsoft Agent 365 (`@PurchasingBot`), not a separate React app.
2. **Exhaust all potential suppliers** → Azure Database for PostgreSQL for your approved vendor list, Bing Web Search API for English web, custom 1688/Alibaba/Baidu connectors for the Chinese internet sourcing you specifically called out.
3. **Negotiate on behalf of the team** → AI drafts negotiation emails with pre-approved parameter bounds (price ≤ 95% of last, lead time ≤ 14 days, etc.). Phase 1–2 = mandatory human approval. Phase 3 = conditional auto-send within bounds.
4. **Central point of communication** → Microsoft Graph API to `purchasing-ai@aptech.com` in your Exchange Online. Technical questions auto-routed to engineers via Teams; commercial questions to your purchasing team via Teams.
5. **Automated follow-ups and reminders** → Power Automate scheduled flows in your tenant, plus n8n self-hosted for stateful escalation logic.
6. **Chinese internet supplier sourcing** → 1688 Open Platform + Alibaba B2B + Baidu via custom connectors, running in-region on Azure China (21Vianet). AP Technologies Xiamen Co. Ltd. already holds the Chinese Business License needed for that, which keeps PIPL clean by data residency, not by workaround.
7. **Query internal AP Tech supplier DB** → Azure Data Factory or Functions connector to your existing system. Week 1 technical spike will tell us the integration approach. CSV fallback if direct access takes more time than the pilot window allows.
8. **Operate a dedicated email account** → `purchasing-ai@aptech.com` provisioned in Exchange Online, App Registration in your Entra ID, Microsoft Graph API for read/send. Looks like any other AP Tech email; purchasing team CC'd on outbound for credibility.
9. **Conversations retained in markdown** → Per-PO `.md` files in Azure DevOps Git, timestamped, version-controlled, exportable to PDF for compliance review. Ties cleanly into your ISO 13485 Clause 4.2 document control.

**On your closing note — "these aren't exhaustive" and "we can't meet all on first prototype"** — agreed, and that's the right instinct. I'd scope the MVP to one material category and one cohort of 2–3 pilot engineers, with the parallel processing and Chinese sourcing pulled into Phase 2 once the baseline architecture proves out. Six weeks for the pilot, with the final milestone payment waived if it doesn't measurably reduce time-from-request-to-first-supplier-email versus your current baseline.

**On commercials** — Singapore market range for a custom AI platform of this scope (5 months, regulated SME context) is SGD 120K–350K per OTG Lab's 2026 published pricing. I'd quote **SGD 220K headline for Phases 1–3**, which sits upper-mid-market and reflects the medical-device regulated premium plus the Chinese-language sourcing complexity. With Singapore EDG offsetting up to 50% and the Enterprise Innovation Scheme allowing 400% tax deduction on the first SGD 50K of qualifying AI spend, AP Tech's effective out-of-pocket lands around SGD 76K. I'll send the EDG-application supporting document at no extra cost if you decide to proceed — it doesn't block the project start.

**Two questions before I finalise scope:**

1. The Mar 2 → Mar 17 example — was that a direct material PO (medical polymer, catheter component) or indirect (cleanroom consumable, MRO)? Materially changes the regulatory profile and the right pilot partner from your side.
2. Where does AP Tech's approved supplier list actually live today — in an ERP (which one?), in Excel maintained by your procurement team, in QMS, or split across sites? Affects Week 1 of the build directly.

Happy to jump on a call today, tomorrow, or any time this week. I'd suggest 30 minutes is enough for the first conversation — we can go deeper after you've had a chance to push back on any of the above.

Best,

Kevin Tan
KTG / Good AI Australia
kevinktg@goodai.au · +61 [phone]

---

## Annotation map (for your reference before send)

| Paragraph in reply | Responds to in Ken's email |
|---|---|
| Para 1 (opening) | Ken's opening "Please see the attached PDF" + tone-match |
| Para 2 (problem + 4 inefficiencies) | Ken's "Problem statement" + 4 bullet inefficiencies |
| Para 3 (evidence) | Ken's "Evidences" — 30+ emails + Mar 2/17 cycle |
| Para 4 (architecture frame change) | Pre-empts a question Ken hasn't asked yet but the PDF raises: the stack change |
| Items 1-9 in the list | One-to-one mapping with Ken's 9 "intended outcomes" |
| Para after items (MVP scope) | Ken's "not exhaustive" + "can't meet all on first prototype" |
| Commercials paragraph | Implicit — Ken didn't ask price but will. Anchor with citation, not bare number. |
| Two questions | Doc-level ambiguities surfaced by our decomp — direct/indirect material + ASL location |
| Closing call offer | Ken's "I can jump into a call with you if needed today or tomorrow" |

---

## Send checklist (do tomorrow morning, fresh eyes)

- [ ] Confirm your phone number in the sign-off
- [ ] Confirm sending from `kevinktg@goodai.au` not the Outlook address Ken used (mention casually that you'd prefer the goodai.au thread going forward for KTG record-keeping)
- [ ] Re-read once at 9am SGT before sending. Anything that sounds off, cut.
- [ ] Send before noon SGT to land in Ken's inbox during his working window
- [ ] Do NOT attach the v2 .docx proposal yet. He asked for thoughts, not a proposal. The proposal lands after the call, if he wants it.
- [ ] If Ken's reply is short and positive, schedule the call within 24 hours and bring the v2 .docx then
- [ ] If Ken's reply is "can you send the full proposal?" — send v2 .docx with a one-paragraph cover note, don't argue

---

## What's deliberately NOT in this email

- No mention of `Suzhou` (Plexity error — AP Tech doesn't have a Suzhou site)
- No `GPT-4o` references (year stale — current is GPT-5.x and Claude Opus 4.6)
- No `Tze Han Yap` or `Weihang W.` names (Plexity-sourced, not independently verified)
- No discussion of the 5 medical-context risks beyond the 9 outcomes — save for the proposal
- No deliverables list / scope creep — Ken asked for thoughts, not a build plan
- No 22-page document attached — wrong stage of the conversation
