---
title: NotebookLM Extract — AP Technologies Group Strategic Blueprint
date: 2026-05-12
source_notebook_url: https://notebooklm.google.com/notebook/e4924aa0-9011-4f51-9233-61099ad11f92?authuser=1
source_notebook_id: ap-technologies-group-strategic-blueprint
purpose: Working dump of NotebookLM Q&A for coworker to draft AP Tech ops / agentic-tech docs against. Each section = one query. Citation numbers preserved from source.
status: complete (5 queries written, gaps in source flagged in-line)
---

# NotebookLM Extract — AP Technologies Group

> Each section is the verbatim answer NotebookLM returned for the question shown.
> Citation markers (numbers, `more_horiz`) are preserved — they reference sources inside the notebook.
> Do not treat this as final copy — it is raw research for drafting.

---

## 1. Operational transformation roadmap — Predictive Maintenance, Machine Vision, PINNs

**Question:** Detail the three operational programs (PdM, machine vision defect detection, PINNs for polymer co-extrusion). For each: bottleneck solved, phases, KPIs/targets, ROI/payback, target facility, infrastructure required, risks/failure modes.

### A) Predictive Maintenance (PdM) for Precision Equipment
- **Bottleneck:** Reactive + calendar-based preventive maintenance causes disruptive unplanned downtime across **10+ extrusion lines**, threatening **100+ concurrent NPI projects**. Degradation correlates to clinical failures (asymmetrical catheter wall thickness, preferential bending planes) [1, 2, 3].
- **Phases:** "Automation-first" approach — embed predictive sensors during **new equipment installation** in the Vietnam greenfield rather than retrofitting older lines [4, 5].
- **KPIs/Targets:** **25% reduction in unplanned downtime**, **3% increase in available uptime**, replace MTTR with condition-based tracking [2, 8].
- **ROI/Payback:** **$500,000+ annual savings** [9, more_horiz]:
  - $150K–$250K from downtime recovery
  - $90K–$180K from reduced quality scrap (esp. Nitinol)
  - $80K–$120K labour efficiency
  - ~$35K eliminated emergency-repair premiums [8, more_horiz]
- **Target facility:** **Bac Ninh, Vietnam** first (new equipment install) [4], then high-volume extrusion lines in **Xiamen, China** [3, 7].
- **Infrastructure:** vibration analysis, motor current signature monitoring, thermal imaging, **acoustic emission monitoring (braiding clusters)**, real-time tension sensors [14, more_horiz].
- **Risk:** AP Tech runs highly customised proprietary equipment that lacks standard data interfaces and has **no commercial failure-signature databases** — must build proprietary predictive models from scratch [15].

### B) AI-Powered Machine Vision for Defect Detection
- **Bottleneck:** Human visual inspection degrades, fatigues, and fundamentally cannot catch microscopic surface irregularities on **0.0005" ultra-thin walls** [13, more_horiz]. Standard monochrome cameras fail on reflective/translucent polymers (PFA, FEP) — high false-positive rate [17, 19].
- **Phases (90-day scaffold):**
  - **Phase 2 (Days 46–75):** Build 3D-printed indirect lighting housings, deploy multi-camera array on primary extrusion line, train YOLOv5, draft **Pre-Determined Change Control Plan (PCCP)** [20].
  - **Phase 3 (Days 76–90):** Push validated AI model to edge hardware [21].
- **KPIs/Targets:**
  - **40% improvement** in defect capture
  - **50% reduction** in human inspection time [13, more_horiz]
  - Push **CpK** from baseline **1.33 (~63 PPM)** to world-class **1.67+ (<1 PPM)** [23, more_horiz]
  - **AI inference ≤ 20ms latency**, **mAP@.5 = 99.24%** [28]
- **ROI/Payback:** Suppresses process variance → drastically reduces Cost of Poor Quality (COPQ) — eliminates quarantine holds, scrap costs, field-failure liability [25, 27].
- **Target facility:** Pilot on a primary extrusion line; scale to high-volume lines in **Xiamen + Bac Ninh** [20].
- **Infrastructure:** 4 high-res USB cameras (360° monitoring), custom 3D-printed darkroom housings with surface-emitting LEDs + polycarbonate diffusers, **YOLOv5 CNNs**, **Intel i9 + NVIDIA RTX 2080Ti or better GPU** edge compute [19, 28].
- **Risks (FDA QMSR — 5 immediate OAI sanctions):**
  1. Unregulated model drift without a PCCP
  2. Cybersecurity / unencrypted data pipeline
  3. No human-in-the-loop reverification for low-confidence predictions
  4. Black-box transparency failures (no root-cause traceability)
  5. Unvalidated training-data bias (e.g. AI trained in Singapore climate fails in Vietnam humidity) [30, more_horiz]

