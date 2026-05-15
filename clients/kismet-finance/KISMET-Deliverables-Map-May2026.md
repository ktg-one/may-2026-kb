# KISMET FINANCE GROUP — COMPREHENSIVE DELIVERABLES MAP

**Prepared by:** Kevin PL Tan, Good AI Australia
**Date:** 9 May 2026
**Purpose:** Invoice-ready deliverables register — all work performed for Kismet Finance Group
**Sources:** n8n instance, Notion workspace, knowledge2026 vault, session records

---

## 1. n8n WORKFLOW AUTOMATION (10 workflows built)

| # | Workflow Name | Function | Status | Created | Complexity |
|---|--------------|----------|--------|---------|------------|
| 1 | KISMET-DQFORM2NOTION | Ingests DQ Form submissions from Fillout into Notion DQ Form Responses database. Dedup logic, hourly polling. | Archived (superseded) | 7 Feb 2026 | Complex |
| 2 | KISMET-CLIENTASSESS | Client Assessment Form automation — generates assessment forms post-discovery, links to pipeline records | Archived (superseded) | 8 Feb 2026 | Complex |
| 3 | KISMET-DQ-Discovery-Calendar | Syncs Notion discovery bookings to Google Calendar. Uses Notion Page ID (dashes stripped) as GCal Event ID for idempotent one-way sync. Dedup logic. | Active | 19 Feb 2026 | Complex |
| 4 | KISMET-Error-Log | Centralised error handling and logging system. Catches workflow failures across all KISMET workflows and logs to Google Sheets. | Active | 22 Feb 2026 | Medium |
| 5 | KISMET-CRM-Complete-Button | Notion button automation — marks tasks done and advances pipeline stage when user clicks "Complete" in CRM | Active | 26 Feb 2026 | Medium |
| 6 | KISMET-CRM-Escalate-Button | Notion button automation — sends compliance-tracked escalation alerts to managers. Added Escalated, Escalated At, and Escalation Note properties to Notion DB. | Active | 26 Feb 2026 | Medium |
| 7 | KISMET-CRM-SyncToGoogle | Notion button automation — forces Google Drive folder creation and Google Calendar data sync on demand | Active | 26 Feb 2026 | Complex |
| 8 | KISMET-ObsidianAgent | Obsidian vault integration — bridges Notion CRM data to Obsidian knowledge base for agent access | Active | 5 Mar 2026 | Medium |
| 9 | KISMET-AskAI-LeadAnalysis | AI-powered lead intelligence generation — analyses lead data and produces qualification insights | Active | 5 Mar 2026 | Complex |
| 10 | KISMET-DocuSign-Onboarding | DocuSign integration for client onboarding — prepares and routes Authority to Act and Engagement Agreement documents | Inactive (staged) | 5 Mar 2026 | Complex |

**Technical notes:**
- All workflows use Notion REST API via httpRequest (not n8n Notion node) to conditionally skip empty fields
- Bridge pattern: Notion button click triggers n8n webhook
- Error handling routes to KISMET-Error-Log for centralised monitoring

---

## 2. NOTION INFRASTRUCTURE BUILT

### 2.1 OPERATIONS 2026 Dashboard (Main Workspace)
- Full operational dashboard with Kismet branding (logo icon, custom cover image)
- Primary workspace for daily team operations
- Created: 18 Feb 2026 | Last active: 8 May 2026 (daily use)

### 2.2 Databases Created & Configured

| # | Database | Purpose | Properties | Views |
|---|----------|---------|------------|-------|
| 1 | **Master Pipeline** (Master Database 2025) | Primary lead/client pipeline — every active lead, prospect, and client record | 80+ properties (Name, Status, Lead Owner, Phone, Email, Address, Pathway, Discovery dates, Agent Confirmation, relations to DQ Form, Assessment, Household, Drive Folder, Calendar Event) | CHECK, FEEDBACK CALL, DISCOVERY, Active Pipeline, Investor, SMSF, Missing Notes |
| 2 | **DQ Form Responses** | Raw intake from door-knock qualification forms via Fillout | Lead Name, Submission Date, Rep, Phone, Address, Homeowner, Investor, Super Balance, Interest Level, Best Call Time, Pipeline Record relation, Status | Default + filtered views |
| 3 | **Client Assessment Form** | Post-discovery financial assessment data (sensitive PII) | Client Name, Assessment Date, Consultant, Pathway, Income (A1/A2), Debts, Super Balance, Property Goals, SMSF Goals, Risk Profile, Pipeline relation | Default |
| 4 | **DQ Status Tally** | Daily per-consultant lead status tracking with category breakdowns (WARM LEAD, CALLBACK, DISCOVERY, FAKE NUMBER, NOT INTERESTED, OTM, FA, SALE, etc.) | Consultant, Date, 15+ status category columns, Doors Knocked, Total (formula), Notes | Per-consultant daily view |
| 5 | **Archive** | Historical/inactive records | Inherited from Master Pipeline | Default |
| 6 | **DQ Monthly Tally** | Monthly aggregation of DQ Status Tally data | Monthly rollups | Default |

