---
title: "Warm Reply to Ken Ng — AP Tech Purchase Process"
date: 2026-05-12
client_contact: Ken Ng (ken.ng@ap-tech.com)
purpose: 1-page reply Kev can send tonight, before / instead of the full v2 proposal
companion: 2026-05-12-AP-Tech-AI-Purchasing-Proposal-v2.docx
---

# Warm Reply — Ken Ng (AP Tech Purchase Process)

> **Tone goal:** match Ken's directness. He wrote bullet points and offered a call. We answer his bullets and offer a call back. No deck. No 22-page proposal in this thread — that lands after the call, if he wants it.
>
> **Strategic logic:** Ken's email is an invitation to think together, not a request for a formal proposal. Sending the polished v2 .docx in response risks looking like we are over-selling. The warm reply earns the call; the call earns the right to deliver the proposal.

---

## Option A — Reply from `kevinktg@goodai.au` (recommended)

**To:** ken.ng@ap-tech.com
**Cc:** Charles Tang (if Kev already has him on the thread)
**Subject:** Re: AP Tech Purchase Process — read it, here's what I'd build

Hi Ken,

Read your PDF and your bullet points. Quick thoughts before we jump on a call.

Your problem statement is right. 30+ emails for a single material purchase and a 2-week cycle from request to confirmation are not just inefficient — in your context, they're an ISO 13485 audit-trail gap and a production-delay risk on tolerance-driven medical components. Your team has already done the analysis; I don't think we need to relitigate the problem.

Three things I'd refine on the implementation:

1. **The whole solution should run inside your Microsoft estate, not as a separate stack.** Your PDF flags "Graph API preferred if on Microsoft 365" — that's the door I'd walk through. Azure OpenAI GPT-4o is now live in Singapore (since Jan 2025). Combined with Microsoft Graph API for a dedicated `purchasing-ai@aptech.com` mailbox, Power Automate for approval gates, Teams as the engineer surface (`@PurchasingBot` via Microsoft Agent 365), and Azure DevOps Git for the markdown PO logs — every component lives inside your Azure tenant. No new vendors for your IT team to onboard. Procurement of *us* becomes the same conversation as procurement of any other internal config change.

2. **Chinese sourcing should run from an Azure China (21Vianet) tenant — and you can already do that.** AP Technologies (Xiamen) Co., Ltd. holds the Chinese Business License needed. The 1688 / Alibaba / Baidu connectors live in-region, the conversation data stays in China for PIPL compliance, and Singapore HQ sees aggregated analytics over the encrypted cross-border pipeline. That's not a custom architecture — it's the pattern Microsoft built for this scenario. The only catch: Azure China tenant setup takes 2–4 weeks, so I'd start it at Phase 2 kickoff, not Week 11.

3. **The MVP can be tighter than your Phase 1.** I'd scope the first 6 weeks to one material category, one cohort of 2–3 pilot engineers, and one purchasing lead — not the whole team. Build the Request Parser, draft-with-approval email flow, and markdown logging. Measure against your own §5.5 KPIs. If we don't move the needle on emails-per-PO or cycle time in 6 weeks, you don't pay the final milestone.

Two things I'd add to your §6 risk table — both medical-device specific:

- **Phase 2 CN sourcing must hard-filter unqualified suppliers.** "1688 supplier" is not the same as "ISO 13485-approved vendor." The Supplier Matcher should never put unqualified vendors in the primary recommendation queue — they go to a separate Potential Vendor bucket for Tze Han's team to review.
- **Spec translation in Chinese carries qualification risk.** "Medical grade" on 1688 ≠ ISO 13485. Every CN-sourced quote needs an automatic disclaimer flag until your team has done its own qualification pass.

On commercials — Singapore market rates for AI specialist work sit at SGD 175–250/hr, which puts Phase 1 (the 6-week MVP) at around **SGD 32K fixed, milestone-based, with the final 30% waived if the pilot doesn't reduce cycle time**. Full programme through Phase 4 lands around SGD 146,500 — and AP Tech Singapore likely qualifies for the Enterprise Development Grant which would offset up to 50% of that. I can carry the EDG application document at no extra cost.

I have a full proposal write-up I can send if it would be useful, but I'd rather we talk first — I have some open questions only your team can answer (which material category makes the cleanest pilot; whether the Mar 2–17 example came out of Xiamen or Suzhou; whether your existing supplier DB has API access or we should expect a CSV fallback).

**I have time this week:** Tuesday 13 May 14:00–17:00 SGT, Wednesday 14 May 09:00–12:00 SGT, or Thursday 15 May any time. 30 minutes is plenty for the first conversation.

Best,
Kevin

— Kevin Tan
KTG / Good AI Australia
kevinktg@goodai.au · kevin.pl.tan@gmail.com

---

## Option B — Shorter version (if Kev prefers minimal)

**To:** ken.ng@ap-tech.com
**Subject:** Re: AP Tech Purchase Process

Hi Ken,

Read your PDF. Three things stood out:

1. The whole thing can run inside your existing Microsoft 365 / Azure tenant — Azure OpenAI GPT-4o (live in Singapore since Jan 2025), Graph API for the dedicated mailbox, Power Automate for approval gates, Teams as the engineer interface. Zero new vendors for your IT team.
2. CN sourcing fits cleanly on Azure China (21Vianet) — your Xiamen entity already holds the Chinese Business License. 1688 / Alibaba / Baidu connectors run in-region; analytics syncs to Singapore.
3. A 6-week MVP scoped to one material category, with the final milestone waived if cycle time doesn't measurably drop, is a much lower-risk way for AP Tech to test this than a full Phase 1 build.

I have a full proposal write-up ready (~22 pages — Microsoft-native architecture, the 9 requirements annotated to your §4.4, pricing calibrated for Singapore market with EDG offset). Happy to send it, but I'd rather we talk first — 30 minutes this week. I have Tue 14:00-17:00, Wed 09:00-12:00, or Thu any time SGT.

Best,
Kevin

---

## Coaching note

- **Mention real names** if Kev has them: "Tze Han and the procurement team" lands better than "your team." Validates we did the homework.
- **Don't lead with price** in the warm reply. The reply earns the call. Pricing belongs in the proposal after we know the actual pilot scope.
- **One specific time** is more committal than three — but three signals respect for his calendar. Three is the right call here.
- **If Ken says "send the proposal first"** — switch to delivering the v2 .docx with a one-paragraph cover note. Don't argue.