### C) Physics-Informed Neural Networks (PINNs) for Polymer Co-Extrusion
- **Bottleneck:** Multi-layer co-extrusion suffers **microscopic layer delamination** (e.g., PTFE liner / Pebax outer jacket) — invisible to surface cameras. Traditional ML needs huge datasets and fails to generalise to new polymer blends or extrusion speeds [34, 35].
- **Phases:** Forward-horizon capability — **6–12 months of process data collection + PhD-level modelling**, outside the 90-day solo-architect window [36]. Pilot initiation in **Phase 3 (Days 76–90)** — instrument an extrusion line with thermal sensors, feed pilot PINN framework [21].
- **KPIs/Targets:** Academic PINN models show **74.8% accuracy improvement** over single-network PINNs in complex 3D fluid channels [37]. End goal: **zero-defect environment** aligned with **CpK 1.67–2.0** [24, more_horiz].
- **ROI/Payback:** Eliminates massive scrap-related losses, removes destructive testing — enables 100% quality assurance [34, more_horiz].
- **Target facility:** Mass deployment in **Xiamen + Bac Ninh**; data gathering / heavy compute pioneered where engineering density is highest (no single facility explicitly named) [21].
- **Infrastructure:** Embeds **Navier-Stokes fluid dynamics + Fourier heat conduction laws** directly into NN loss function. Hardware: **Distributed Thermal Sensor (DTS) arrays** (external cooling rates), **acoustic emission sensors** (melt-pool micro-friction) [34, 35].
- **Risks:** Flagged **"Low" production-proven confidence** — validated in academic literature, lacks commercial medical catheter case studies [41]. **"Low" solo-delivery feasibility** — requires specialised cross-functional pod (ML engineers + SOTA extrusion engineers) [21, 36].

---

## 2. n8n automation workflows — Purchasing, RFQ, Deviation Management

**Question:** Detail proposed n8n workflows for (a) purchasing, (b) RFQ processing, (c) deviation management. For each: pain point + cycle time, exact trigger, node sequence, systems integrated, approval gates, KPI targets, ISO 13485 / FDA QMSR compliance logging, named risks.

### A) Purchasing Workflow
- **Pain point:** Purchasing acts as manual relay between engineers and suppliers — **30+ emails per PO**, sequential bottleneck, **~2 weeks** from request to confirmation [1, more_horiz].
- **Trigger:** Engineer submits purchase request with material specs via chat interface or email [5, 6].
- **Node sequence:**
  1. **Request Parser** — extracts specs/quantities/constraints via NLP [5]
  2. **Supplier Matcher** — queries internal DB + web search (incl. **1688.com**) [5, 7]
  3. **Communication Hub** — drafts outreach emails English/Chinese, manages responses [8]
  4. **Negotiation Engine** — compares quotes (price + lead time) [7, 8]
  5. **Follow-up Scheduler** — monitors response times, fires reminders [8]
  6. **Order Tracker** — updates order status / milestones [8]
  7. **Conversation Logger** — writes full interaction to structured Markdown file [6, 8]
- **Systems integrated:** PostgreSQL + pgvector (internal supplier DB) [9, 10]; Microsoft Graph API or SMTP/IMAP (dedicated AI email account) [9, 11]; Baidu / 1688.com / Alibaba APIs [9, 10]; ERP / Inventory System [9]; React frontend/chat [10]; Git repo or S3 (Markdown storage) [10].
- **Approval gates:** MVP phase requires **mandatory human approval before any AI-drafted email goes to a supplier** [6, 12]. Purchasing dashboard for oversight; escalation rules for high-value, overdue, or low-confidence specs [8, more_horiz].
- **KPI targets:**
  - Cycle time: **~2 weeks → 2–3 days** [14]
  - Email volume: **−80%** (30+ → 3–5 per purchase) [14]
  - Supplier coverage: **3× increase** (1–2 sequential → 10–20+ in parallel) [14]
  - Error rate: near zero [14]
