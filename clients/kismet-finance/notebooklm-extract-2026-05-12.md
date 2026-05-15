---
title: NotebookLM Extract — Kismet / WA SME Agentic AI Blueprint
date: 2026-05-12
source_notebook_url: https://notebooklm.google.com/notebook/aea232d3-fc4b-4f83-a18e-4aa76dd4c154?authuser=1
source_notebook_id: sme-agentic-ai-strategy-2026-(perth/wa-+-kismet)
purpose: Working dump of NotebookLM Q&A for coworker to draft Kismet ops / agentic-tech docs against. Each section = one query. Citation numbers preserved from source.
status: complete (5 queries, one section partially truncated — see Section 4 note)
---

# NotebookLM Extract — Kismet Finance / WA SME Agentic AI

> Each section is the verbatim answer NotebookLM returned for the question shown.
> Citation markers (numbers, `more_horiz`) are preserved — they reference sources inside the notebook.
> Do not treat this as final copy — it is raw research for drafting.

---

## 1. Hub-and-spoke architecture — source-of-truth, interop, named automations

**Question:** Describe the Kismet Finance Group hub-and-spoke architecture in detail. Specifically: which system holds the source of truth for each data domain (leads, deals, documents, communications, tasks)? How do Airtable, Notion, Make.com, and n8n interoperate? List the named automations or workflows. What are the integration points with external systems (Twilio, Google Calendar, email, e-signature)? Provide exact data flow direction between systems where the sources describe it.

**Answer:**

The architectural documentation for Kismet Finance Group contains a severe contradiction that presents a critical execution risk. The sources do not describe a single, unified stack utilizing Airtable, Notion, Make.com, and n8n simultaneously. Instead, they outline two mutually exclusive technical blueprints: the proposed "Custom OS" (Airtable + Make.com) and the active "Phase 2 Execution" stack (Notion + n8n) [1, more_horiz].

Attempting to run all four platforms together will fragment data and cause compliance failures.

### Source of Truth by Data Domain
Depending on which stack Kismet deploys, the system of record diverges:
- **Leads, Clients, and Deals:** Stored in **Airtable** (under the "Custom OS" proposal) [4] or **Notion** (under the "Phase 2 Execution" model) [3]. In Notion, data is mapped across "People" (atomic human records), "Households," "Entities" (SMSF/Trusts), and "Deals" [3, 5].
- **Documents:** **Google Drive ("The Vault")** holds the absolute source of truth for WORM-compliant storage (SEC Rule 17a-4(f) and WA PRIS Act) [3, 6].
- **Communications & Compliance Tasks:** Stored in Airtable's "Interactions" table [4] or synced directly to specific client pages in Notion [7].

### Interoperation and External Data Flows
The orchestration layers (Make.com or n8n) act as the central nervous system, connecting database interfaces to external APIs [2, more_horiz].

- **Telephony (Twilio via Make.com):** Webhook receives missed-call payload → Make.com queries Airtable to deduplicate → Make.com writes new/updated record to Airtable → Make.com triggers Twilio API to dispatch SMS using an **ACMA-compliant registered Sender ID** [8, 9].
- **Telephony & AI (JustCall via n8n):** JustCall finishes a call → fires webhook to n8n → n8n validates **SHA256 signature** → n8n deduplicates and matches phone number in Notion → n8n waits for a final summary webhook → n8n pushes the AI-generated call transcription and summary into the Notion page [10, 11].
- **E-Signature (DocuSign via n8n):** Rep clicks "Send Authority" in UI → DocuSign dispatches envelope. Once signed, PDF flows automatically into Google Drive, and n8n updates Notion status to `Completed` [12].
- **Google Calendar & Email:** Upon lead qualification in Phase 1 Intake, an automation syncs the discovery meeting directly to G-Cal [13]. In Phase 4, once a deal is approved, an automation triggers the **Send Onboarding Email** workflow [14].

