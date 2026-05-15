# AP Technologies — Project Quote Summary
## Kev Tan | May 2026

---

## Two Projects

Charles, here's both projects side by side so you can see the full picture.

---

## Project 1: Supplier Chatbot

**What it is:** An AI chatbot that lives in Teams. Your team @mentions it to get answers about suppliers — PO status, spec lookups, delivery tracking, quality history. It can also draft supplier emails for human review before sending.

**Connects to:** Teams, SharePoint (supplier docs), Outlook (email history), your ERP (TBD — need to assess), QMS

| Phase | What You Get | Timeline | Price |
|---|---|---|---|
| Phase 1 — MVP | Chatbot in Teams: doc search, email lookup, basic ERP queries. 3-5 users. | 4-6 weeks | S$25,000-35,000 |
| Phase 2 — Full | Deep ERP + QMS integration, proactive alerts, Power BI dashboard, all-site rollout | 6-8 weeks | S$40,000-55,000 |
| Phase 3 — Advanced | Supplier portal, multi-language, automated POs | 4-6 weeks | S$30,000-40,000 |

**Ongoing:** S$2,000-3,000/month (maintenance + hosting + AI costs)

---

## Project 2: Email Leakage Scanner

**What it is:** Scans all company email for sensitive data leakage — your proprietary IP (extrusion parameters, formulations, customer pricing), not just generic PII. Alerts security leads on High/Critical flags. Dashboard for trends and patterns.

**Note:** I'd also configure Microsoft Purview (which you likely already have) for standard DLP at no extra charge. The custom build handles AP Tech-specific IP that Purview can't detect.

**Connects to:** Exchange Online (via Graph API), Teams (alerts), SharePoint/Power BI (dashboard)

| Phase | What You Get | Timeline | Price |
|---|---|---|---|
| Phase 1 — Core | Email scanning pipeline, AP Tech IP classification, alerting, basic dashboard | 5-7 weeks | S$30,000-40,000 |
| Phase 2 — Intelligence | Pattern analysis, trend dashboards, cross-border jurisdictional rules | 4-6 weeks | S$35,000-45,000 |
| Phase 3 — Enforcement | Purview integration, automated holds, compliance reporting | 3-4 weeks | S$20,000-30,000 |

**Ongoing:** S$2,500-3,500/month (maintenance + AI API costs + hosting)

---

## Combined View

| | Supplier Chatbot | Email Scanner | Both Projects |
|---|---|---|---|
| **Phase 1 only** | S$25-35K | S$30-40K | **S$50-68K** |
| **All 3 phases** | S$95-130K | S$85-115K | **S$162-220K** |
| **Year 1 ongoing** | ~S$30-42K | ~S$36-48K | ~S$60-80K |
| **Year 1 total (all phases)** | S$125-172K | S$121-163K | **S$222-300K** |

### Bundle: Both Projects Together

If you do both projects, I'd discount 10% on the build costs (not ongoing — those are real costs). Both projects share the same n8n infrastructure and some of the same Microsoft integrations, so there's genuine overlap I can pass back.

| Scenario | Build Cost | Discount | You Pay |
|---|---|---|---|
| Both Phase 1s | S$55-75K | 10% | **S$50-68K** |
| Both all phases | S$180-245K | 10% | **S$162-220K** |

---

## Suggested Starting Point

Start with **both Phase 1s running in parallel** — I can work on them concurrently since they use different data sources. 6-7 weeks, S$50-68K. You get a working supplier bot AND an email scanner live in production before deciding on Phase 2.

---

## What's Included
- All design, build, testing, and deployment
- 2 weeks of post-launch support per phase (bug fixes, tuning)
- Documentation and runbooks
- Training for your designated users/admins
- All source code and configurations — it's yours, no lock-in

## What's Not Included
- Microsoft licensing (M365, Agent 365, Copilot) — you handle this with Microsoft directly
- Legal review of privacy policies for the email scanner — I'll outline what's needed, your lawyers sign off
- ERP vendor costs if custom API access is required
- Hardware or infrastructure beyond Azure hosting for n8n

## Payment Terms
- 50% at phase kickoff
- 50% on delivery and acceptance
- Each phase is independent — you can stop after any phase
- No long-term contract required for ongoing maintenance (month-to-month)

---

## Next Step

I need one thing to sharpen these numbers: **what ERP system do you run?** That determines whether the supplier chatbot Phase 1 is S$25K or S$35K. Everything else I can scope from here.

Happy to jump on a call this week to walk through it.

— Kev
kevin.pl.tan@gmail.com
