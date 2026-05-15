# AP Technologies --- Centralized Intranet & Intelligence Platform

## Architecture Proposal | May 2026

### Prepared by Kevin Tan, KTG

---

## 1. The Problem

Data is scattered across 4 sites in 3 countries. ERP exports live in one system, quality records in spreadsheets, SOPs on shared drives, NPI specifications buried in email threads, training logs locked in HR systems, MES data accessible only on-site. There is no single source of truth. There is no cross-site visibility. Decision latency is measured in days, not minutes.

For a regulated manufacturer running 100+ concurrent NPI programs with tolerances of +/-0.0003", this is not just an efficiency problem. It is a compliance risk, a quality risk, and a competitive disadvantage. When a yield anomaly in Xiamen takes 48 hours to surface in Singapore, the cost is not just scrap --- it is delayed customer shipments, missed root-cause windows, and eroded OEM confidence.

Charles Tang's directive is clear: integrate whatever data exists today into a centralized intranet for better insights. This document defines exactly what that architecture looks like, how it is built, and what it delivers.

---

## 2. Proposed Architecture

The platform is a four-layer stack. Each layer has a distinct role, and each builds on the one below it.

```
Layer 4:  INTELLIGENCE          AI Agents + Copilot + Narrative Engine
Layer 3:  CENTRALIZED HUB       SharePoint Intranet (global + site hubs)
Layer 2:  INTEGRATION BACKBONE  n8n (connectors, transforms, orchestration)
Layer 1:  DATA SOURCES          ERP, MES, QMS, documents, spreadsheets, email
```

### Layer 1: Data Sources (What Exists Today)

These are the systems and repositories likely scattered across AP Technologies today. Phase 0 discovery will confirm the exact inventory; the architecture accommodates all of the following:

| Source Category | Typical Systems | Data Types | Sites |
|---|---|---|---|
| ERP | SAP Business One, Oracle NetSuite, or similar | Purchase orders, BOM, inventory, costing, sales orders | All (possibly different instances per site) |
| MES / Production | Proprietary or spreadsheet-based | Line output, batch records, cycle times, downtime events, equipment status | Xiamen (primary), Singapore, Bac Ninh (ramping) |
| QMS | Spreadsheets, Access databases, or dedicated QMS tool | NCRs, CAPAs, deviations, audit findings, supplier complaints, incoming inspection | All |
| Document Repositories | Shared drives (network or OneDrive), SharePoint doc libraries | SOPs, work instructions, drawings, specifications, validation protocols | All |
| Email / Teams | Microsoft 365 | Project communications, customer correspondence, engineering decisions, institutional knowledge | All |
| Spreadsheets | Excel files on shared drives | Production tracking, scheduling, inventory reconciliation, customer order status, parameter cards | All |
| HR / Training | HRIS platform or spreadsheets | Certification records, training logs, competency matrices | Singapore HQ, replicated locally |
| Customer Portals | OEM-specific platforms | Quality submissions, order management, complaint tracking | Irvine, Singapore |
| Informal Messaging | WhatsApp, WeChat | Cross-site operational communications, especially between Asia sites | All Asia sites |

### Layer 2: Integration Backbone (n8n)

n8n is the middleware that connects all data sources to the centralized hub. It runs as a self-hosted instance (or cloud-hosted with data residency controls) and handles all integration logic.

**Core Integration Patterns:**

- **API connectors** for ERP and QMS systems with structured APIs. REST or SOAP, authenticated via service accounts. Scheduled polling or webhook-triggered.
- **Database queries** for systems without APIs. Direct SQL connections to ERP/MES databases on a read-only basis, scheduled at defined intervals.
- **File watchers** for spreadsheet-based workflows. Monitor specific SharePoint libraries or shared folders for new or modified Excel files. Parse, validate, and route data to the appropriate hub.
- **Email/Teams parsing** for knowledge capture. Monitor specific channels or mailboxes for engineering decisions, customer communications, and project updates. Extract structured data and route to relevant SharePoint lists.
- **Data transformation and normalization** across sites. Xiamen data may arrive in Mandarin with metric units; Irvine data in English with imperial. n8n handles translation, unit conversion, and schema normalization before writing to the hub.
- **Event-driven triggers** for real-time updates. MES downtime events, NCR creation, CAPA escalation --- these push to the hub immediately rather than waiting for a scheduled sync.

