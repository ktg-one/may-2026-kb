---
title: "Kismet Strategic Meeting — Wednesday 13 May AM Prep"
date: 2026-05-12 (night-before prep)
purpose: Tight brief so Kev can walk in awake. Read in 5 minutes.
status: night-before triage — Kev exhausted, hasn't eaten
authored_by: Claude
tags: [kismet, strategic-meeting, prep, may2026]
---

# Kismet Strategic Meeting — 5-Minute Brief

## Position to walk in with

> "I've delivered six months of work post the November invoice. The July 1 compliance cliff is 45 days out. We need to make three decisions today: what gets billed, what ships before July 1, and which architectural path we're committing to."

That's the frame. Don't apologise for the scope. Don't open with technical detail. Open with the calendar pressure.

---

## The five threads that are actually on the table

### 1. UNBILLED WORK — The number you need at hand

Since the November 2025 invoice (GAI-KIS-2025-FINAL totalled $11,500 — Phases I-IV setup), you've delivered:

- **10 n8n workflows** (8 active, 1 archived, 1 staged DocuSign)
- **6 Notion databases**, 80+ properties on Master Pipeline, 7+ filtered views
- **9 system integrations** (Fillout, GCal, GDrive, DocuSign, Obsidian, Twilio, AppSheet, AI lead analysis, error logging)
- **11 documentation deliverables**, 1,500+ lines of operational documentation
- **10 strategic consulting work items** (Business OS, compliance framework, voice agent strategy, team scaling, channel feasibility)
- **7 recent Apr–May 2026 items** (team profiles with live data, HR setup, DQ Tracker Bot, monthly aggregation, branding, end-to-end workflow script, sales feasibility report)

**The deliverables map you wrote on 9 May is the invoice scaffold.** It's saved at `KISMET-Deliverables-Map-May2026.md` and it's invoice-ready. You haven't invoiced it because you haven't decided whether to bill in tiers or bundle.

**Conservative ballpark unbilled value at SG/AU consultant rates** (not for the conversation tomorrow unless asked, but be ready):
- Automation engineering (10 workflows): ~$15-25K
- Notion architecture (6 DBs + dashboard + team hub): ~$12-18K
- Integration engineering (9 integrations): ~$8-12K
- Documentation (1,500+ lines): ~$8-12K
- Strategic consulting (10 work items): ~$20-35K
- Recent Apr-May work: ~$8-12K
- **Total unbilled exposure: ~$70-115K AUD**

**Strategic call to make tomorrow:** Does the unbilled work surface now (as part of "let's true up before next phase") or in a separate invoicing conversation? My read — surface the *scope* now ("here's what's been delivered"), defer the *number* to a follow-up. Don't let "what do you owe me" derail a strategic conversation.

---

### 2. THE 1 JULY 2026 COMPLIANCE CLIFF — 45 days out

Three regulatory deadlines land simultaneously:

| Regulation | What it demands | Kismet system that covers it |
|---|---|---|
| **WA PRIS Act 2024** | Onshore data (AWS Australia), interaction logging with hash-immutable audit trail, supply-chain liability | Notion + n8n covers logging, but **storage jurisdiction needs verifying** |
| **APRA CPS 230** | Operational resilience, BCP logs, vendor risk audits | n8n error log workflow covers it — proof exists |
| **AUSTRAC Tranche 2** | KYC/CDD lead capture with immutable lineage, who/where/when | n8n captures raw lead → SHA256 → Notion. Covered if telephony signature verification is on. |

Plus two more on the horizon:
- **1 Jan 2027** — Mandatory Information Breach Scheme
- **10 Dec 2026** — Privacy Act AI Disclosure laws

**What to surface tomorrow:**
- "We have 45 days to lock down PRIS Act + APRA + AUSTRAC compliance. Most of this is already in your stack — I want to walk through the verification list."
- Specifically check: (a) is your Notion data hosted onshore in Australia? (b) is the JustCall SHA256 signature verification actually enabled? (c) where does the Google Drive Vault sit (region)?

**Risk if these aren't sorted by 1 July:** Kismet is a contracted service provider directly liable under PRIS Act supply-chain liability. Not theoretical — Kismet would carry the breach cost.

---

### 3. THE ARCHITECTURAL FORK — Notion+n8n vs Airtable+Make