- **Compliance/audit:** **Conversation Logger** records every interaction in timestamped Markdown, organised per PO, stored in version control [6, more_horiz].
- **Risks:**
  - **High:** AI sending incorrect specs to suppliers [12].
  - **Medium:** Supplier resistance to AI emails; Chinese internet access restrictions / data quality; over-reliance on AI without team oversight [12, 13].
  - **Low–Medium:** Internal DB integration complexity [13].

### B) RFQ Processing Workflow
- **Pain point:** Engineers manually review specs, build DFM checklists in Excel, check team availability via WhatsApp/Teams, route quote approvals via email. **~4 hours labour per RFQ**, **3–7 business days turnaround** [15, more_horiz].
- **Trigger:** OEM submits RFQ document via email or customer portal form [15, 16].
- **Node sequence:**
  1. **Extraction (M365 Copilot/HTTP):** Parses RFQ — OD/ID tolerances, polymer type, regulatory class, volume [15, 16]
  2. **Document Generation (SharePoint node):** Auto-populates DFM checklist + pre-fills standard pricing/lead times into quote template [15, 16]
  3. **Availability Check:** Queries engineer calendars + material expertise [16]
  4. **Routing & Notification (Teams node):** Routes risk flags + quote to assigned NPI engineer via MS Teams [15, 16]
- **Systems integrated:** Email, Microsoft Teams, SharePoint (templates + DFM lists), M365 Copilot (spec extraction) [16].
- **Approval gates:** Auto-generated DFM + quote require **one-click sign-off + human review** by assigned engineer via Teams before advancing [15, 16].
- **KPI targets:**
  - Cycle time: **3–5 days → same day** [16] (or 1–2 days [17])
  - Throughput: **Reclaim 15–20 hrs/week** of engineering/sales capacity [16]
- **Compliance/audit:** Design input extraction + approvals must comply with **QMSR traceability + document control (ISO 13485 Clause 4.2)**. Workflow creates timestamped digital audit trails for every decision [18, 19].
- **Risks:** Lack of OEM spec format standardisation (requires robust parsing logic) [20]; integration complexity/scoping [19].

### C) Deviation Management Workflow
- **Pain point:** Paper NCRs on extrusion line; QA manually logs CAPAs in QMS; engineers notified via hallway/email; quarterly manual spreadsheet trending — **zero real-time visibility** [16, 21].
- **Trigger:** Operator or automated system logs deviation digitally in **eQMS** (fires n8n webhook) [16, 22].
- **Node sequence:**
  1. **Webhook trigger** — captures deviation event [16]
  2. **AI Classifier (Function/HTTP)** — evaluates root cause category (dimensional, contamination) → routes to correct CAPA owner [22]
  3. **Integration (QMS API)** — auto-creates CAPA record [16]
  4. **Draft Generation (RAG Query)** — drafts CAPA pulling similar historical deviations from RAG knowledge corpus [22]
  5. **Notification (Teams node)** — alerts assigned engineers by program assignment [16]
  6. **Write-back (Power BI / Fabric)** — updates real-time deviation trend dashboard [16]
- **Systems integrated:** eQMS (API connector), Microsoft Teams, Power BI (dashboards), Microsoft Fabric (cross-site aggregation), RAG historical deviation DB [16, 22].
- **Approval gates:** **Human-in-the-loop mandatory at every quality gate**. AI assists with classification + root-cause draft; human quality managers must explicitly **approve CAPA closures** [23].
- **KPI targets:**
  - **57% faster** CAPA resolution [22]
  - Reclaim **10–15 hrs/week** of quality engineering capacity [16]
- **Compliance/audit:** Timestamped digital audit trails, logged decisions, tracked document versions — critical for **FDA QMSR compliance (FDA CP 7382.850 audits)** [19, 24]. **A defect failing to auto-trigger a CAPA = "integration failure" → severe Situation 1 OAI penalties** [25, 26].
- **Risks:**
  - Historical CAPA data quality + eQMS API access limits during setup [20]
  - **FDA/QMSR validation:** Workflow must be built with rigorous **IQ/OQ/PQ documentation from day one**; final execution of validation can be deferred until the automation pattern is proven [19].