### Named Automations and Workflows
- **Inbound Lead Processing / "Rep-Proof" Lead Velocity Engine:** Captures inbound leads or missed calls, routes them based on logic (e.g., super balance > $200k), logs compliance, triggers immediate SMS text-back [8, more_horiz].
- **Lead Capture (Workflow 1):** Routes Google Form field data into n8n, which parses messy addresses, generates Notion records, and triggers Slack alerts [18, 19].
- **"No Ghost" Protocol (Workflow 2):** Daily n8n cron job polls Notion at 02:00 AM for incomplete client records. Aggregates missing data into a report and sends Slack alert tagging responsible reps [5, more_horiz].
- **Call Sync (Workflow 3):** Synchronizes JustCall telephony data and AI transcriptions into Notion [10, 11].
- **The Document Pipeline:** Automates folder creation in Google Drive and bidirectional sync with DocuSign [12].

### Notebook self-check
> Confidence Assessment: High on mechanics of individual workflows and integrations. Low on current operational reality due to conflicting blueprints in the knowledge base.
> Self-Check: Treating Airtable, Notion, Make.com, and n8n as a single interoperating ecosystem is an architectural fallacy. The sources pit them as either/or choices (Branch 3 Custom OS vs Phase 2 Execution Manual).
> Next Step: Which architectural path has Kismet officially authorized for production: Airtable/Make.com "Custom OS" or Notion/n8n "Phase 2 Execution"?

---

## 2. "Rep-proof" lead routing and document chasing — triggers, rules, escalation, chase cadence

**Question:** Detail the rep-proof lead routing and document chasing automations. (a) Triggers and immediate client action. (b) Routing rules + SLA timer. (c) Escalation logic if rep doesn't respond. (d) Document chasing: tracked docs, cadence, compliance log. Include named statuses, fields, workflow IDs.

**Answer:**

### A) Triggers and Immediate Client Actions
Inbound leads triggered by **Google Form submissions, website bots, or missed calls** detected via a telephony webhook [1, more_horiz]. On a missed call during business hours, the system first checks whether the caller is an existing client; if new, it instantly dispatches an SMS using an **ACMA-compliant alphanumeric Sender ID like "Kismet"** [3, 4].

Automated text variants:
- `"Hi [Name], Josh from Kismet here. I saw you're interested in [Vertical]. Do you have 5 minutes to chat?"` [4]
- `"Hi! We saw we missed your call. We're in a meeting but free in 10 minutes. Is this urgent? Reply YES for callback ASAP or tell us what you need."` [3]
- After-hours: `"Thanks for calling! We're closed but will call you first thing tomorrow at 9am. Need urgent help? Visit [emergency link]."` [3]

### B) Routing Rules and SLA Timers
Make.com or n8n evaluates new leads against conditional logic [1]:
- **VIP Lead:** Super Balance > $200,000 AND Housing Status = "Homeowner" → tagged "VIP Lead" → routed directly to the **"Senior Broker"** view in Airtable [1].
- **Standard Lead:** Anything else → tagged "Standard Lead" → routed to a **Round Robin** queue [1].

The system operates on a **"5-Minute Rule" for speed-to-lead** [5]. On capture, a **P1 alert** is sent to the assigned sales rep via Google Chat or Slack, enforcing an **SLA timer mandating follow-up within 10 minutes** [3, 6].

### C) Escalation Logic
If a rep completes a meeting (marks "SAT" — Appointment Completed) but leaves notes empty, the **"Ghost Ban" escalation ladder** triggers [7]:
- **Level 1 (2 hours):** Auto-ping to rep — `"Missing notes for [Client]"` [8].
- **Level 2 (next morning):** Escalate to manager — `"KPI Impacted"` event [8].

In parallel, **"Workflow 2" — the "No Ghost" protocol** — runs an **n8n cron job polling Notion at 02:00 AM daily** [2, 9]. Incomplete client records are aggregated into a Slack report sent to managers, explicitly tagging the responsible reps [2, 9].

### D) Document Chasing and Compliance Logging
The **"T3 Multi-Tool Agent System" (Stage 3)** fully automates document collection via a smart interactive checklist sent to clients [10, more_horiz].