**n8n Workflow Categories:**

| Workflow Type | Trigger | Frequency | Example |
|---|---|---|---|
| Data sync | Scheduled | Every 15 min to 4 hours | ERP order status pull, MES production counts |
| Document routing | File change event | Real-time | New SOP uploaded to shared drive triggers review workflow |
| Alert escalation | Threshold breach | Real-time | Yield drops below CpK threshold, NCR opened on critical line |
| Report generation | Scheduled | Daily / Weekly | Monday Morning Narrative assembly, daily production summary |
| AI agent backend | On-demand (user query) | Real-time | NPI Parameter Bot receives query, n8n orchestrates data retrieval |

### Layer 3: Centralized Hub (SharePoint Intranet)

SharePoint serves as the presentation layer --- the single front door for all employees across all sites. The March 2026 SharePoint redesign (Discover/Publish/Build categories with native AI integration) makes this the right time to build.

#### Global Sites (Accessible to All Employees)

**Home**
The landing page. Company-wide announcements, cross-site KPI summary cards (today's production output, open CAPAs, NPI programs in flight), quick links to most-used resources, and a global search bar powered by SharePoint's native AI.

**Knowledge Base**
A searchable, version-controlled repository for all technical documentation:
- SOPs and work instructions, organized by process family (extrusion, braiding, tipping, assembly, testing)
- Material specifications and approved supplier/grade lists
- NPI parameter cards: die geometry, temperature profiles, pull speeds, material lots, validated by engineering
- Equipment manuals and maintenance procedures
- Regulatory reference documents (FDA guidance, ISO 13485 clauses, QMSR requirements)

All documents follow the ISO 13485-compliant lifecycle: Draft, In Review, Approved, Obsolete. Automated approval workflows via Power Automate. Full version history with audit trail. Access control by role and site.

A dedicated SharePoint Agent is deployed on this site, enabling natural-language queries in Teams: "What PEBAX grade did we use for the tri-layer co-extrusion on Project X?" returns the relevant parameter card with material lot traceability.

**NPI Tracker**
All 100+ concurrent programs visible in a single view:
- SharePoint List as the data backbone, with columns for program name, customer, site, engineer, stage (feasibility, development, verification, validation, transfer), target dates, blockers
- Power BI embedded dashboard showing programs by stage, days-in-stage distribution, engineer allocation heatmap, blocker summary
- Filtered views by customer, site, engineer, or stage
- n8n keeps this synchronized with whatever project tracking tools are currently in use

**Quality Hub**
Connected to QMS data via n8n:
- Open CAPAs by site, age, and category, with color-coded SLA status
- NCR tracker with trend analysis (NCRs per 1000 units by site/line/month)
- Deviation log with root-cause categorization
- Audit calendar (internal, customer, registrar) with readiness checklist
- Compliance dashboard: document review status, training compliance %, overdue items
- Supplier quality scorecards: incoming inspection pass rates, response times, re-qualification status

**Supplier Portal**
- Supplier scorecards with rolling 12-month performance metrics
- Purchase order status (synced from ERP)
- Incoming inspection results and trends
- Re-qualification timeline and document status
- Approved supplier list with scope and expiry dates

**Training Center**
- Certification status by person, site, and role
- Required training matrix by regulatory jurisdiction (FDA, NMPA, Vietnam MOH, Singapore MDA)
- Expiry alerts: 30/60/90-day warnings pushed to managers via Teams
- Training completion records with electronic signatures for audit traceability

#### Site-Specific Hubs

Each manufacturing site gets its own SharePoint hub, tailored to local operations:

**Singapore Hub** --- R&D updates, PTFE/FEP production metrics (extrusion line utilization, material consumption rates), material availability for downstream sites (Xiamen, Bac Ninh), prototype lab scheduling, patent and IP tracking.

**Xiamen Hub** --- Assembly production dashboards (10+ extrusion lines), real-time line utilization from MES, quality metrics by line and shift, maintenance scheduling, shift handover logs. Language: bilingual English/Mandarin interface.

**Bac Ninh Hub** --- ISO 13485 certification progress tracker (gap closure percentage, audit schedule, corrective action status), ramp-up metrics (headcount, training completion, line qualification status), knowledge transfer tracking from Singapore (SOPs transferred, trainers deployed, competencies verified).

**Irvine Hub** --- NPI prototyping status for US-based OEM customers, customer-facing development updates, regulatory submission tracking for FDA-pathway projects, local lab equipment and capacity calendar.

#### Role-Based Views

The same underlying data, surfaced differently depending on who is looking:

| Role | Primary View | Key Metrics | Delivery |
|---|---|---|---|
| Executive (Charles) | Three-pillar dashboard + Monday narrative | Revenue pipeline, operational health, talent metrics | Power BI + Teams/email narrative |
| Engineering | NPI status + parameter cards + technical docs | Programs by stage, parameter search, blocker flags | SharePoint + Teams bot |
| Quality (Sean) | Compliance dashboard + open items | CAPAs by age, NCR trends, audit readiness score | SharePoint + escalation alerts |
| Sales/Commercial (Russell) | Pipeline + customer order status | OTD %, programs by customer, revenue forecast | Power BI + SharePoint |
| Site Managers | Site-specific operational dashboard | Line utilization, yield, headcount, training compliance | Site hub + mobile view |

### Layer 4: Intelligence (AI Agents + Microsoft Copilot)

This is the layer that transforms a document repository into a decision-support platform.

#### SharePoint Agents (Native, May 2026)

Each major hub deploys a SharePoint Agent --- an AI that is grounded in that site's data and can be chatted with directly in Teams:

- **Knowledge Base Agent**: answers questions about SOPs, material specs, and validated parameters. Grounded in all approved documents in the Knowledge Base site.
- **Quality Agent**: queries open CAPAs, NCR trends, audit status. Grounded in Quality Hub data.
- **NPI Agent**: project status, engineer assignments, timeline queries. Grounded in NPI Tracker data.

These agents use SharePoint's native AI integration (formerly Knowledge Agent, rebranded as "AI in SharePoint" in the March 2026 update). They provide citations to source documents, and AI citation analytics (available mid-May 2026) track which documents are most queried.

#### n8n AI Agents (via Microsoft Agent 365)

For queries that span multiple data sources or require logic beyond document retrieval, n8n builds the agent backend and surfaces it through Microsoft Agent 365 (agents get Entra ID, appear in Teams, can be @mentioned):

**NPI Parameter Bot**
- Queries across all NPI parameter cards and historical batch records
- Given a new project specification, retrieves the 3-5 most similar past projects with their validated parameters
- Returns: die geometry, temperature profiles, pull speeds, material lots, yield data, known failure modes
- Role-gated: engineers only. Audit-logged for traceability.

**Compliance Query Bot**
- Answers regulatory questions across all jurisdictions AP Tech operates in
- Grounded in regulatory reference library (FDA 21 CFR 820, ISO 13485:2016, QMSR Feb 2026, NMPA regulations, Vietnam MOH requirements, Singapore MDA)
- Example: "What are the design control requirements for a Class II catheter under QMSR?"

**Status Bot**
- Any employee can ask: "What is the status of Order #12345?"
- n8n queries ERP for order status, MES for production progress, QMS for any open quality holds
- Returns a unified cross-site answer in natural language

#### Monday Morning Narrative

The highest-impact deliverable for executive decision-making:

- **Trigger**: Every Monday at 07:00 SGT, n8n workflow fires
- **Data assembly**: Queries Microsoft Fabric for the prior week's production data, quality metrics, NPI milestones, and financial indicators across all 4 sites
- **Anomaly detection**: Flags statistically significant deviations --- yield drops, CAPA spikes, schedule slippage, headcount changes
- **Narrative generation**: LLM (Claude or GPT-4o) generates a structured 1-page brief:
  - What happened last week (key events by site)
  - What is anomalous (deviations from baseline, with magnitude and context)
  - What needs attention (items requiring executive decision or escalation)
- **Delivery**: Pushed to Charles via Teams message and email. Not a dashboard to open --- a brief to read on a phone over coffee.
- **Feedback loop**: Charles can reply to the message with follow-up questions; the agent retrieves additional detail on demand.

#### Three-Pillar Dashboards (Power BI + Microsoft Fabric)

These are the persistent analytical views, powered by Microsoft Fabric as the unified data backend and rendered in Power BI:

**Pillar 1: OEM Pipeline + NPI Velocity**
- Programs by stage (feasibility through transfer), with days-in-stage distribution
- Parameter card completeness percentage by program
- Blocker map: what is blocking which programs, categorized (tooling, material, customer approval, quality hold)
- Engineer allocation: who is on what, utilization percentage, capacity forecast
- Revenue pipeline: programs weighted by stage probability and contract value

**Pillar 2: Operational Health**
- Yield by site, line, material family, and lot --- with CpK trend overlay
- Scrap rate and rework rate, trended monthly with 12-month rolling average
- Equipment downtime: planned vs. unplanned, by line and cause category
- Cross-site comparison: same product family manufactured at Singapore vs. Xiamen, normalized metrics

**Pillar 3: Talent + Knowledge**
- Engineer utilization across all sites
- Knowledge Base query volume by topic (proxy for engagement and knowledge gaps)
- Training compliance percentage by site and role
- Certification expiry countdown: who needs re-certification, by when, for what
- Bac Ninh ramp-up index: composite metric of hiring, training, and qualification progress

---

## 3. ISO 13485 Document Control Compliance

SharePoint, when properly configured, satisfies ISO 13485 Clause 4.2.4 (Control of Documents) and Clause 4.2.5 (Control of Records). The new QMSR (effective February 2026), which aligns FDA 21 CFR 820 with ISO 13485, means a single document control architecture satisfies both regulatory frameworks simultaneously.

**Document Lifecycle Implementation:**

| Stage | SharePoint Feature | Compliance Requirement Met |
|---|---|---|
| Draft | Content Approval enabled, minor versioning | Documents identified before approval |
| Review | Power Automate approval workflow, role-based reviewers | Adequate review by authorized personnel |
| Approved | Major version published, approval metadata stamped | Approval prior to issue, authorized signoff |
| Distributed | Automatic notification to affected parties via Teams/email | Available at points of use |
| Revised | New draft version created, previous approved version retained | Changes identified, re-approved before use |
| Obsolete | Retention label applied, removed from active views, retained per policy | Prevented from unintended use, retained for defined period |

**Key Controls:**
- Version history provides a complete audit trail of every change, by whom, and when
- Content approval gates ensure no document reaches "published" status without authorized sign-off
- Information Rights Management (IRM) prevents unauthorized printing, forwarding, or editing of controlled documents
- Retention policies enforce regulatory retention periods (minimum 2 years post-device-lifetime for FDA; defined per document type for ISO 13485)
- SharePoint audit logs provide evidence of document access and distribution for regulatory audits

---

## 4. Data Sovereignty Architecture

Operating across Singapore, China, Vietnam, and the United States introduces data localization obligations that the architecture must respect by design.

**Architectural Principle**: The intranet is a VIEW LAYER. Regulated data can remain in-region. n8n pulls, transforms, and presents aggregated or anonymized views centrally --- it does not necessarily centralize storage of regulated source records.

| Jurisdiction | Regulation | Requirement | Architecture Response |
|---|---|---|---|
| Singapore | PDPA | Consent-based, no strict localization mandate | SharePoint tenant primary location. Fabric data lakehouse hosted here. |
| China (Xiamen) | PIPL + Data Security Law | Certain categories of personal and "important" data must remain in-country | Local systems remain in-country. n8n connects to Azure China region (operated by 21Vianet) or queries local databases directly. Aggregated production metrics (no PII) synced to central hub. Cross-border transfer impact assessment completed in Phase 0. |
| Vietnam (Bac Ninh) | Cybersecurity Law (2018) + Decree 13 | Data localization for certain data categories; local storage required during processing | Local operational data stored on-premises or in local cloud. n8n pulls aggregated views to central hub. Similar pattern to China. |
| United States (Irvine) | HIPAA (if applicable), ITAR (if classified programs), state privacy laws | Standard M365 data residency; ITAR requires US-person access controls if applicable | Standard M365 US data center. If ITAR-controlled programs exist, separate SharePoint site collection with US-person-only access and Azure Government consideration. |

**Implementation:**
- n8n workflows tag data by origin jurisdiction and classification
- SharePoint sites inherit data residency from the M365 tenant geography, with multi-geo configuration if required
- Fabric lakehouse can be configured for regional data boundaries
- Audit logs demonstrate data lineage and cross-border transfer compliance

---

## 5. Phased Implementation

### Phase 0 --- Discovery (Weeks 1-2)

| Activity | Output |
|---|---|
| Inventory all data sources across 4 sites | Data landscape map: system name, type, location, owner, API availability |
| Map current document management practices | As-is document flow diagrams per site |
| Assess SharePoint maturity and existing usage | Gap analysis: current state vs. target architecture |
| Identify quick-win content for initial migration | Prioritized content backlog (top 20 SOPs, active NPI parameter cards) |
| Data sovereignty review for China and Vietnam | Preliminary compliance assessment and architecture constraints |

**Deliverable**: Data landscape map + SharePoint architecture design document + Phase 1 implementation plan.

### Phase 1 --- Foundation (Weeks 3-6)

| Activity | Output |
|---|---|
| Deploy SharePoint site structure (Home + 4 site hubs + Knowledge Base + NPI Tracker + Quality Hub) | Live intranet with navigation, branding, and permissions |
| Configure document control lifecycle (approval workflows, version control, retention labels) | ISO 13485-compliant document management |
| Deploy n8n and build connectors to 2-3 core systems (ERP + primary QMS + one MES instance) | First live data feeds flowing to SharePoint |
| Seed Knowledge Base with top 50 SOPs and 20 active NPI parameter cards | Searchable technical documentation |
| Deploy first SharePoint Agent (Knowledge Base) in Teams | Engineers can query documentation via chat |

**Deliverable**: Working intranet with initial content, live data from core systems, first AI agent operational.

### Phase 2 --- Population and Integration (Weeks 7-12)

| Activity | Output |
|---|---|
| Build remaining n8n integrations (all ERP instances, MES at all sites, HR/training, supplier data) | All data sources connected |
| Migrate documents from shared drives, with metadata tagging and lifecycle assignment | Historical documentation accessible and controlled |
| Deploy Power BI dashboards (3 pillars) connected to Microsoft Fabric | Executive and operational visibility live |
| Configure role-based views for all persona types | Tailored experiences for each role |
| Train site champions (2 per site) on content management and agent usage | Local ownership of content and adoption |
| Build remaining site-specific hubs with localized content | All 4 sites with operational dashboards |

**Deliverable**: Fully populated intranet with live data feeds from all sources, operational dashboards, trained site champions.

### Phase 3 --- Intelligence (Months 4-6)

| Activity | Output |
|---|---|
| Deploy NPI Parameter Bot, Compliance Query Bot, Status Bot via n8n + Agent 365 | AI agents accessible in Teams across all sites |
| Build and test Monday Morning Narrative workflow | Weekly executive brief delivered automatically |
| Configure advanced Fabric analytics (anomaly detection, trend forecasting) | Proactive alerting on yield, quality, and schedule deviations |
| Enable cross-site search across all connected data sources | Unified search experience |
| Tune agent accuracy based on usage data and feedback | Continuous improvement of AI responses |
| Deploy AI citation analytics for Knowledge Base usage tracking | Visibility into knowledge gaps and documentation ROI |

**Deliverable**: AI-powered intelligence platform with proactive insights, automated executive briefing, and cross-site search.

---

## 6. What It Looks Like When It Is Done

**Scenario 1: Engineering knowledge retrieval**
An engineer in Xiamen needs to set up a new PEBAX extrusion run for a tri-layer catheter. She @mentions the NPI Parameter Bot in Teams: "Similar projects to [customer]'s tri-layer catheter?" The bot returns parameter cards from 3 previous similar runs --- including die geometry, validated temperature profiles, pull speeds, material lots, and known failure modes. Setup time drops from 2 days of email-chasing to 10 minutes.

**Scenario 2: Commercial preparation**
Russell Nagy checks the Pipeline dashboard 15 minutes before an OEM call. He sees real-time status of every active program for that customer: stage, days-in-stage, blocker flags, engineer assigned. No need to email 4 site leads and wait for responses. He walks into the call with current, accurate information.

**Scenario 3: Quality oversight**
Sean Tang opens the Quality Hub on Monday morning. All open CAPAs across all 4 sites are visible, color-coded by age (green under 15 days, yellow 15-30, red over 30). Automated escalation has already flagged 2 CAPAs at Xiamen that breached the 30-day SLA over the weekend. He clicks through to the root-cause analysis and assigns additional resources before the daily standup.

**Scenario 4: Executive visibility**
Charles reads his Monday Morning Narrative on his phone over coffee at 07:15 SGT. In 2 minutes, he knows: Xiamen Line 7 yield dropped 4% last week (material lot change identified as probable cause), Bac Ninh completed ISO 13485 Gap 14 of 22, the NPI program for [OEM customer] hit a 10-day blocker waiting on customer approval, and 3 engineer certifications expire this month. He replies to the message: "More detail on Line 7 yield?" and gets a follow-up within seconds.

**Scenario 5: Knowledge transfer**
A new engineer at Bac Ninh searches the Knowledge Base for "PTFE etching parameters for 0.018 inch ID." She finds Singapore's validated process with full documentation --- temperature, time, concentration, rinse protocol, and the deviation report from when they optimized it 18 months ago. Instead of waiting 2 days for an email reply across time zones, she has what she needs in 30 seconds.

---

## 7. Investment

| Phase | Scope | Estimated Investment (S$) | Timeline |
|---|---|---|---|
| Phase 0 | Discovery + architecture design | Included in S$15-25K discovery engagement (covers both automation and intranet workstreams) | Weeks 1-2 |
| Phase 1 | Foundation: SharePoint structure, document control, initial integrations, first AI agent | S$25-40K | Weeks 3-6 |
| Phase 2 | Population: full integration, document migration, Power BI dashboards, role-based views, training | S$25-40K | Weeks 7-12 |
| Phase 3 | Intelligence: AI agents, Monday Narrative, advanced analytics, cross-site search | S$15-25K | Months 4-6 |
| **Total intranet platform** | | **S$60-100K** (subset of overall S$195-295K engagement) | **6 months** |

**Ongoing Licensing Costs:**

| Item | Cost | Notes |
|---|---|---|
| M365 E3/E5 | Likely already in place | Includes SharePoint, Teams, Power Automate, basic Power BI |
| M365 Copilot | US$30/user/month | Targeted deployment: leadership, engineering leads, quality managers. Estimated 15-25 users = US$450-750/month |
| M365 E7 Frontier Suite | US$99/user/month | Optional upgrade from May 2026 for power users requiring advanced AI agents (Researcher, Analyst, Facilitator) |
| Microsoft Fabric | Consumption-based | Pay-per-use for compute and storage. Estimated US$500-2,000/month depending on data volume and query frequency |
| n8n | Self-hosted (infrastructure cost) or cloud at EUR 50-300/month | Depends on hosting model and workflow volume |
| **Ongoing platform cost** | **Included in managed services retainer** | KTG manages integrations, agent tuning, and platform health |

---

## 8. Risk Considerations

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| **Migration disruption** | Medium | High | Do not attempt a big-bang migration. Phase 1 starts with new content only. Historical documents migrate in Phase 2 with metadata cleanup. Old systems remain accessible during transition. |
| **Low adoption** | Medium | High | AI agents in Teams eliminate the "new tool" barrier --- employees interact in the tool they already use. Site champions drive local adoption. Quick wins (parameter search, order status) demonstrate value in Week 6. |
| **Data quality** | High | High | Phase 0 data audit is critical. Establish data ownership per source system. n8n validation rules reject malformed data before it enters the hub. Garbage in, garbage out --- this risk is managed, not eliminated. |
| **China data sovereignty (PIPL)** | Medium | High | Architect for data residency from Day 1. Budget 2-3 weeks in Phase 0 for PIPL compliance review with local counsel. The "view layer" architecture minimizes cross-border data transfer. |
| **Vietnam data localization** | Low-Medium | Medium | Similar pattern to China. Bac Ninh is early-stage --- establish compliant architecture before data volume scales. |
| **Over-engineering** | Medium | Medium | Start with what people need today. The SharePoint Agent answering "where is the SOP for X?" is more valuable than a sophisticated anomaly detection model. Add complexity in Phase 3 only after Phases 1-2 prove adoption. |
| **AI accuracy** | Medium | Medium | All AI agents cite their sources. Engineers and quality staff verify AI responses against source documents. Agent responses carry a disclaimer for regulated decisions. Continuous tuning based on user feedback. |
| **Scope creep** | High | Medium | The phased model contains this. Each phase has defined deliverables and a gate review before proceeding. If Phase 1 reveals the data landscape is more complex than expected, Phase 2 timeline adjusts --- scope does not expand silently. |

---

## Appendix: Technology Stack Summary

| Layer | Technology | Role |
|---|---|---|
| Data Sources | ERP, MES, QMS, SharePoint drives, Excel, email, HR systems | Source of truth for operational data |
| Integration | n8n (self-hosted or cloud) | Middleware: connectors, transforms, orchestration, AI agent backends |
| Data Platform | Microsoft Fabric | Unified lakehouse for cross-source analytics, real-time processing |
| Presentation | SharePoint (March 2026 experience) | Intranet front-end, document control, search, AI agent hosting |
| Dashboards | Power BI | Three-pillar dashboards, role-based views, embedded in SharePoint |
| Automation | Power Automate | Document approval workflows, notification routing, escalation rules |
| AI - Native | SharePoint Agents (AI in SharePoint) | Document-grounded Q&A, deployed per hub, accessible in Teams |
| AI - Custom | n8n AI workflows via Microsoft Agent 365 | Cross-source agents (NPI Parameter Bot, Compliance Bot, Status Bot) |
| AI - Narrative | Claude / GPT-4o via n8n | Monday Morning Narrative generation |
| Collaboration | Microsoft Teams | Primary interface for agent interaction, notifications, and daily work |
| Identity | Microsoft Entra ID | SSO, role-based access control, agent identity, audit logging |