---

## 3. AI-driven centralised intranet (RAG) — corpus, retrieval, security, governance

**Question:** Describe the RAG intranet. Cover: problem solved + size metrics; source corpus; retrieval architecture (vector store, chunking, embeddings, reranker); generation layer (LLM, agentic patterns); security/access (RBAC, residency, encryption); deployment platform (per-site vs global); governance (freshness, conflicting docs); KPIs + FDA/ISO compliance posture.

### 1. Business Problem + Size Metrics
- Addresses tacit engineering knowledge loss driven by high turnover — **Singapore attrition 19.3%**, regional MedTech engineering turnover **~25%** [1, 2, 3].
- AP Tech: **70+ engineers**, **100+ concurrent NPI programs**, **200–500 employee base**, extreme tolerances ±0.0003" [4, 5, 6, 7].
- Documents fragmented across **4 sites in 3 countries** [8]. Data silos: ERP exports, spreadsheet quality records, shared-drive SOPs, informal WhatsApp chats [8, 9].
- RAG captures "silent expert" knowledge (e.g. proprietary polymer extrusion parameters) so sudden departures don't derail OEM production [10, 11].

### 2. Source Corpus
- **Systems:** ERPs (SAP, NetSuite), MES, QMS, HRIS, customer portals, MS Teams, email, informal messaging (WeChat/WhatsApp) [9].
- **Document repos:** SharePoint document libraries, shared network / OneDrive drives [9].
- **File formats / content:** PDF, Word, Excel — SOPs, work instructions, extrusion run cards, deviation reports, CAPAs, COA templates, DFM checklists, regulatory reference docs (ISO 13485, FDA 21 CFR 820) [12, 13, 14, 15, 16].

### 3. Retrieval Architecture
- **Vector store:** proprietary, secured vector DB holding QMS + DHF records [16].
- **Embeddings:** **OpenAI `text-embedding-3-small`** (cloud); air-gapped alternative **Ollama + `nomic-embed-text`** for strict data sovereignty [13].
- **Retrieval strategy:** Semantic via **LlamaIndex** + robust metadata filtering by site, product family, polymer type [13].
- **Output:** Plain-English queries → specific SOP sections, revision numbers, source documents [12].
- **Gap:** Chunking algorithm and reranker are NOT explicitly named in sources.

### 4. Generation Layer
- **LLM choice:** Claude or GPT-4o (via n8n — used for "Monday Morning Narrative"), LangChain integrations [17, 18]. **Localised LLMs** in isolated cloud / on-prem instances to prevent trade-secret leakage [19].
- **Agentic patterns:**
  - **SharePoint Agents (native AI)** per hub: Knowledge Base Agent, Quality Agent, NPI Agent [20]
  - **n8n AI Agents** surfaced via **Microsoft Agent 365 natively in Teams**: NPI Parameter Bot (retrieves similar past projects), Compliance Query Bot, Status Bot [21, 15, 17]

### 5. Security & Access Model
- **RBAC:** Strictly maps to **FDA 21 CFR Part 11**. Role-gated agents (NPI Parameter Bot → engineers only). **Tamper-evident audit logging** on every interaction [13, 22, 15].
- **IRM (Information Rights Management):** Prevents unauthorised printing / forwarding [23].
- **Data residency — "VIEW LAYER" pattern:** To comply with **China's PIPL** and **Vietnam's Cybersecurity Law**, local operational data stays in-country (Azure China, local servers). n8n backbone pulls only **aggregated, non-PII views** to central hub [24, 25].
- **Encryption:** Self-hosted on-prem / VPN-isolated VMs for full sovereignty + air-gapping [13].

### 6. Deployment Platform
- **Hybrid / Microsoft 365 foundation:**
  - **SharePoint** = intranet front-end + central hub
  - **Microsoft Fabric** = unified data lakehouse
  - **Power BI** = dashboards [26, 27]
  - **n8n** = self-hosted integration middleware [28, 27]
- **Both global and per-facility** — central corporate hub + site-specific hubs:
  - **Singapore** (R&D / PTFE)
  - **Xiamen** (bilingual high-volume assembly)
  - **Bac Ninh** (ISO ramp-up)
  - **Irvine** (US customer prototyping) [29, 30, 31]