- **Documents Tracked:** Google Drive folders auto-created for `/Contracts`, `/ID`, `/Financials` [8].
- **Chase Cadence:** Agent automatically follows up to chase missing documents [10, 11]. **Exact intervals and total chase attempts NOT specified in sources.**
- **Compliance Logging (ASIC):** Auto-logs referral and commission disclosure for every transaction [10, 11].
- **Compliance Logging (WA PRIS Act / data sovereignty):** Every interaction recorded in the **Interactions table** (or Notion equivalent) [1, 13]. Log captures **Interaction Type (SMS/Call/Email), Timestamp, User ID, Content Hash** for an immutable audit trail [13, 14].

### Named Statuses and Workflows
- Once a requested document (e.g. DocuSign authority form) is signed → PDF saved to Google Drive → Notion record status updated to `Completed` [8, 15].
- Mapped deal stages: `WARM LEAD / CALLBACK`, `DNQ / NOT INTERESTED`, `DISCOVERY`, `REFER TO BROKER / ACCOUNTANT`, `SALE` [16, 17].

> **Gap flagged by NotebookLM:** chase intervals + total attempts are not in the source material — coworker will need to define these explicitly when drafting the SOP.

---

## 3. WA PRIS Act + APRA + ASIC + AUSTRAC + Privacy Act compliance — operational mapping

**Question:** Specify in full operational detail what WA PRIS Act and APRA compliance demands of Kismet's systems. For each obligation: (a) logged events/data, (b) retention + storage standard (WORM, encryption, jurisdiction), (c) audit trail fields, (d) liability + penalties, (e) which Kismet system satisfies it, (f) deadlines.

**Answer:**

### 1. WA PRIS Act 2024 (Data Sovereignty & Privacy)
- **(a) Logged events:** Every interaction handling sensitive personal and financial data must log **who accessed client data and when** [3].
- **(b) Storage:** Data must remain **onshore** — sovereign-hosted infrastructure (e.g. **AWS Australia in Sydney/Melbourne**) per public sector supply chain sovereignty principles [4, more_horiz].
- **(c) Audit fields:** `Interaction Type (SMS/Call/Email)`, `Timestamp`, `Content Hash` (proves immutability), `User ID` [7].
- **(d) Liability:** Supply-chain liability — as a contracted service provider handling data, **Kismet is directly liable** for compliance and breaches [1].
- **(e) Kismet system:** **Airtable "Interactions" table** acts as the compliant logging layer [7]. n8n "No Ghost" protocol polices the database for rapid breach reporting [8, 9].
- **(f) Deadlines:** **Mandatory compliance commences 1 July 2026** [1, 9]. **Mandatory Information Breach Scheme commences 1 January 2027** [10].

