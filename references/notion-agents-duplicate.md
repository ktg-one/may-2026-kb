# — Kismet Finance Group

> **Purpose:** This is the single source of truth for CLI coding agents performing task allocation and orchestration across the Kismet OS build. Read this ENTIRE file before starting any work.

---

## 🏢 Project Overview

**Kismet Finance Group** is an Australian financial services company (Perth, AWST / UTC+8) operating a door-to-door lead generation pipeline for **Housing/Property** and **SMSF** (Self-Managed Superannuation Fund) pathways.

**Mission:** Build a fully automated, Notion-first CRM and operations system that takes a lead from door knock → qualification → discovery → financial assessment → onboarding — with AI-powered assistance layered on top once the foundation is solid.

**Current Phase:** Pipeline is automated through to Client Assessment Form. Forms integration, button automations, and compliance views are the active priorities. Vertex AI is **LAST** — do NOT touch AI stack tasks until everything else is locked in.

---

## 📐 Architecture & Tech Stack

|**Layer**|**Tool**|**Purpose**|
|---|---|---|
|CRM / OS Hub|Notion|Databases, pipeline views, ops pages, team workspace|
|Forms|Fillout Forms|DQ Form (door knock intake), Client Assessment Form|
|Automation|n8n|Webhook workflows, calendar sync, task triggers|
|Calendar|Google Calendar|Discovery bookings, callback scheduling (one-way Notion→GCal sync, hourly poll + daily 8pm AWST + webhook, dedup via Notion page ID)|
|Drive|Google Drive|Client folders, document storage, SOPs|
|Email|Gmail|Onboarding emails, templates|
|E-Signatures|DocuSign (planned)|Authority to Act, Engagement Agreement|
|BI / Dashboards|Looker Studio (planned)|Performance reporting|
|AI (LAST)|Vertex AI / GCP|RAG, voice note summarization, next-action suggestions|
|Voice (planned)|Aircall/3CX, Trillet, Twilio|Call logging, SMS, AI voice agent|

---

## 🔁 End-to-End Pipeline Workflow

### Phase 1: Lead Generation & Intake

1. **Door Knock** — Field reps (Josh, Lea, Shane) conduct cost-of-living surveys in assigned areas
2. **DQ Form Submission** — Rep submits via Fillout Forms → data lands in `DQ Form Responses` database → auto-populates to `OPERATIONS 2026` → initial status = `CALLBACK` or `WARM LEAD`
3. **Verification ("The Check")** — Using the QUALIFIED view, team verifies: phone valid, fields complete, lead owner assigned. Bad leads → `FAKE NUMBER` / `NOT INTERESTED` / `DNQ`

### Phase 2: The Hook & Booking

1. **Feedback Call** — Admin/consultant calls back to confirm responses, build rapport, determine Housing or SMSF pathway, and book discovery meeting
2. **Status Update** — Consultant fills "Discovery Booked" date, status changes to `DISCOVERY` → auto-syncs to Google Calendar
3. **Auto-Trigger** — Discovery booking generates a Client Assessment Form URL linked to the lead record

### Phase 3: Discovery & Financial Assessment

1. **Discovery Meeting** — Consultant reviews DQ data + callback history, fills Client Assessment Form during/after meeting
2. **FA Gate** — Consultant adds notes, picks pathway (SMSF or Property), updates status to `FA` / `REFER TO BROKER` / `REFER TO ACCOUNTANT`
3. **Consolidation** — System auto-consolidates DQ Form + callback notes + discovery notes + assessment financials into a single linked client profile

### Phase 4: Approval & Onboarding

1. **Final Decision** — Proceed = `SALE`; not now = `FUTURE PROSPECTS`
2. **Onboarding Email** — Auto-triggered: welcome, pathway summary, next steps, required docs checklist, case manager contact

### Status Vocabulary

`CALLBACK` → `WARM LEAD` → `QUALIFIED` → `DISCOVERY` → `FA` → `SALE` / `FUTURE PROSPECTS`

Alt codes: `FAKE NUMBER`, `NOT INTERESTED`, `DNQ`, `REFER TO BROKER`, `REFER TO ACCOUNTANT`

### Pathways

- 🏠 **Housing / Property Pathway**
- 🏦 **SMSF Pathway** (Self-Managed Superannuation Fund)

---

## 🗄️ Key Databases & Data Sources