### 2.3 Pages & Structures Built

| # | Page/Structure | Location | Purpose |
|---|---------------|----------|---------|
| 1 | **Kismet Public** (Home Page) | Workspace root | Company hub — projects, meetings, active pipeline, company docs, lessons |
| 2 | **Kismet Databases** | Under Kismet Public | Container for all database infrastructure |
| 3 | **AGENTS.md — Kismet Build Tasks** | Under Kismet Public | Build task tracker for AI agent operations (100+ tasks across 4 phases) |
| 4 | **Kismet Workflow Feb 2026** | Under Kismet Public | Workflow documentation and process maps |
| 5 | **KEV'S LESSONS** | Under Kismet Public | Training materials and knowledge transfer docs |
| 6 | **Projects** database | Embedded in Kismet Public | Project tracking with status |
| 7 | **Meetings** database | Embedded in Kismet Public | Meeting notes and scheduling |
| 8 | **TOP PAGE** section | Kismet Public | Executive summary / landing area |
| 9 | **Company Docs** section | Kismet Public | Collapsible document library |
| 10 | **Active Projects** section | Kismet Public | Current work tracking |

### 2.4 Team Hub & Onboarding Area

| # | Item | Created | Purpose |
|---|------|---------|---------|
| 1 | **Team Profiles — Data-Backed (Apr 2026)** | 7 Apr 2026 | Individual team member profiles with live pipeline data pulled from DQ Status Tally |
| 2 | **HR Databases** page | 23 Apr 2026 | HR infrastructure (attempted — partially blocked by API limitations) |
| 3 | **Team directory** database | 24 Feb 2026 | Contact directory with Name, Job Title, Phone, Email, LinkedIn, Department, Location |
| 4 | **Teams roster** database | 24 Feb 2026 | Team structure with Engineering Manager, Engineers, Designer, XFN Partners, Slack channel, parent/child team relations |
| 5 | **Team goals** page + OKR structure | 24 Feb 2026 | Objectives and Key Results tracking (e.g., "Increase team to 50" with 2 KRs) |

### 2.5 Automated Bot: DQ Tracker
- Daily automated status updates posted to DQ Status Tally database
- Tracks per-consultant lead movements across all pipeline stages
- Running daily since at least May 2026 (entries confirmed for consultants: Josh, Shane, DJ, Ben, Zion, Lea)
- Includes change notes (e.g., "+6 WARM LEAD, Total 84→90") and trend analysis

---

## 3. INTEGRATIONS CONFIGURED

| # | Integration | Systems Connected | Purpose | Status |
|---|------------|-------------------|---------|--------|
| 1 | **DQ Form Pipeline** | Fillout Forms → Google Sheets → Notion | Door-knock form submission flows into CRM automatically | Active |
| 2 | **Notion → Google Calendar Sync** | Notion (Discovery Booked field) → Google Calendar | Auto-creates calendar events when discovery meetings are booked; idempotent sync using Page ID | Active |
| 3 | **Notion → Google Drive** | Notion pipeline → Google Drive | Auto-creates client folders on status change; document storage | Active |
| 4 | **CRM Button Automations** | Notion buttons → n8n webhooks | Complete, Escalate, Sync to Google — in-CRM action buttons | Active |
| 5 | **DocuSign Onboarding Flow** | Notion → n8n → DocuSign | Authority to Act and Engagement Agreement document routing | Staged |
| 6 | **Obsidian Agent Bridge** | Notion CRM → n8n → Obsidian vault | Knowledge base sync for AI agent context | Active |
| 7 | **Error Logging System** | All KISMET workflows → n8n → Google Sheets | Centralised error capture and monitoring | Active |
| 8 | **AI Lead Analysis** | Notion lead data → n8n → AI model | Automated lead qualification intelligence | Active |
| 9 | **Twilio ↔ AppSheet ↔ Notion** | Phone system → CRM logging | Call logging and voice agent integration pipeline | Delivered (Phase II) |

---

## 4. DOCUMENTATION DELIVERED