NotebookLM caught this and flagged it as "severe contradiction." Two blueprints exist in their knowledge base:
- **"Custom OS"** (Airtable + Make.com) — the proposed model in some of their strategic docs
- **"Phase 2 Execution"** (Notion + n8n) — what's actually built and running today

**You've been building on Notion + n8n for six months.** Their docs still reference Airtable in places. Someone on their side may still think Airtable is the target.

**What to surface tomorrow:**
- "I want to confirm we're aligned: Notion + n8n is the production stack. The Airtable/Make.com material in some of your strategic docs should either be archived or labelled as a deprecated proposal. Otherwise this becomes a confusion point with anyone new joining your side."

**Don't relitigate the choice.** Notion + n8n is what's running, what's invested in, and what's compliance-ready for July 1. Just close the ambiguity.

---

### 4. WHAT'S ON HOLD AND WHY

Three line items in the deliverables map are flagged HOLD with yellow highlighting:
- **Tier 1 Website Bot** (WordPress, 24/7 lead qual, AFSL guardrails) — HOLD
- **Tier 2 Knowledge Bot** (Llama 400B, Notion-trained, internal team access) — HOLD
- **Voice Agent System** (Gemini 4o + Trellit.ai) — flagged DELIVERED in one section, HOLD in another (contradiction in your own doc)
- **Documentation & Knowledge Base** category — HOLD

**What to surface tomorrow:**
- "What's the blocker on Tier 1 + Tier 2 bots? They've been on hold since [date]. Is it budget, scope clarity, or priority?"
- "Voice Agent — is it actually delivered or actually on hold? Your doc has it both ways."
- These are revenue waiting to ship. If they un-hold, that's billable Phase III work.

---

### 5. THE AI-READINESS PARTNERSHIP MODEL — Is it on or off?

Your sales-feasibility report modelled Kismet as a Good AI distribution channel:
- AI-Readiness Assessments: $2K-10K per client (avg $5K), Kismet retains 60-100%
- Implementation referral margin: 17.5% on builds + retainers paid to Good AI
- Average LTV per Kismet-referred AI client: **$14,080**
- Year 1 modelled across 28 clients: **$158,947 to Kismet** ($140K direct + $19K referral margin)

**What to surface tomorrow:**
- "Where are we on the AI-Readiness channel model? The numbers point to ~$159K in Kismet's pocket Year 1 if we activate it. What's gating that — pricing, positioning, lack of pilot clients?"
- This is the *upside* conversation. Use it as the optimistic frame after the compliance + architecture clarity is locked.

---

## Three sharp questions you should be ready to ask them

1. **"What does success look like at this meeting from your side?"** — Forces them to name their agenda. Stops you guessing.
2. **"What's your single biggest concern going into 1 July?"** — Surfaces their actual compliance pain. Probably not what you'd guess.
3. **"If we ran the AI-Readiness channel in Q3, how many pilot clients could you put through it?"** — Tests whether the $159K Year 1 number is real or aspirational on their side.

---

## What you DON'T need to bring tomorrow

- Detailed technical walkthroughs of any of the 10 n8n workflows — they don't care
- The full deliverables map printout — reference it, don't read from it
- The exact unbilled $ number — keep that to "I'll send a true-up next week" if asked
- Architecture diagrams — only if asked
- Tomorrow's meeting is strategic, not technical. Drive at decisions, not specs.

---

## If only one thing gets done in the meeting

**Get them to commit a date for the July 1 compliance verification walkthrough.** Everything else can slip. That one cannot.

---

## Files to have open (or in your tabs)

- `clients/kismet-finance/KISMET-Deliverables-Map-May2026.md` — what's been done
- `clients/kismet-finance/notebooklm-extract-2026-05-12.md` — strategic blueprint + compliance + grants
- `clients/kismet-finance/2026 Contract/Kismet Commercial Quote.pdf` — original commercial structure
- This file

---

## Personal note (not for the meeting)

It's 10pm and you haven't eaten. You're orchestrating three AIs and have AP Tech on Friday. The Kismet meeting is a known relationship with a clear scope of unbilled value — they're not going to fire you tomorrow. Eat. Sleep. The brief above is enough to walk in awake. Anything more granular we can do at 7am.