### 7. Governance
- **Document lifecycle:** SharePoint controls — ISO 13485 stages (`Draft → Review → Approved → Obsolete`). **Obsolete docs auto-hidden from active AI views** but retained per regulatory policy [32].
- **Feedback + freshness:** **Monday Narrative** lets CEO reply to AI for follow-up [17, 33]. Continuous model tuning from usage + user feedback [34, 35]. **AI citation analytics** track most-queried docs to identify documentation gaps [21].
- **Safety net:** Bots carry **disclaimers for regulated decisions**; human engineers / quality staff must verify AI responses against the cited source documents [35].

### 8. KPIs + Compliance Posture
- **KPIs:**
  - **Recall Accuracy > 95%** on SOP corpus [13]
  - **2–5 hours/week/engineer** reclaimed from document search [36]
  - Broad: **up to 50% reduction** in admin + compliance prep time [19]
- **FDA / ISO compliance:**
  - Explicitly designed for **FDA QMSR (Feb 2026)** + **ISO 13485 Clauses 4.2.4 & 4.2.5** (Document/Record Control) [32, 37]
  - To prevent **FDA Situation 1 "OAI"** audit failures, RAG forces LLM to **read only from validated QMS + DHF records** [38, 39, 16]
  - Every answer carries **direct citation + version number** → satisfies **QMSR Clause 7.5 traceability** → "zero regulatory drift" [12, 16]

---

## 4. China-plus-one supply chain — sites, tariffs, rules of origin, risks

**Question:** Explain China-plus-one in operational detail. Each site: function, headcount/cleanroom/capacity, regulatory regime. Tariff strategy: which products/routes via Vietnam, margin protection, substantial-transformation standard. Risks, certifications for FDA-registered customers, "second-plus-one" contingency.

### Four-Site Global Manufacturing Architecture

#### Singapore — Corporate HQ + Advanced Manufacturing
- **Function:** Corporate governance, advanced polymer engineering (R&D), IP management, regulatory oversight, complex multi-component assembly — specialty materials (**PTFE/FEP liners**) [1, more_horiz].
- **Capacity:** **50,000 sq ft**, **ISO Class 7 + Class 8 cleanrooms** [2]. **10+ closed-loop medical-grade extrusion lines** [6].
- **Regulatory regime:** **ISO 13485:2016** (SAC-accredited scope covering subcontracting of medical devices), **Singapore HSA**, **Singapore PDPA** for data residency [7, more_horiz].

#### Irvine, California — Catheter Lab
- **Function:** Customer-facing US commercial hub, rapid iterative prototyping, synchronous engineering with Western OEMs to accelerate time-to-market [1, more_horiz].
- **Capacity:** "Controlled Environments" — specific sq ft + headcount NOT detailed [1, 15].
- **Regulatory regime:** **US FDA** pathways, **HIPAA** (where applicable), **ITAR** compliance for sensitive dual-use IP protection [8, more_horiz].

#### Xiamen, China — High-Volume Extrusion Hub
- **Function:** Mature, high-volume mass production — multi-lumen extrusion, polymer laser processing, MEMS assembly. Scales for domestic Asian markets and jurisdictions unaffected by US tariffs [1, more_horiz].
- **Capacity:** **200+ employees** (70+ engineers, 100+ concurrent projects). **100,000 sq ft** (incl. 50,000 sq ft expansion). **ISO Class 7 + 8 cleanrooms, 10+ continuous extruders** [15, more_horiz].
- **Regulatory regime:** **ISO 13485**, China **NMPA/CFDA**, **PIPL**, **Data Security Law** [9, more_horiz].

#### Bac Ninh, Vietnam — The "China-Plus-One" Geopolitical Hedge
- **Function:** Tariff-exempt export corridor for **North America**. Automated braiding, secondary processing, full catheter assembly [1, more_horiz].
- **Capacity:** **130,000 sq ft** of ISO Class 7 + 8 cleanroom clusters; **Phase 2 expansion 100,000–150,000 sq ft** in progress. Automated knitting capable of "**tens of millions of products/year**" [1, more_horiz].
- **Regulatory regime:** Operates as an **Export Processing Enterprise (EPE)**, complies with **Vietnam MOH + Cybersecurity Law (Decree 13)** [9, 23]. **ISO 13485 certification currently being pursued, NOT yet finalised** [18, more_horiz].