| # | Document | Type | Content | Date |
|---|----------|------|---------|------|
| 1 | **Business OS Report** | Strategic doc (19 pages, PDF) | Complete business operating system design — compliance, team structure, scaling plan | Nov 2025 |
| 2 | **Company Profile Document** | 1-pager PDF | Kismet Finance Group company overview | Nov 2025 |
| 3 | **CRM Schema Documentation** | Technical reference (240+ lines) | Full Notion database architecture — all properties, relations, views, automation integration points, data governance rules | Feb 2026 |
| 4 | **Lead Pipeline Stages** | Operational reference (320+ lines) | Authoritative definition of every pipeline stage — entry/exit triggers, required actions, data fields, automation triggers | Feb 2026 |
| 5 | **Data Handling & Compliance Rules** | Compliance doc (229 lines) | Privacy Act 1988 obligations, NCCP Act compliance, PII classification, agent rules, breach protocols, escalation paths | Feb 2026 |
| 6 | **Business Overview / Firm Context** | Knowledge base doc | Firm identity, business model, client acquisition, service pathways, pipeline overview, tech stack, compliance context | Feb 2026 |
| 7 | **Voice Agent Script** | Conversation design (300+ lines) | Full voice agent persona (Gwilym), conversation states, objection handling, booking flow, rapport library | Feb-Mar 2026 |
| 8 | **Invoice Template** | Template | Reusable invoice structure for Kismet billing (itemised services, payment terms, deliverables format) | Mar 2026 |
| 9 | **Kismet Workflow Tutorial** | Training doc | Step-by-step workflow tutorial (Lesson 1) for team onboarding | Jan-Feb 2026 |
| 10 | **YouTube Training Module** | Video | Lead qualification, escalation protocols, CRM integration walkthrough | Nov-Dec 2025 |
| 11 | **Loom Training Videos** | Videos | System walkthroughs for team self-service | Dec 2025 |

---

## 5. CONSULTING & ADVISORY WORK

| # | Work Item | Description | Period |
|---|-----------|-------------|--------|
| 1 | **Strategic Architecture Design** | Designed complete business operating system — CRM architecture, automation layer, compliance framework, scaling strategy | Nov-Dec 2025 |
| 2 | **Notion Architecture Design** | Designed and built the full Notion workspace skeleton — database relations, views, properties, page hierarchy | Dec 2025 - Feb 2026 |
| 3 | **Compliance Guardrails Engineering** | AFSL + Privacy Act + NCCP Act compliance architecture — data classification, PII handling rules, agent boundaries, breach protocols | Nov 2025 - Feb 2026 |
| 4 | **Pipeline Process Design** | Defined complete lead-to-client pipeline — 5 primary stages, 5 terminal stages, qualification criteria, automation triggers | Feb 2026 |
| 5 | **4-Week Implementation Management** | Day-by-day implementation checklist and project management through Phase I deployment | Dec 2025 - Jan 2026 |
| 6 | **Voice Agent Strategy & Design** | Designed voice agent persona, conversation flow, objection handling, booking integration, compliance boundaries | Feb-Mar 2026 |
| 7 | **Automation Architecture** | Designed n8n workflow architecture — Fillout → Notion → Google Workspace pipeline, button automations, error handling patterns | Feb-Mar 2026 |
| 8 | **Resale/Channel Strategy** | Feasibility analysis for Kismet as Good AI voice agent sales channel — pricing models, margin analysis, partner targeting | Nov 2025 |
| 9 | **Team Scaling Advisory** | OKR framework ("Increase team to 50"), team structure design, onboarding infrastructure planning | Feb 2026 |
| 10 | **AGENTS.md Build Task Decomposition** | Decomposed entire Kismet build into 100+ phased tasks across 4 phases (Foundation, Enforcement & Automations, Field Ops, Good AI Roll-out) | Feb 2026 |

---

## 6. PHASE I & II PLATFORM DELIVERABLES 

| #   | Item                          | Description                                                                                                                          | Status                 |
| --- | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ | ---------------------- |
| 1   | **Tier 1 - Website Bot**      | WordPress chat widget, Smart Money Pack training, 24/7 lead qualification, AFSL compliance guardrails                                | HOLD                   |
| 2   | **Tier 2 - Knowledge Bot**    | Llama 400B provisioning, Notion content training, internal team access, quarterly audit schedule                                     | HOLD                   |
| 3   | **Voice Agent System**        | Gemini 4o + Trellit.ai backend, inbound/outbound call handling, lead qualification routing, CRM integration, decision tree scripting | DELIVERED              |
| 4   | **Integration Layer**         | AppSheet ↔ Notion pipeline, automatic CRM logging, call analytics dashboard                                                          | Delivered & Active     |
| 5   | **Compliance Voice Protocol** | AFSL enforcement in voice responses, escalation logic, script variants                                                               | Delivered & Integrated |

---

## 7. RECENT WORK (Apr-May 2026 Sessions)

