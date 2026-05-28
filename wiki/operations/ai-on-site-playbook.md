---
title: AI-on-Site Playbook for goodai.au
type: playbook
tags: [operations, website, ai-on-site, demo, marketing, launch]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/entities/trillet-ai]], [[wiki/concepts/voice-operating-layer]], [[wiki/good-ai]]
last_updated: 2026-05-28
status: draft
---

# AI-on-Site Playbook for `goodai.au`

The website is the storefront of an AI solutions company. Shipping it with no live AI on the page is a credibility kill — every Perth competitor with a marketing budget can match a static brochure-ware site. The leverage is **the site itself being a working demo of what we sell**. Same logic as Darling Good on the phone line: the experience IS the pitch.

This playbook defines what AI gets embedded on `goodai.au`, in what build sequence, against what dependencies. Launch-gate: at minimum Phase 1 (Live) must be on the site before public launch.

## Operating principle

Every AI demo on the site is itself a productised offering Good AI can sell. The chat widget is a Knowledge Bot demo. The voice call is a Voice Reception demo. The Digital Health Check is a Discovery Assessment demo. The ROI calculator is a Lead Capture + content marketing demo. **The site is the catalogue.**

## Phase 1 — Live before public launch (must-have)

### 1.1 Embedded knowledge-bot chat widget

**What it is:** A persistent chat widget on every page of `goodai.au`. Knows the product catalogue, pricing tiers, FAQ, scheduling availability. Answers real prospect questions in real time.

**What it proves:** The Knowledge Bot offering (currently part of the Growth tier per the broader product catalogue in [[wiki/good-ai]]). When a prospect asks "what's the difference between Starter and Growth?" and gets an accurate, conversational answer in 2 seconds — they've just experienced what they'd be paying $300/mo for in their own business.

**Build path:**
- **Option A — Trillet platform:** Trillet's messaging channels include SMS, WhatsApp and Facebook Messenger natively [2]. **[NEEDS KEV: confirm whether Trillet supports a direct web chat widget, or whether the in-browser experience needs a different surface.]**
- **Option B — third-party widget + same knowledge base:** Use a chat tool that supports a web widget (Chatbase, Intercom Fin, Crisp + LLM, custom build) connected to the same knowledge base content the Trillet voice agents use. Keeps the experience consistent across phone and web.
- **Default:** start with Option B if Trillet doesn't ship a web widget; the goal is *something live*, not perfect tooling.

**Knowledge base content:** product pages, pricing tiers, FAQ, sample call recordings, case studies. Source pages get tagged with the LLM Wiki `sources[]` pattern — the chat widget's RAG layer ingests the same canonical wiki content that powers everything else.

**Build effort:** 1–2 days end-to-end. **Dependency:** website live ☑, content for FAQ pages drafted.

### 1.2 "Call our demo line" CTA — multiple placements

**What it is:** Prominent click-to-call buttons throughout the site. Calls **+61 8 7741 4191** (Darling Good).

**What it proves:** Voice Reception — the easiest tier-1 product. The call itself converts.

**Build effort:** trivial (hyperlinks + tracking). **Dependency:** demo line in service ☑ (confirmed earlier this session).

**Placements** — at minimum:
- Hero block of home page
- Each product page (especially Voice Reception)
- Sticky footer / floating button
- Email signature block
- Thank-you page after Digital Health Check submission

### 1.3 Live call-recording examples on each product page

**What it is:** Short audio clips (15–60 seconds) of Darling Good handling specific scenarios — booking, FAQ, transfer, after-hours. Embedded audio players on the relevant product pages.

**What it proves:** The agent works on real calls. Not a demo loop; actual operating performance.

**Build effort:** ~half-day to capture 3–5 clean clips, edit lightly, transcribe under each player for SEO + accessibility.

**Compliance note:** every recording requires consent from the called party. Use scripted internal test calls or explicit-consent client recordings only. **[NEEDS LAWYER: confirm Australian recording-consent + Telecommunications Act 1997 implications for posting call recordings publicly.]**

## Phase 2 — Within first 30 days post-launch

### 2.1 Free Digital Health Check (lead-magnet)