### Tariff Bypass + OEM Margin Protection
- To bypass **July 2025 US Section 301 China tariffs**, AP Tech routes finished, sterilised medical catheters through Vietnam [28].
- Routed to **North American + European markets** on behalf of Western OEM partners [28, 29].
- Insulates Western OEMs from:
  - **20–40% base tariffs** on general medical goods imported from China
  - **50% tariff on copper** (used in braid reinforcement)
  - **200% tariff** explicitly warned for overseas pharmaceuticals + biocomponents [30, more_horiz]
  - **$84B EU counter-tariffs** prepared [31, 33]
- Result: AP Tech maintains a **structural 30–50% cost-to-performance advantage** over Western labour bases [34].

### Rules-of-Origin / "Substantial Transformation"
- **Exact legal % NOT named in sources.** Operational mechanism: imports raw materials (PTFE/FEP, Pebax, PEEK) directly into Vietnam or Singapore → complex processing (co-extrusion, braiding, tipping, assembly) → "finished sterilized medical catheters". Combined with Vietnam's **EPE status**, this end-to-end transformation ensures a legally compliant, tariff-exempt export corridor [18, more_horiz].

### Geopolitical / Trade-Policy Risks Flagged
- **Tariff escalation:** July 2025 US tariffs (up to 200% on biocomponents) + $84B EU counter-tariffs [31, 33].
- **Data sovereignty / cybersecurity:** China PIPL + Vietnam Cybersecurity Law (Decree 13) — operational + QA data cannot freely cross borders [9].
- **Note:** Sources don't explicitly mention sanctions or IP-transfer rules beyond general IP-theft risks mitigated by ITAR + biometric security [8, 16].

### Required Compliance for FDA-Registered Customers
- Vietnam site must achieve **ISO 13485 certification** to legally manufacture Class II / III medical devices for FDA-regulated markets [18, more_horiz].
- Strictly subject to new **FDA QMSR (effective Feb 2026)** — incorporates ISO 13485 into US federal law, introduces severe **OAI penalties** for failures in **Computer Software Assurance (CSA)** or **AI model validation** [35, more_horiz].

### Second-Plus-One Contingency
- **NOT proposed in notebook.** Strategy is to:
  - Aggressively accelerate Vietnam site capabilities as primary China hedge
  - Use Singapore to legally shield production [8]
  - Leverage **AGIC Capital backing for aggressive M&A** — acquire existing competitors with established US/EU regulatory approvals as alternate scaling path [29, 38]

---

## 5. FDA 2026 QMSR + ISO 13485 — AI / software compliance

**Question:** Detail FDA QMSR + ISO 13485 compliance for AP Tech's AI/software (machine vision, PdM, n8n agents, RAG intranet). Effective date + scope, clauses cited, AI/ML controls (PCCP, drift, HITL, bias, traceability), software validation (CSA/IQ-OQ-PQ/Part 11), OAI failure modes, audit trail + document control, cybersecurity, pre-compliance timeline.

### 1. Effective Date + Scope of FDA QMSR
- **Enforceable from 2 February 2026** [1, 2].
- Supersedes legacy **21 CFR Part 820**; **incorporates ISO 13485:2016 by reference** — giving the international standard force of US federal law [2, 3].
- FDA retired **Quality System Inspection Technique (QSIT)** → replaced with risk-centric framework dictated by **Compliance Program CP 7382.850** [2, 3].

### 2. ISO 13485 Clauses Cited
- **Clause 4.2.4 (Control of Documents) + 4.2.5 (Control of Records):** Strict document lifecycle (Draft → Review → Approved → Obsolete), version history, approval metadata, **Information Rights Management (IRM)**, predefined retention periods [4, 5].
- **Clause 7.5 (Traceability):** AI/RAG must generate answers with **direct citations + version numbers** to verified source documents — "zero regulatory drift" [6, 7].
- **Clauses 7.4 + 4.1 (Supplier Controls):** Documented qualification + oversight for all contracted manufacturing processes [2].