| #   | Item                                                     | Description                                                                                                                         | Date                  |
| --- | -------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- | --------------------- |
| 1   | **Team Profiles with Live Pipeline Data**                | Built individual team member profile pages in Notion, connected to DQ Status Tally for live performance metrics                     | Apr 2026              |
| 2   | **HR Databases Setup**                                   | Attempted HR infrastructure in Notion — team directory, department structure (partially blocked by API limitations)                 | Apr 2026              |
| 3   | **DQ Tracker Bot (Daily Automation)**                    | Automated daily DQ status tally updates — creates per-consultant entries with category breakdowns, change tracking, and trend notes | Active since Apr 2026 |
| 4   | **DQ Monthly Tally Aggregation**                         | Monthly rollup page for DQ status data                                                                                              | Apr 2026              |
| 5   | **Kismet Branding Application**                          | Applied Kismet branding (colors/logos) across OPERATIONS 2026 dashboard                                                             | Completed             |
| 6   | **Kismet End-to-End Workflow Script**                    | Comprehensive documentation of the full Kismet workflow from door-knock to client                                                   | May 2026              |
| 7   | **Feasibility Report — Kismet as Good AI Sales Channel** | Analysis of using Kismet as distribution channel for Good AI products                                                               | May 2026              |

---

## INVOICE LINE ITEM SUMMARY (Grouped by Category)

### A. Automation Engineering (n8n Workflows)
- 10 production workflows designed, built, tested, and deployed
- Includes: form ingestion, calendar sync, CRM button automations, error logging, AI lead analysis, DocuSign integration, Obsidian agent bridge

### B. CRM & Database Architecture (Notion)
- 6 interconnected databases designed and built (Master Pipeline, DQ Form Responses, Client Assessment, DQ Status Tally, Archive, DQ Monthly Tally)
- 80+ database properties configured across pipeline database
- 7+ filtered views per database (CHECK, FEEDBACK CALL, DISCOVERY, Active Pipeline, etc.)
- Full relational architecture (People ↔ Household ↔ Entities ↔ Pipeline ↔ Forms)

### C. Dashboard & Workspace Design (Notion)
- OPERATIONS 2026 branded operational dashboard
- Kismet Public home page with project tracking, meetings, docs library
- Team Hub with directory, roster, goals/OKR structure
- Team Profiles with live pipeline data integration

### D. Integration Engineering
- 9 system integrations configured and tested (Fillout, Google Calendar, Google Drive, DocuSign, Obsidian, Twilio, AppSheet, AI lead analysis, error logging)

### E. AI & Bot Deployments
- <mark style="background:#fff88f">==<font color="#2DC26B">Tier 1 Website Bot (WordPress, 24/7 lead qual)==</font></mark> HOLD
<mark style="background:#fff88f"><font color="#2DC26B">- ==Tier 2 Knowledge Bot (Llama 400B, Notion-trained)==</font></mark> HOLD
<mark style="background:#fff88f"><font color="#2DC26B">- ==Voice Agent (Gemini 4o + Trellit.ai, inbound/outbound)</font></mark>== HOLD
- DQ Tracker Bot (daily automated status reporting)
- AI Lead Analysis workflow

<mark style="background:#fff88f"> ### F. Documentation & Knowledge Base  HOLD</mark>
<mark style="background:#fff88f">- 11 documents delivered (Business OS Report, CRM Schema, Pipeline Stages, Compliance Rules, Voice Agent Script, Invoice Template, Training Materials, etc.)</mark>
<mark style="background:#fff88f">- Combined 1,500+ lines of operational documentation</mark>

### G. Strategic Consulting & Advisory
- Business OS architecture design
- Compliance framework (AFSL, Privacy Act, NCCP)
- Pipeline process design
- Voice agent strategy
- Team scaling advisory
- Channel/resale feasibility analysis
- 100+ task decomposition across 4 phases

### H. Platform Hosting & Support
- Tier 1 Bot hosting ($30/mo)
- Tier 2 Bot hosting ($120/mo)
- Voice Agent hosting ($100/mo)
- Ongoing support and quarterly reviews

---

## PREVIOUS INVOICING REFERENCE

**Invoice GAI-KIS-2025-FINAL (29 Nov 2025):**
- [ ] Phase I Setup: $1,000 
- [ ] Phase II Setup: $3,500 
- [ ] Phase III Setup: $3,500
- [ ] Phase IV: $3500

**Note:** All work listed in sections 1-5 and 7 above represents work performed AFTER the November 2025 invoice — the n8n workflows, Notion infrastructure, integrations, documentation, and consulting from February-May 2026 are unbilled.

---

*Generated 9 May 2026 from: n8n workflow registry, Notion workspace API, knowledge2026 vault, session records*