|**Database**|**Purpose**|**Page Reference**|
|---|---|---|
|**✅ Good AI Tasks**|Master task list for the entire build — 109 tasks, sequenced, categorized, phased. **THIS IS YOUR TASK SOURCE.**|[](https://www.notion.so/b3a7ed505f0749cf8777d54764b2bb1c?pvs=21)|
|**MASTER DATABASE 2025**|Master lead/client pipeline database|[MASTER DATABASE 2025](https://www.notion.so/2e6772b128b0805390d8f40e052152d2?pvs=21)|
|**DQ Form Responses**|Destination for door-knock form intake submissions|[DQ Form Responses](https://www.notion.so/0761ca2fe7bf4613822a57d96625863c?pvs=21)|
|**Client Assessment Form**|Financial assessment data from discovery meetings|[](https://www.notion.so/2fd772b128b080cbbf42ed2785e758cc?pvs=21)|
|**DQ Status Tally**|Aggregated status counts for pipeline reporting|[](https://www.notion.so/bcd7c625b19944deab062a0e0b0f0a04?pvs=21)|
|**Archive**|Archived/closed records|[](https://www.notion.so/2e1772b128b080938c3ef97dfdbbe33b?pvs=21)|

---

## ✅ Good AI Tasks — Schema Reference

> **This is the task allocation database.** CLI agents read from and update this database for orchestration.

|**Property**|**Type**|**Description**|
|---|---|---|
|`Task Name`|title|The task title|
|`Status`|status|`Not Started` · `On Hold` · `In Progress` · `Done`|
|`Category`|select|Google Workspace · Notion Database · Data Migration · Pipeline Config · AI Foundation · AI Knowledge Base · Button Automations · Training · UI/UX · Compliance · Backup & Sync · DocuSign · Voice & Comms · Dashboard · Vertex AI · AI Integration · Territory · Templates · Escalation · Mobile Form · AI Tuning · Testing · Documentation · Pilot Program · Knowledge Transfer · Evaluation · Workflow Automation · Forms & Data|
|`Phase`|select|`Phase 1: Foundation` · `Phase 2: Enforcement & Automations` · `Phase 3: Field Ops` · `Good AI Roll-out` · `Operations 2026`|
|`Sequence`|number|Execution order (lower = higher priority). Respect this ordering.|
|`Agent Confirmation`|select|Which CLI agent claimed/completed the task: `Jules-cli` · `Cursor Agents` · `Github Copilot` · `Crush-cli` · `Kimi-cli` · `Qwencode` · `Opencode` · `Gemini-cli` · `Codex` · `Claude code`|
|`Source Page`|url|Link back to the originating phase/source page|
|`Parent item`|relation (self)|Parent task (for sub-task hierarchy)|
|`Sub-item`|relation (self)|Child tasks|
|`Tags`|multi_select|Freeform tags|

### Agent Orchestration Protocol

1. **Query** the Good AI Tasks database for tasks with `Status = "Not Started"`, ordered by `Sequence` ascending
2. **Claim** a task by setting `Status = "In Progress"` and `Agent Confirmation` to your agent identifier
3. **Execute** the task according to its Category, Phase, and Source Page context
4. **Complete** by setting `Status = "Done"` once verified
5. **Respect sequence** — lower sequence numbers have higher priority. Do not skip ahead unless blocked.
6. **Check blockers** — see the Blockers section below before starting work

---

## 🔴 Current Blockers (as of Feb 2026)

<aside> 🔴

**BLOCKER: Fix Notion API credentials / authority error** — Admin is getting "no authority" despite having permissions. The integration must be added to all relevant pages, token must be valid, and connection shared with correct workspace pages. **This must be resolved before ANY automation tasks can proceed.**

</aside>

<aside> ⚠️

**Fillout → Notion field mappings** — Forms need to be reconnected to the updated database schema. End-to-end submission tests are pending.

</aside>

<aside> ✅

**Google Calendar sync — RESOLVED 2026-02-23** — Rebuilt via Claude code: Notion→GCal one-way sync, hourly poll + daily 8pm AWST + webhook trigger, dedup via Notion page ID as event ID, credentials fixed.

</aside>

---

## 📋 Phase Breakdown & Task Priorities

### 🔴 Priority 1: Forms & Database Connection (DO NOW)

- Connect Fillout Forms to updated Notion database schema
- Validate form field mappings match new database properties
- Test form submission → Notion page creation end-to-end
- NRA triggers → CALLBACKS assigns Task to Leads `[seq 92]`
- New Submission from DQ Form → Task for Lead → Feedback call with Due date `[seq 93]`
- Feedback call → Questions map to Lead Profile for Points (Incentives) → Scoreboard `[seq 94]`

### 🟡 Priority 2: Solidify Notion-First Pipeline

- **Database:** Rollup fields for data aggregation `[seq 2]`
- **Pipeline:** Ensure all pipeline stages connected & trigger correctly; validate pathway switching (Housing ↔ SMSF)
- **Gmail:** Finalize Gmail templates `[seq 33]`
- **Buttons:** Complete `[seq 13]` · Escalate `[seq 14]` · Sync to Google `[seq 15]` · Send Authority `[seq 16]` · Ask AI `[seq 17]`
- **Compliance:** Missing Notes tracking `[seq 24]` · Compliance dashboard `[seq 25]` · Data validation rules `[seq 26]`
- **Backup:** n8n redundancy `[seq 27]` · Version control `[seq 28]`

### 🔵 Priority 3: UI/UX, Training & Templates

- Company overview page `[seq 8]` · Branding `[seq 20]` · Typography `[seq 21]` · Navigation `[seq 22]` · A/B testing `[seq 23]`
- Help center `[seq 18]` · Tag historical data for AI corpus `[seq 3]`

### 🟣 Priority 4: Field Ops & Comms

- **DocuSign:** Authority to Act `[seq 36]` · Engagement Agreement `[seq 37]` · Notion trigger `[seq 38]` · PDF auto-save `[seq 39]`
- **Voice:** Aircall/3CX `[seq 40]` · Trillet AI `[seq 41]` · Twilio `[seq 42]` · Call logging `[seq 43]`
- **Territory:** Suburb database `[seq 58]` · GPS `[seq 59]` · Rep assignment views `[seq 60]` · Performance metrics `[seq 61]`
- **Escalation:** Ghost Detector `[seq 66]` · 2hr rep alert `[seq 67]` · 24hr manager escalation `[seq 68]`
- **Mobile Form:** Branded form `[seq 70]` · GPS auto-capture `[seq 71]` · Address lookup `[seq 72]` · One-thumb UX `[seq 73]` · AI Quick Summary `[seq 74]`
- **Dashboard:** Looker Studio `[seq 34-35]` · Embed in Notion `[seq 44]` · Voice metrics `[seq 45]` · CRM overview `[seq 46]` · Real-time refresh `[seq 47]`

### 📚 Priority 5: Documentation (parallelizable)

- Document AI capabilities `[seq 19]` · Update training `[seq 86]` · Troubleshooting guide `[seq 87]` · Automation docs `[seq 88]` · AI limitations `[seq 89]` · Usage guidelines `[seq 90]` · Handover materials `[seq 91]`

### 🧪 Priority 6: Testing & QA

- Stress test with real appointments `[seq 80]` · Validate escalation triggers `[seq 81]` · Test mobile form in field `[seq 82]` · AI summarization on live voice notes `[seq 83]` · Validate AI suggestions `[seq 84]` · Rep feedback `[seq 85]`

### 👍 Priority 7: Good AI Roll-out

- **Pilot:** Select use case `[seq 95]` · Define scope/success criteria `[seq 96]` · Pilot infrastructure `[seq 97]` · Monitor performance `[seq 98]` · Document lessons `[seq 99]`
- **Knowledge Transfer:** Architecture docs `[seq 100]` · Training materials `[seq 101]` · Training sessions `[seq 102]` · Support processes `[seq 103]` · Advisory services `[seq 104]`
- **Evaluation:** Measure KPIs `[seq 105]` · Stakeholder feedback `[seq 106]` · Optimization opportunities `[seq 107]` · Scaling recommendations `[seq 108]` · Future roadmap `[seq 109]`

### 🔒 Priority LAST: Vertex AI & AI Stack

> **DO NOT START until all above priorities are complete.**

- **AI Foundation:** GCP project `[seq 4]` · Vertex AI API `[seq 5]` · Service account `[seq 6]` · Billing `[seq 7]`
- **AI Knowledge Base:** Drive→Vertex `[seq 9]` · Index SOPs `[seq 10]` · Index client notes `[seq 11]` · Unstructured connector `[seq 12]` · Structured schema `[seq 29]` · Map Notion→AI `[seq 30]` · Prompt templates `[seq 31]` · Test retrieval `[seq 32]`
- **Vertex AI:** Search & Conversation agent `[seq 48]` · RAG `[seq 49]` · Knowledge base connection `[seq 50]` · Conversation design `[seq 51]` · Voice note summarization `[seq 52]` · Test accuracy `[seq 53]`
- **AI Integration:** Embed in Notion `[seq 54]` · n8n voice→AI→summary `[seq 55]` · AI note templates `[seq 56]` · Suggest Next Action `[seq 57]`
- **AI Tuning:** Collect summaries vs actuals `[seq 75]` · Identify hallucinations `[seq 76]` · Refine prompts `[seq 77]` · Update knowledge base `[seq 78]` · Confidence scoring `[seq 79]`

---

## 🤖 Good AI — Agent & AI Context

### Good AI Roll-out Status

[Good AI Roll-out](https://www.notion.so/Good-AI-Roll-out-2ef772b128b080a58000ff1b1b42cff0?pvs=21) — **Status: In Progress**

**Completed phases:**

- ✅ Discovery & Assessment (business process analysis, AI use case identification, tech readiness)
- ✅ Solution Design & Strategy (roadmap, technical specs, cost-benefit, data strategies)
- ✅ Stakeholder Engagement (executive buy-in, workshops, role definitions)
- ✅ Implementation Planning (project plan, tooling, data audit, deep clean)

**Remaining phases:**

- 🔲 Pilot Program Development (use case selection, infrastructure, monitoring, lessons learned)
- 🔲 Knowledge Transfer & Documentation (architecture docs, training, support processes)
- 🔲 Evaluation & Optimization (KPI measurement, feedback, scaling recommendations)

### Good AI Knowledge Base

[Good AI - Agent Knowledge Base](https://www.notion.so/Good-AI-Agent-Knowledge-Base-30c772b128b080238754ddf5322383a7?pvs=21)

The Knowledge Base is structured around four connector modules:

|**Module**|**Role**|**What Agents Need to Know**|
|---|---|---|
|**Google Workspace**|Auth/Path Connector|Where the "Good AI" folder structure lives in Drive. Source of Truth folders.|
|**AI Knowledge**|Logic Connector|Self-evals and benchmarks. Prompt routing: emotional mapping → Prompt X; data tasks → Gemini.|
|**n8n Knowledge**|Trigger Connector|Specific Webhook URLs and JSON structures. Enables agents to draft payloads that actually work.|
|**MCP**|Local/Global Connector|Which tools are local-only (security) vs cloud-connected via Model Context Protocol.|

### AI Component Breakdown (Vertex AI — Future)

[**AI COMPONENT BREAKDOWN**](https://www.notion.so/AI-COMPONENT-BREAKDOWN-2f0772b128b080ecb9dac74c580f62e3?pvs=21)

Planned AI use cases (do NOT build yet):

- **Voice Note → Text Summary** — Rep records → n8n triggers Vertex AI transcription + summarization → Notion auto-populate
- **Client Context Retrieval** — "AI Brief" before calls surfaces history, preferences, objections in mobile view
- **Next Action Suggestions** — Post-appointment AI analysis → suggested follow-up tasks → pre-populated templates
- **Compliance Monitoring** — AI scans notes for required elements → flags incomplete docs → feeds Missing Notes view

---

## 👥 Team & Delegation

|**Who**|**Role**|**Responsibilities**|
|---|---|---|
|**Admin Kismet**|Workspace Admin / Ops Builder|Fix API credentials, Fillout Forms connection, Calendar sync, system architecture|
|**Kev / Dev**|Internal Builder / Trainer|n8n workflows, button automations, DocuSign integration, webhook configs, training content|
|**Shane Hewson**|Field Rep / Consultant|Discovery meetings, client assessments, receives booking notifications|
|**Josh Clark**|Field Rep / Consultant|Discovery meetings, client assessments, receives booking notifications|
|**Lea**|Field Rep / Lead Owner|DQ lead generation, door-knock surveys|
|**Notion AI (DonaldJTrump)**|AI Assistant|Documentation, compliance views, database rollups, template creation|
|**CLI Agents**|Automated Task Execution|Read from Good AI Tasks DB, claim tasks via Agent Confirmation, execute and complete|

---

## 📍 Key Pages — Quick Reference

|**Page**|**Purpose**|
|---|---|
|[OPERATIONS 2026](https://www.notion.so/OPERATIONS-2026-48d51a16de064e3ab759396d37976c63?pvs=21)|Daily cockpit — **do not change filters/layout/automations**|
|[DQ Workspace](https://www.notion.so/DQ-Workspace-c7b63caec4cb48fc862ad85f2b90f1d6?pvs=21)|Door-knock scripts, checklist, tips, emergency contacts|
|[Discovery Workspace](https://www.notion.so/Discovery-Workspace-30a772b128b080558d72dcedbfef24bf?pvs=21)|Discovery prep, Fillout link, DocuSign prep|
|[Kismet Workflow Feb 2026](https://www.notion.so/Kismet-Workflow-Feb-2026-30d772b128b080019f09ffaa36313773?pvs=21)|Complete end-to-end workflow documentation|
|[Kismet Workflow - Lesson 1](https://www.notion.so/Kismet-Workflow-Lesson-1-2f0772b128b08022b5c2c9961530edb9?pvs=21)|Step-by-step ops guide for team|
|[Kismet Group — Workflow & Build Status](https://www.notion.so/Kismet-Group-Workflow-Build-Status-7a184f1846de41239fbc88b82e981bb1?pvs=21)|Phase plan, progress, and blockers dashboard|
|[KEV’S LESSONS](https://www.notion.so/KEV-S-LESSONS-2f0772b128b0801080f1d9b10638d718?pvs=21)|Training content & SOPs|
|[Good AI - Agent Knowledge Base](https://www.notion.so/Good-AI-Agent-Knowledge-Base-30c772b128b080238754ddf5322383a7?pvs=21)|AI connector modules, prompt routing, n8n payloads|
|[Good AI Roll-out](https://www.notion.so/Good-AI-Roll-out-2ef772b128b080a58000ff1b1b42cff0?pvs=21)|Phased AI rollout — discovery through evaluation|
|[**AI COMPONENT BREAKDOWN**](https://www.notion.so/AI-COMPONENT-BREAKDOWN-2f0772b128b080ecb9dac74c580f62e3?pvs=21)|Vertex AI architecture & use cases (future)|
|[Databases (do not touch)](https://www.notion.so/Databases-do-not-touch-303772b128b0801ba98af3bce27bb054?pvs=21)|Index page for all operational databases|
|[Restricted](https://www.notion.so/Restricted-2e1772b128b080e88f89e6c7f31d368e?pvs=21)|API Keys, director dashboards — **handle with care**|
|[Kismet Group HQ (PRIVATE)](https://www.notion.so/Kismet-Group-HQ-PRIVATE-2ef772b128b080a7a18be124de8df4a1?pvs=21)|Private organizational hub|
|[Kismet Public](https://www.notion.so/Kismet-Public-2c1772b128b080eeb5b1c414334e18ea?pvs=21)|Public-facing hub|

---

## 🔑 Lingo & Acronyms

|**Term**|**Meaning**|
|---|---|
|DQ|Door Qualification (door-knock survey intake)|
|CHECK|Internal verification step for new leads (phone, completeness, owner)|
|SMSF|Self-Managed Superannuation Fund|
|FA|Financial Assessment|
|DNQ|Did Not Qualify|
|NRA|Presumed: auto-task creation trigger for callbacks (needs confirmation)|
|MCP|Model Context Protocol (local vs cloud tool routing)|
|RAG|Retrieval Augmented Generation|
|AWST|Australian Western Standard Time (UTC+8)|

---

## ⚠️ Rules for CLI Agents

1. **Read this file completely before starting any task.**
2. **Respect the sequence numbers** in Good AI Tasks — lower = higher priority.
3. **Do NOT touch Vertex AI / AI stack tasks** until all prior priorities are marked Done.
4. **Do NOT modify OPERATIONS 2026 filters, layouts, or automations** — this is the live cockpit.
5. **Do NOT modify the Databases (do not touch) page** structure without explicit Admin approval.
6. **Claim tasks before working** — set `Agent Confirmation` to your agent identifier and `Status` to `In Progress`.
7. **Handle PII with care** — lead records contain personal information. Do not log, expose, or transmit PII outside the workspace.
8. **Check blockers** — if the Notion API authority error is not yet resolved, do not attempt automation tasks that require API access.
9. **Documentation tasks (Priority 5) are parallelizable** — multiple agents can work these simultaneously.
10. **Test in context** — verify your work against the actual pipeline flow described above before marking Done.

---

_Source: [](https://www.notion.so/b3a7ed505f0749cf8777d54764b2bb1c?pvs=21)— 109 tasks across 7 priority tiers_

_Last comprehensive update: 26 Feb 2026 by Admin / DonaldJTrump_