### 3. Controls for AI/ML in Production Decisions
- **Pre-Determined Change Control Plan (PCCP):** Formally drafted + submitted to FDA. Defines acceptable performance envelopes for model updates → pre-authorises specific retraining bounds without triggering formal 21 CFR 820.70 change control [8, more_horiz].
- **Model drift monitoring:** Automated statistical alerts (e.g. **F1-score tracking**) detect deviation from validated baselines → trigger reverification [8, 9].
- **Human-in-the-Loop:** AI prohibited from autonomously accepting/rejecting products. **Low-confidence predictions (< 0.7) routed to humans** for final adjudication before logging to **Design History File (DHF)** [8, 11].
- **Bias testing on training data:** Models must prove cross-environment validity — e.g. Singapore-climate model proven not to fail in Bac Ninh humidity [8, 12].
- **Root-cause traceability (anti-black-box):** Interpretable models with bounding-box justifications or physical anomaly tracing — must provide CAPA-investigable explanation, not just a defect flag [8, 12].

### 4. Software Validation Requirements
- **Computer Software Assurance (CSA):** Final guidance effective **3 February 2026** — replaces legacy CSV. All production + QMS software (AI vision, deviation workflows, RAG) must be **inventoried + gap-mapped against CSA risk tiers (Critical/High/Medium/Low)** [8, more_horiz].
- **IQ/OQ/PQ:** Workflow automations affecting quality (CAPAs, audit management) must have rigorous **Installation, Operational, Performance Qualification** docs from day one [15].
- **21 CFR Part 11 e-records:** Tamper-evident audit logging + **RBAC** ensuring only authorised personnel interact with regulated AI workflows [9, 16].

### 5. "Official Action Indicated" (OAI) Failure Modes
Under **CP 7382.850**, the FDA categorises risk-management failures tied to AI as **"Situation 1 Findings"** → immediate OAI [17]. The five failure modes:
1. Unregulated Model Drift [8, 10]
2. Cybersecurity Data Pipeline Vulnerability [8, 11]
3. Absence of Human-in-the-Loop Reverification [8, 11]
4. Black-Box Transparency Failure [8, 12]
5. Unvalidated Training-Data Bias [8, 12]

**FDA action upon OAI:** Warning Letters, Import Alerts, Consent Decrees — can result in **legal quarantine of entire facility's production output** [17, 18].

### 6. Audit Trail + Document Control
- **AI training datasets are legally treated as controlled documents** under QMSR [2].
- Maintain a **dataset registry** linking every model version to **version-controlled, labelled image datasets** representing distinct product families [8, 9].
- Audit trails must be **immutable** — e.g. n8n conversational agents log every purchase/QMS interaction in **structured, timestamped markdown** saved into version control [19, more_horiz].
- **Retention:** minimum **2 years post-device-lifetime** [5].

### 7. Cybersecurity Requirements
- **Unencrypted transmission** between edge-compute AI nodes (line-scan cameras) and central QMS servers = **severe design-control failure** [8, 11].
- Pipeline requires: end-to-end encryption, routine penetration testing, continuous vulnerability monitoring [11].
- Must align with **AAMI CR515:2025** cybersecurity consensus report (added to FDA recognition lists **19 Feb 2026**) — dictates protections against ML device threats in manufacturing [22].

### 8. Pre-Compliance Timeline — 90-Day Scaffold to Audit-Ready by Feb 2026
- **Phase 0 (Days 1–14):** Four-site diagnostic gap audit against QMSR/CSA. Catalog all AI/software systems by CSA risk tier [9, more_horiz].
- **Phase 1 (Days 15–45):** Deploy self-hosted air-gapped n8n + RAG intranet. RAG LLM strictly limited to reading validated ISO 13485 SOPs + DHFs only [24].
- **Phase 2 (Days 46–75):** Draft + log **PCCP** detailing model monitoring + rollback criteria for the **YOLOv5** machine vision system [24].
- **Phase 3 (Days 76–90):** Establish **AI Governance Vault** across all facilities. Complete penetration testing of edge-to-QMS pipelines to verify cybersecurity design controls before inspectors arrive [9, more_horiz].

---

## Status
- All 5 queries executed and written.
- Section 1 (frameworks comparison MCP/LangGraph/n8n) on the Kismet extract was truncated in transit — re-pull from notebook directly when drafting.
- All other gaps in source material are flagged in-line.