**What it is:** A web form (5–8 questions about the prospect's business) that generates a personalised 2–3 page AI automation opportunity report. Free per the "Special: $149" / "Normal: $800" framing in the SEA plan [1, §11.3].

**What it proves:** The Discovery / Readiness Assessment offering — the upstream funnel that scopes Growth and Enterprise tier engagements.

**Build path:**
- Form on `goodai.au/health-check` capturing: industry, staff count, current phone/booking workflow, current admin pain, revenue band, email
- n8n workflow: form submission → LLM call (Claude or GPT) with a system prompt that runs the Good AI assessment framework against the inputs → formats a Markdown report → emails the prospect + drops a lead row in the CRM
- Report is sent within 5 minutes; thank-you page surfaces the "call the demo line" CTA while they wait

**Build effort:** 2–4 days. **Dependencies:** CRM committed [NEEDS KEV], LLM API key + budget, n8n instance live.

### 2.2 Interactive ROI calculator

**What it is:** A sliders-and-fields interactive widget. User inputs: staff count, hours/week on phones, missed calls/week, average job value. Output: "you could save $X/year, ROI in Y months at our [tier] level" with assumptions shown openly.

**What it proves:** Cash Flow Acceleration product logic, plus general value-articulation Good AI does in advisory.

**Build effort:** 1–2 days. Pure JS or small React component; could be enhanced with an LLM-generated personalised paragraph beneath the number.

**Tightening:** Show the math openly. Perth SMEs are sceptical of black-box "you could save $XXX!" claims — transparency converts.

## Phase 3 — First 90 days

### 3.1 Per-vertical landing pages with dynamic content

**What it is:** Visitors arriving from a vertical-specific Google Ad land on a page tailored to their vertical. Headlines, examples, case-study spotlights, ROI defaults adjust to the inferred vertical.

**What it proves:** Customisation at scale, intelligent routing.

**Build effort:** 1 week (route table + LLM-driven copy variants + caching).

### 3.2 AI-summarised case studies (chat-with-the-case-study)

**What it is:** On each case study page, a "Ask anything about this case study" widget. The widget has the full case study + the underlying problem in context.

**What it proves:** Same Knowledge Bot offering, applied to a specific document — exactly what Growth-tier clients buy for their own knowledge bases.

**Build effort:** 1–2 days (reuses the Phase 1 chat widget with scoped context).

### 3.3 Existing-customer self-serve

**What it is:** Same chat widget, recognises authenticated customers, can handle common config-change requests in-bot (FAQ updates, voice tweaks, new routing rules). Falls back to S3/S4 ticket creation if the change is outside scope.

**What it proves:** Operations leverage — every config change auto-served is a Friday-batch task removed from [[wiki/operations/support-incident-runbook|the S4 queue]].

**Build effort:** 3–5 days (auth + scope guards + ticket creation).

## Build sequence (4-week sprint to public launch)

| Week | Deliverable | Owner | Dependencies |
|---|---|---|---|
| Week 1 | Chat widget live with FAQ + product catalogue (Phase 1.1) | Founder | Knowledge base content drafted; chat tool chosen |
| Week 1 | Demo-call CTAs everywhere (Phase 1.2) | Founder | Trivial; ship Day 1 |
| Week 2 | Call recording examples + transcripts (Phase 1.3) | Founder | Recording consent in place |
| Week 2 | Privacy + ToS + tracking compliance review | Lawyer | [[wiki/legal/privacy-policy-draft]] + [[wiki/legal/terms-of-service-draft]] |
| Week 3 | Public launch — Phase 1 complete | — | All Phase 1 items live + tested |
| Week 4 | Digital Health Check (Phase 2.1) builds in parallel | Founder | Site live, traffic capture working |

**Hard rule:** do not push public-launch traffic to the site until Phase 1 (all three items) is live. Cold prospects landing on AI marketing with no live AI = wasted ad spend + brand damage in a small market.

## What this playbook IS NOT

- It is not the brand identity / visual design spec. That's a separate doc (Tier 1 launch-blocker still queued).
- It is not the site IA / wireframe. The site exists ☑ — this playbook adds AI to it, doesn't redesign it.
- It is not the SEO strategy. That sits under marketing (separate cluster).

## Sources

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]] — SEA plan, tier and pricing context
- [2] [[wiki/entities/trillet-ai]] — Trillet capabilities (messaging channels, integrations)
- [3] [[wiki/concepts/voice-operating-layer]] — capability model the demo line evidences
- [4] [[wiki/good-ai]] — the full 10-product / 3-tier catalogue the site catalogues

## [NEEDS KEV]

- Trillet web chat widget support — yes/no? (Determines Phase 1.1 build path)
- CRM committed (HubSpot vs GHL vs other) — required for Phase 2.1 lead capture
- Call-recording consent / Telecommunications Act 1997 publication implications (Phase 1.3)
- n8n instance live and accessible for Phase 2.1 health-check workflow
- LLM API budget for the health-check generator (rough monthly estimate, given expected traffic)