### 2. APRA CPS 230 (Operational Resilience)
- **(a) Logged events:** System stability events, API failures, vendor contract audits (to preserve APRA's audit rights) [9].
- **(b) Storage:** Business Continuity Planning (BCP) logs and proof of system resilience [9].
- **(c) Audit fields:** Execution timeouts, workflow crash reports, system recovery events [9].
- **(d) Liability:** Non-SFIs liable for operational risk management failures and third-party vendor risks [9].
- **(e) Kismet system:** **n8n native error triggers + Slack Retry APIs** — provides BCP proof that system will not crash silently [9].
- **(f) Deadline:** **Effective 1 July 2026** [9].

### 3. AUSTRAC Tranche 2 (AML/CTF)
- **(a) Logged events:** Capture of **all inbound leads** to support KYC and CDD procedures [9].
- **(b) Storage:** "Perfect, immutable lineage" for every lead [9].
- **(c) Audit fields:** **Who, where, when** a lead was captured [9].
- **(d) Liability:** AML/CTF laws [9].
- **(e) Kismet system:** n8n captures raw lead data → SHA256 signature verification (telephony) → writes immutable records to Notion/Airtable [8, 11].
- **(f) Deadline:** **Effective 1 July 2026** [9].

### 4. ASIC + Corporations Act (Referral Disclosures)
- **(a) Logged events:** Every referral benefit / commission earned by Kismet logged and disclosed [12, 13].
- **(b) Storage:** **WORM-compliant** (Write Once, Read Many), adapted from **SEC Rule 17a-4(f)** — non-erasable archive [14, 15].
- **(c) Audit fields:** Delivery of **Financial Services Guide (FSG)** or equivalent disclosure to client [12].
- **(d) Liability:** Failure to disclose commissions violates ASIC regulations and Corporations Act [12].
- **(e) Kismet system:** **T3 Multi-Tool Agent** logs referral and commission disclosure upon deal handover [16]. **Google Drive Vault (Google Workspace Enterprise Plus)** satisfies WORM [14, 15].
- **(f) Deadline:** Currently active standard operation.

### 5. Privacy Act 1988 (Cth) Reforms — AI Transparency
- **(a) Logged events:** Client consent acknowledging automated processing + AI call transcription [9].
- **(b) Storage:** Standard secure storage [9].
- **(c) Audit fields:** Checkbox/consent timestamps from intake forms [9].
- **(d) Liability:** Federal reforms remove the small business exemption — full **Australian Privacy Principles (APP) penalties** + new **statutory tort for serious privacy invasions** [2, more_horiz].
- **(e) Kismet system:** **Google Forms disclaimers** in Phase 1 Intake stating AI usage [9].
- **(f) Deadline:** **Mandatory AI Disclosure laws effective 10 December 2026** [9].

> **Gap flagged by NotebookLM:** statutory retention durations (e.g. 7 vs 10 years) and maximum financial penalties are NOT in sources — verify with external counsel.

---

## 4. 2026 Agentic AI orchestration frameworks — comparison

**Question:** Compare MCP, LangGraph, n8n, Claude Code, Gemini CLI, Ruflo, OpenHarness. For each: what it is + problem solved, architectural model, ideal SME use cases, strengths/weaknesses, stack position, adoption guidance.

**Answer:**

> ⚠️ **Transit truncation:** Sections 1–3 (MCP, LangGraph, n8n) were truncated when streaming this answer. The notebook itself contains these — pull them directly from the source notebook when drafting the framework comparison. Sections 4–7 captured in full below.

### 4. Claude Code
- **What/problem:** Terminal-based AI agent acting as a "structured engineer" — multi-file software implementation and review [32, more_horiz].
- **Architecture:** Terminal CLI agent operating in developer's environment via Anthropic's APIs [35, 36].
- **SME use case:** Final production-ready features, strict stylistic consistency, autonomously building n8n workflows via MCP [33, 37].
- **Strengths:** Highest SWE-bench score (**80.8%**), excels at repository-level reasoning [33].
- **Weaknesses:** High API cost ($200/mo max sub), smaller context (200k tokens) vs Gemini [33, 34].
- **Stack position:** Developer / Execution layer — acts as the "CTO". Competes directly with Gemini CLI [25, 34, 38].
- **Adoption guidance:** Use for final implementation of production features where reasoning depth + security are non-negotiable [34].

### 5. Gemini CLI
- **What/problem:** Open-source terminal agent solving context-window limit for deep codebase analysis and cost barriers [33, 39].
- **Architecture:** Terminal CLI agent with strictly enforced, read-only **"Plan Mode"** [40, more_horiz].
- **SME use case:** Exploring massive legacy codebases, processing 500-page enterprise docs, safe read-only research [33, 41].
- **Strengths:** **1M-token context**, generous free tier (**1,000 requests/day**), Plan Mode prevents accidental overwrites [33, more_horiz].
- **Weaknesses:** Slightly lower reasoning accuracy (80.6% SWE-bench), more step-by-step default philosophy outside Plan Mode [34].
- **Stack position:** Developer / Execution layer — competes with Claude Code [25, 34].
- **Adoption guidance:** Starting point for rapid prototyping, large-scale analysis, budget-conscious solo developers [33].

### 6. Ruflo (Claude Flow)
- **What/problem:** Turns Claude Code into a distributed multi-agent orchestrator, solving token expense + single-thread limits [35, more_horiz].
- **Architecture:** **"Hive-mind" swarm** — Queens (decision-makers) + Workers (executors), sub-millisecond **HNSW persistent vector memory**, neural routing [45, more_horiz].
- **SME use case:** Automated TDD via **SPARC workflow**, complex full-stack app generation, cross-machine agent federation [48, more_horiz].
- **Strengths:** Pushes SWE-bench to **84.8%**, cuts API costs **75–80%** via intelligent task routing, cross-day context [44, 47].
- **Weaknesses:** Extreme complexity, fragmented docs, alpha-stage stability (v3.5/3.6) [51].
- **Stack position:** Swarm Orchestrator wrapper. Sits on top of Claude Code + local LLMs. Competes with Microsoft AutoGen, CrewAI [35, more_horiz].
- **Adoption guidance:** Only if team already uses Claude Code daily and needs parallel-processing swarm without learning a heavy Python framework [49].

### 7. OpenHarness
- **What/problem:** Solves failure of long-running agents (context drift, crashes) via lightweight infra "harness" [54, 55].
- **Architecture:** Python-based **Agent Harness pattern** — bounded short-lived sessions with fresh model context, shared state handoff via filesystem [54, more_horiz].
- **SME use case:** Personal assistants (e.g. "ohmo") across multi-day Slack sessions, automated AgentOps evaluations from MLflow production traces [56, more_horiz].
- **Strengths:** Safe retries, crash recovery, auto-compaction of memory to preserve state without context bloat [54, 59].
- **Weaknesses:** Highly developer-centric (TUI/CLI focus), experimental status [55, more_horiz].
- **Stack position:** Agent Scaffolding layer — wraps LLMs (Claude/Codex), interfaces with MCP servers [55, more_horiz].
- **Adoption guidance:** Adopt for autonomous evaluation suites or systems needing multi-day workflow survival where standard agents fail to context degradation [54, 61].

> **NotebookLM self-check:** "Avoid recommending a one-size-fits-all stack. Running Ruflo + LangGraph + OpenHarness simultaneously creates immense orchestration debt — they represent divergent architectural paths (Swarm vs Graph vs Session-Harness)."
> **Picker question from notebook:** "Lean technical team → Gemini + n8n path. Enterprise-grade agentic platform needing auditable execution → LangGraph + MCP Gateway."

---

## 5. WA government grants + federal funding — strategy, eligibility, stacking

**Question:** Detail WA government grants and funding strategy for SMEs adopting agentic AI in 2026. For each named program: dollar amount/rebate %, eligibility, eligible expenses, application/timing, reporting obligations, common failure modes. Stacking rules + federal/state interplay.

**Answer:**

> Strategic frame from notebook: 2026 funding ecosystem co-invests in **capability building, technical uncertainty, and commercialisation** — not standard software. Misaligning project maturity with the wrong grant or violating stacking rules causes immediate rejection.

### 1. Federal R&D Tax Incentive — bespoke agentic builds
- **Value:** **43.5% refundable tax offset** for SMEs [1, 2].
- **Eligibility:** Aggregated turnover **< $20M** [2]. Minimum **$20,000** eligible R&D spend [3].
- **Eligible expenses:** Apportioned internal salaries, contractor costs, consumables, R&D equipment depreciation [4]. **Excluded:** Routine API integrations, commercial production, market research [4].
- **Application/timing:** Annual cycle. Activities must be registered with **AusIndustry within 10 months of income year end** [3, 5].
- **Obligations:** AusIndustry + ATO compliance reviews [6].
- **Failure mode — "Invoice Date Trap":** ATO rejects claims where expenditure is not incurred in the correct income year. **Align invoice dates (obligation arises), not payment dates, to the financial year** [6].

### 2. WA Innovation Booster Grant (IBG) — MVP + validation
- **Value:** Up to **$50,000 per application**. Cash co-contribution: **15%** regional/female/First Nations founders; **20%** others [7, 8].
- **Eligibility:** **1–20 employees, WA registered (ABN/ACN), solvent, total project budget < $100K, previous capital raised < $5M, pre-revenue project** [9, 10].
- **Eligible expenses:** External specialist consultancy, R&D testing, MVP product development, IP protection [11, 12]. **Excluded:** Hardware/software for standard ops, internal staff costs, "business as usual" website development [13].
- **Application/timing:** **Opens 10 March 2026; closes 30 March 2026 at 4:00pm AWST** [14]. **50% advanced on execution of Financial Assistance Agreement; 50% reimbursed on completion** [15].
- **Obligations:** Post-completion acquittal report + expenditure summary + evaluation surveys for up to 3 years [16, 17]. Possible independent audit [8].
- **Failure mode:** Attempting to fund internal staff salaries or standard SaaS subscriptions instead of external independent capabilities [13, 18].

### 3. Industry Growth Program (IGP) — federal scale-up capital
- **Value:**
  - Early-Stage: **$50K–$250K**
  - Commercialisation & Growth: **$100K–$5M**
  - Requires **50% matched funding** [19, 20].
- **Eligibility:** Turnover < $20M, incorporated entity, aligned with **National Reconstruction Fund (NRF)** priorities (enabling capabilities, medtech). Must first complete the **IGP Advisory Service** [21, 24].
- **Eligible expenses:** Project-specific salaries, technical contractor fees, equipment directly used in commercialisation [25].
- **Application/timing:** Rolling intakes [26]. Advisory phase **2–4 weeks**; formal assessment **6–9 months** [27, 28]. **10% retention** on final report [29].
- **Failure mode:** Misjudging Technology Readiness Level (TRL) or lacking financial evidence for 50% co-investment [30].

### 4. ASBAS Digital Solutions Round 3 — federal risk mitigation
- **Value:** Subsidised advisory; **$110 out-of-pocket for up to 5 hours of 1-on-1 mentoring** [31, 32]. Free workshops available [31, 33].
- **Eligibility:** Trading small business, **≤ 19 employees**, active ABN [34].
- **Eligible expenses:** Direct consulting time on AI, software use, cybersecurity [35]. **NOT for cash or software purchases.**
- **Application/timing:** Immediate access via approved service providers [31, 36].

### Stacking rules + federal/state interplay
- **IGP Stacking Trap:** **Strictly prohibited** from using state grants (e.g. WA IBG) to fulfil the federal IGP's 50% matched funding. Acceptable matched capital must come from **private equity, revenue, or loans** [37].
- **CVSP Combination:** Trades-based SMEs can stack the **WA Construction Visa Subsidy Program** (up to $10,000 for recruitment/settlement of skilled migrants) [38] alongside federal grants like IGP, since they target **separate expenditures** (talent acquisition vs technology implementation) [39].

> **NotebookLM self-check / risk flag:** The knowledge base lists the **WA Local Capability Fund (Digital Transformation Round)** at $25K–$50K [40, 41], but its closing deadline is **4 September 2025** [42]. Do NOT bank on this for a 2026 roadmap without verifying a 2026 round has been formally capitalised.

> **Picker question from notebook:** Proprietary agentic workflow generating new IP → **R&D Tax Incentive**. Upgrading existing commercial ops with external AI consultants → **WA IBG**.

---

## 6. Unit economics, revenue model, financial impact of automation

**Question:** Detail Kismet's unit economics. Revenue streams + amounts; LTV / commission; CAC + speed-to-lead; labour cost saved per automation; P&L delta / payback / ROI; cost of compliance; SaaS run-rate; headcount-to-revenue.

> Split reality from notebook: granular financial model for the **new AI-Readiness partnership**, almost **zero baseline P&L data** for Kismet's legacy finance/mortgage broking operations.

### 1. Revenue Streams
- **Legacy:** B2B referral hub — undisclosed commissions for introducing clients to third-party brokers/accountants [1].
- **New AI-driven platform — 2 modelled streams:**
  - **AI-Readiness Assessments:** Pre-implementation diagnostics — **$2,000–$10,000 per client, modelled avg $5,000**. Kismet retains **60–100%** [2, 3, 4].
  - **Implementation Referral Margin:** Recurring **15–20% margin (modelled 17.5%)** on build + monthly retainer fees paid to Good AI Australia [2, 5].

### 2. Average Deal / Client LTV
- **Core finance deal value:** NOT disclosed in sources. Generic "Rep-Proof" benchmark models a "$50K average deal" for ROI recovery, but this is an industry abstraction, not Kismet's verified data [6].
- **AI partnership LTV:** Average Kismet-originated client total wallet for AI implementation = **$14,080** [7, 8].
- **Year 1 projection:** Across 28 modelled clients, Kismet earns **$158,947 total** — $140,000 direct assessments + $18,947 referral margins [7, 8].

### 3. CAC + Speed-to-Lead Economics
- Kismet's internal CAC NOT provided.
- **5-Minute Rule:** Responding within 5 min makes business **9× more likely** to engage lead [9].
- **Leakage Cost:** **62% of calls to small businesses go unanswered**; **85% of missed leads do NOT call back** [9].

### 4. Labour Cost Saved + Capacity Reclaimed
- Automated document chasing + ASIC compliance logging reclaim **30–40% of sales team total capacity** [10, more_horiz].
- Eradicates **~10 hours of manual admin per rep** [13, 14].
- **Hire Deferral Metric:** **$108,450 saved per year per avoided admin hire** (Perth Legal Secretary median **$81,750** × **1.4 fully burdened multiplier**) [15, 16].

### 5. P&L Delta / Payback / ROI
- Kismet-specific deltas NOT provided. ROI measured via **"Asset Accretion" + increased Leads-to-SQL conversion** [17].
- **Broader Perth SME benchmark:** **Year 1 ROI 391–596%**, **payback 1.7–2.4 months** [18, 19].

### 6. Cost of Compliance
- WA PRIS Act + APRA CPS 230 + SEC 17a-4 reclassify high enterprise-tier SaaS TCO as a **"Mandatory Compliance Fee (MCF)"** — Kismet must **optimise for risk mitigation, not cost** [20].

### 7. Software / Infrastructure Cost Base
- **Phase 1 (5-User Pilot):** **$250–$300 AUD/month**. Includes Airtable Business (~$45/user), Make.com Pro (~$16/mo), Twilio pay-as-you-go SMS ($0.05–$15/msg) [12].
- **Phase 2 (20-User Compliance Baseline):** Annual TCO **~$21,840**:
  - Airtable Business: $10,800
  - Google Workspace Enterprise: $7,200
  - Make.com Pro/Team: $3,840 [21]
- **Enterprise scale:** For DLP + SAML SSO + Vault WORM, Kismet must upgrade to **Airtable Enterprise Scale** (custom pricing) + **Google Workspace Enterprise Plus** [22, more_horiz].

### 8. Headcount-to-Revenue / Productivity
> **Critical evidence gap:** Sources contain **zero** data on Kismet's internal productivity targets, deals/rep/month, or AUM/advisor.

> **NotebookLM next-step:** "To calculate Kismet's true organisational ROI, input their current average mortgage/finance commission value and multiply by the 30–40% capacity increase. Do you have access to Kismet's internal commission averages?"

---

## 7. Operational SOP + day-in-the-life

**Question:** Full operational SOP. End-to-end client journey + stage transitions; day-in-the-life of a rep; team structure + handoffs; manager scorecard / KPIs; meeting cadences; escalation; SLAs.

> Notebook framing: Kismet's operational blueprint is **"a rigid, software-enforced compliance fortress"** — the digital workflow is exhaustively documented, **human operating rhythms (quotas, meeting cadences, internal routines) almost entirely absent**.

### 1. End-to-End Client Journey
Notion is the primary database of record [1, more_horiz].

**Phase 1 — Intake Triage:**
- Field rep does a door-knock, submits **Cost of Living Survey via Fillout** [2].
- Qualifies → `WARM LEAD / CALLBACK` → auto-syncs to Google Calendar [2].
- Doesn't qualify → `DNQ / NOT INTERESTED / FAKE NUMBER` [2].

**Phase 2 — Pathway Differentiation** (enforces strict "Non-Advice" boundaries [4]):
- Housing leads → sent Property Guide → book site visit.
- SMSF leads → sent guide → trust deeds checked → Fact Find booked.

**Phase 3 — Discovery:**
- Prospect attends Discovery Meeting → Client Assessment form submitted [2].
- Status → `FA`. System consolidates master profile under a **"Household"** [2, more_horiz].
- Client delays → `FUTURE PROSPECTS` [3].

**Phase 4 — Approval:**
- Consultant crunches numbers.
- Third party needed → `REFER TO BROKER / ACCOUNTANT` [3].
- Approved directly → `SALE` → triggers automated onboarding emails [3].

### 2. Day-in-the-Life (Field Reps + Advisors)
- **Ops:** "Phone-First" — Google Maps + text-based street assignments ("**The Hit List**") [6, 7]. No complex custom apps [6].
- **Execution:** Tap "New Knock" / log "Not Home" in **3 seconds** / capture max **5 survey questions** at the door [6, more_horiz].
- **Close-out — "The Melted Butter Rule":** Post-appointment admin **under 60 seconds with zero typing** [7, 9]. Rep taps **"SAT" (Appointment Completed)** → reveals mic → records voice note → synced to CRM [5, 7].

> **Missing intel:** No data on morning routines, queue management, daily call quotas, or specific end-of-day routines beyond voice note submission.

### 3. Team Structure + Handoffs
- **Roles identified:** Field Reps (door knockers), Consultants (discovery + number crunching), **Senior Broker** (receives VIP leads — Super Balance > $200k), **Round Robin** queue (standard leads), Managers (e.g. **Shane**) [2, more_horiz].
- **Handoffs:** System-automated. n8n orchestrates data, creates household records, alerts relevant Slack channels or specific reps [11, 12].
- **Missing intel:** No mention of a dedicated internal compliance officer role.

### 4. Manager Scorecard — "Bali Dashboard"
Governed by: **"If Shane can't judge performance in 60 seconds, the dashboard is wrong"** [8]. Tracks:
- **Activity:** Total calls per rep [8].
- **Compliance:** Notes Compliance rate — **target 100%, currently 98%** [8].
- **Conversion rates:** Volume + % drop-offs between `BOOKED` → `SAT` (e.g. 72%) → `SOLD` (e.g. 56%) [8].
- **Geography:** Visual lead-performance mapping across Perth suburbs [8].

### 5. Meeting Cadences
> **Missing intel:** ZERO references to daily standups, weekly pipeline reviews, monthly retros, or quarterly compliance audits.

### 6. Escalation
- **Compliance / missing notes — "Ghost Ban" protocol:**
  - Empty notes after `SAT` → 2hr → auto-ping rep → next morning → manager alert ("KPI Impacted") [5, 13].
  - Daily **02:00 AM cron** sweeps for incomplete records → Slack report tagging reps [12, 14].
- **Missing documents:** Escalated to **T3 Multi-Tool Agent System** → smart checklists chasing client without human intervention [15, 16].
- **Missing intel:** No customer-complaint procedure defined.

### 7. SLA / Response Time
- **Speed-to-lead:** **5-Minute Rule** — 5 min response = **9× more likely** to engage [17].
- **Missed calls:** Immediate automated SMS text-back to client [18]. **P1 alert to rep mandating follow-up call within 10 min** [19].
- **Post-meeting admin:** All notes + CRM updates **under 60 seconds** [7, 9].

> **NotebookLM picker:** "Operational architecture is severely lopsided toward software enforcement, leaving human management protocols undocumented. Do you possess internal HR/management manuals to fill this void, or should we design standard standups / pipeline reviews to match the technical dashboard?"

