# AP Technologies — Process Automation Project Plan

## Statement of Work | May 2026

### Prepared by Kevin Tan, KTG

---

## 1. Objective

AP Technologies operates a globally distributed catheter manufacturing business across four sites (Singapore, Xiamen, Bac Ninh, Irvine) with 70+ engineers managing 100+ concurrent NPI programs at tolerances of +/-0.0003" and wall thicknesses down to 0.0005". Today, critical handoffs between ERP, MES, QMS, customer portals, and email are manual — engineers spend hours per day on data entry, status chasing, document preparation, and cross-system reconciliation instead of billable engineering work. This project automates the ten highest-friction manual processes across AP Tech's operation, targeting 50-150 hours/week of reclaimed engineering and operations capacity, with measurable cycle-time reductions within 90 days of first deployment.

---

## 2. Technology Architecture

The automation stack is built on four layers, designed to sit on top of AP Tech's existing Microsoft 365 environment with zero new front-end tools for end users.

```
+---------------------------------------------------------------+
|                    FRONT-END LAYER                             |
|   Microsoft 365: Teams | SharePoint | Outlook | Power BI      |
|   (where engineers already work — no new tools to learn)       |
+---------------------------------------------------------------+
          |                    |                    |
          v                    v                    v
+---------------------------------------------------------------+
|                     AGENT LAYER                                |
|   n8n + Microsoft Agent 365 Integration                       |
|   AI agents with Entra ID — @mentionable in Teams/Outlook     |
|   "NPI Bot", "Quality Bot", "Logistics Bot"                   |
+---------------------------------------------------------------+
          |                    |                    |
          v                    v                    v
+---------------------------------------------------------------+
|                  ORCHESTRATION LAYER                           |
|   n8n (self-hosted, AP Tech infrastructure)                   |
|   Workflow logic | Data transformation | API integrations     |
|   ERP connectors | MES triggers | QMS webhooks | Email parse  |
+---------------------------------------------------------------+
          |                    |                    |
          v                    v                    v
+---------------------------------------------------------------+
|                      DATA LAYER                                |
|   Microsoft Fabric: unified analytics across all sites         |
|   Real-time dashboards | Cross-site visibility                 |
|   Azure AI Foundry for vision/ML where needed                  |
+---------------------------------------------------------------+
```

**Why n8n as the backbone:** Self-hosted for data sovereignty (critical for PIPL compliance in China and medical device IP). n8n's Microsoft Agent 365 integration (GA 2026) means every automation agent gets its own Entra ID and surfaces natively in Teams and Outlook. Engineers @mention an agent the same way they @mention a colleague. No new app, no new login, no behavior change.

**Why not Power Automate alone:** Power Automate handles point-to-point M365 triggers well, but n8n provides the cross-system orchestration (ERP-to-MES-to-QMS chains), custom API integrations, and self-hosted control that a 4-site medical device manufacturer requires. Power Automate remains in the stack for native M365 automations where it excels.

---

## 3. Process Automation Inventory

These are the ten processes I'd target first, based on the research and what's typical for a multi-site CDMO at AP Tech's scale. Phase 0 discovery will validate and reprioritize against reality. Each is scoped as an independent automation that connects to the shared n8n backbone.

| # | Process | Current Manual State | Automated State | Tools | Phase | Est. Hours Saved/Week | Complexity |
|---|---------|---------------------|-----------------|-------|-------|----------------------|------------|
| 1 | **OEM RFQ Processing** | RFQ arrives via email. Engineer manually reviews specs, creates DFM checklist in Excel, checks colleague availability via WhatsApp/Teams chat, populates quote template by hand, routes for approval via email chain. Turnaround: 3-5 business days. | RFQ parsed on receipt (email/portal). DFM checklist auto-generated from spec extraction. Engineer assigned based on availability calendar and material expertise. Quote template pre-populated with standard pricing, tolerances, and lead times. Approval routed through Teams with one-click sign-off. Turnaround: same day. | n8n (email trigger, HTTP request, Microsoft Teams node, SharePoint node), M365 Copilot for spec extraction, SharePoint for quote templates | Phase 1 | 15-20 | Medium |
| 2 | **NPI Deviation Management** | Deviation detected on extrusion line. Paper NCR filled out by operator. QA engineer manually creates CAPA log in QMS. Affected engineers notified by email or hallway conversation. Trend data compiled quarterly in spreadsheet. No real-time visibility for management. | Deviation logged digitally at point of detection. CAPA record auto-created in QMS with linked root-cause workflow. Relevant engineers notified instantly in Teams based on program assignment. Trend dashboard updates in real time. Management sees deviation patterns across all lines and sites. | n8n (webhook trigger, QMS API connector, Teams notification node), Power BI for trend dashboard, Microsoft Fabric for cross-site aggregation | Phase 1 | 10-15 | High |
| 3 | **Material Lot Receipt & Release** | Material lot arrives at receiving. COA (Certificate of Analysis) manually reviewed against spec sheet — engineer compares values line by line. If pass, engineer manually enters release in MES. Inventory spreadsheet updated separately. Delay: 2-4 hours per lot, longer if reviewer is unavailable. | COA scanned/uploaded on receipt. Values auto-extracted and validated against material specs in database. Pass: MES release triggered automatically, inventory updated across sites. Fail: hold placed, supplier notified, QA engineer alerted with specific out-of-spec values highlighted. | n8n (file trigger, document parse node, MES API connector, conditional logic), Azure AI Foundry for COA document extraction, SharePoint for spec database | Phase 1 | 10-15 | Medium |
| 4 | **Customer Change Order Processing** | Customer sends change order via email or portal. Program manager manually identifies affected NPI programs. Impact assessment requires checking with engineering, QA, and supply chain separately — each via email. Re-validation requirements determined by QA reviewing regulatory files. Customer gets timeline update after 3-7 days. | Change order ingested and parsed. Affected NPI programs auto-flagged from project database. Impact assessment workflow triggers parallel reviews: engineering (design impact), QA (re-validation scope), supply chain (material/timeline). Results aggregated into single impact report. Customer notified with timeline within 24 hours. | n8n (email/webhook trigger, database query, parallel workflow branches, Teams node, email node), SharePoint for NPI project database, Teams for review routing | Phase 2 | 8-12 | High |
| 5 | **Cleanroom Environmental Monitoring** | Environmental sensors (temperature, humidity, particulate) logged manually on paper at scheduled intervals. Out-of-spec conditions caught during next scheduled check — potentially hours later. Corrective actions documented in paper log. Compliance records compiled manually before audits. | Sensor data aggregated continuously via IoT gateway. Trend analysis runs automatically — out-of-spec conditions trigger immediate Teams alerts to cleanroom supervisor with recommended corrective actions. All readings, alerts, and corrective actions auto-logged for compliance. Audit-ready reports generated on demand. | n8n (IoT/MQTT trigger or HTTP polling, conditional logic, Teams node, SharePoint node), Power BI for environmental dashboards, Microsoft Fabric for historical trend storage | Phase 2 | 5-8 | Medium |
| 6 | **Equipment Maintenance (Predictive)** | Maintenance tracked via calendar reminders and Excel spreadsheet. PO for spare parts created manually when stock noticed to be low. Technician dispatched by phone or walk-over. Completion logged in spreadsheet. Reactive: equipment fails before maintenance occurs. | Maintenance triggers generated from equipment runtime hours and calendar schedule. Spare parts auto-ordered when inventory drops below threshold. Technician dispatched via Teams with work order details. Completion logged digitally with photo verification. Dashboard shows equipment health across all lines. | n8n (scheduled trigger, MES runtime data pull, inventory check, Teams node, procurement trigger), Power BI for equipment health dashboard | Phase 2 | 8-12 | Medium |
| 7 | **Vietnam EPE Customs Documentation** | Export Processing Enterprise documentation prepared manually from production records and shipping data. Customs filing assembled by logistics coordinator cross-referencing multiple systems. High error risk — incorrect declarations cause shipment delays and potential penalties. | Production and shipping data auto-aggregated from MES and ERP. EPE documentation populated automatically with correct quantities, values, and classifications. Compliance checks run before submission — flagging discrepancies for human review. Filing package prepared for one-click submission. | n8n (scheduled trigger, ERP data pull, MES data pull, document generation, validation logic), SharePoint for template management | Phase 2 | 5-10 | High |
| 8 | **ISO 13485 Audit Management** | Internal audit calendar maintained in Excel. Findings tracked in separate spreadsheet. CAPA follow-up relies on email reminders — items slip. Audit preparation requires 2-3 weeks of document gathering. No single view of audit readiness. | Audit calendar automated with rolling schedule. Findings logged and tracked with auto-escalation on overdue items. CAPA close-out workflows with mandatory evidence upload. Audit-readiness dashboard shows current status across all sites — always current, not just at audit time. | n8n (scheduled triggers, QMS integration, escalation logic, Teams notification), Power BI for audit readiness dashboard, SharePoint for evidence repository | Phase 2 | 5-10 | Medium |
| 9 | **Sales-to-Engineering Handoff** | Sales call notes captured in personal notebooks, email threads, or WhatsApp messages. CRM updated inconsistently. Engineering ticket created manually — often missing key specs discussed on the call. Assignment based on who the sales rep knows, not capacity. Customer confirmation delayed. | Call notes captured (voice transcription or structured input). CRM updated automatically. Engineering ticket created with relevant specs, material requirements, and tolerance expectations extracted from notes. Assigned based on engineer capacity and expertise matching. Customer receives confirmation with assigned engineer and expected timeline. | n8n (CRM webhook, NLP extraction, project management integration, Teams node, email node), M365 Copilot for call note processing | Phase 3 | 5-10 | Medium |
| 10 | **Tariff Classification & Cost Impact** | Shipment line items classified manually for HTS codes. Classification relies on individual knowledge — inconsistent across staff. Cost impact of tariff changes calculated in spreadsheet. Critical exposure with current regime: 20-40% base tariffs, 50% on copper components, 200% on biocomponents. Errors mean financial penalties or overpayment. | Line items auto-classified against HTS database with confidence scoring. Low-confidence classifications flagged for human review. Cost impact calculated automatically for each shipment — dashboard shows tariff exposure by product line, route, and site. Scenario modeling for tariff regime changes. | n8n (ERP data trigger, classification logic, calculation engine, alerting), Power BI for tariff exposure dashboard, Microsoft Fabric for cross-site trade data | Phase 3 | 5-8 | High |

**Total estimated recovery: 76-120 hours/week across all ten processes.**

---

## 4. Phased Implementation

### Phase 0 — Discovery & Validation (2 weeks | S$15,000-25,000)

**Objective:** Validate the ten-process list against operational reality and select the top three for Phase 1.

**Activities:**
- On-site Singapore HQ (3 working days): process mapping, system inventory, interviews with engineering leads, QA, operations, and logistics
- Shadow current workflows end-to-end for the top candidate processes — measure actual cycle times, error rates, and handoff delays
- Catalog existing systems: identify the specific ERP, MES, QMS, and customer portal instances in use, their API capabilities, and integration constraints
- Score all ten processes on a 2x2 (impact vs. feasibility) to select the Phase 1 top three
- Validate n8n deployment approach with AP Tech IT (infrastructure, networking, security review)

**Deliverable:** Process audit report with current-state measurements, prioritized process ranking, and detailed Phase 1 SOW with acceptance criteria for each automation.

**Decision point:** Either side can walk at end of Phase 0. If we proceed, Phase 0 fee is credited toward Phase 1.

---

### Phase 1 — First Three Automations (30 days | S$40,000-60,000)

**Objective:** Three automations running in production at Singapore HQ with measurable cycle-time improvement.

**Recommended initial three** (subject to Phase 0 validation):
1. OEM RFQ Processing — highest visibility, clear before/after measurement, touches sales and engineering
2. NPI Deviation Management — highest compliance value, creates the audit trail infrastructure reused by later automations
3. Material Lot Receipt & Release — highest frequency, fastest payback, cleanest integration scope

**Activities:**
- Deploy self-hosted n8n instance on AP Tech infrastructure (or approved cloud tenant)
- Build and test three end-to-end automation workflows
- Deploy first Microsoft Agent 365 bot in Teams — engineers can @mention to check RFQ status, deviation history, or lot release status
- Instrument all workflows for cycle-time measurement: before vs. after, error rate, manual intervention frequency
- Two-week production burn-in with daily monitoring

**Deliverable:** Three working automations in production at Singapore HQ. Measurement baseline established. Site champion trained on monitoring and basic troubleshooting.

---

### Phase 2 — Full Automation Suite (60 days | S$80,000-120,000)

**Objective:** Remaining seven processes automated. Cross-site deployment to Singapore and Xiamen.

**Activities:**
- Build and deploy automations 4-10 (Customer Change Orders, Cleanroom Monitoring, Equipment Maintenance, Vietnam EPE Documentation, ISO 13485 Audit Management, Sales-Engineering Handoff, Tariff Classification)
- Cross-site deployment: replicate Singapore automations to Xiamen, adapting for local system differences (Chinese-language interfaces, PIPL data handling, local ERP instance)
- Power BI dashboards for automation performance metrics: cycle times, error rates, manual intervention frequency, hours saved per process
- Training program for site champions at Singapore and Xiamen (2 days per site)
- Advanced agent capabilities: NPI parameter lookup bot, compliance query bot grounded in QMS data via SharePoint Agents

**Deliverable:** All ten processes automated and running at Singapore and Xiamen. Performance dashboards live. Site champions operational at both sites.

---

### Phase 3 — Multi-Site Extension & Advanced Agents (90 days | S$60,000-90,000)

**Objective:** Full four-site automation coverage. Advanced AI agents deployed.

**Activities:**
- Bac Ninh deployment: adapt workflows for Vietnam operations, EPE-specific customs automation, Vietnamese-language agent interfaces. Coordinate with ongoing ISO 13485 certification — automation supports (not complicates) the certification process
- Irvine deployment: NPI prototyping lab workflows, US-specific regulatory documentation, US customs and tariff automation
- Cross-site workflow coordination: automated handoffs between sites (e.g., NPI design in Irvine, validation in Singapore, production transfer to Xiamen)
- Advanced AI agents: NPI parameter recommendation engine (suggest extrusion parameters based on historical runs with similar materials and geometries), compliance query bot for QMSR/ISO 13485 questions grounded in AP Tech's own QMS documentation
- Tariff scenario modeling: automated what-if analysis for routing decisions across the four-site network given current tariff regime

**Deliverable:** All four sites running the full automation suite. Cross-site workflows operational. Advanced agents deployed and measured.

---

## 5. ROI Projection

| Metric | Conservative | Mid-Range | Optimistic |
|--------|-------------|-----------|------------|
| Hours reclaimed per week | 50 | 85 | 120 |
| FTE equivalent recovered | 1.25 | 2.1 | 3.0 |
| Annual value at S$80-120K loaded cost/engineer | S$100K | S$210K | S$360K |
| First-year project investment (Phase 0-3) | S$195K | S$245K | S$295K |
| Payback period | 12 months | 8 months | 6 months |

**Beyond direct labor recovery:**
- RFQ turnaround from 3-5 days to same-day increases win rate on time-sensitive OEM opportunities
- Real-time deviation trending reduces scrap rates and rework cycles
- Automated audit trails reduce QMSR compliance risk and audit preparation from weeks to hours
- Tariff classification accuracy reduces financial exposure on cross-border shipments
- Faster material release reduces line downtime waiting for lot clearance

**Cost comparison:** A Tier-1 consulting firm (McKinsey, BCG, Accenture) would scope this as a 4-person team for 12 months at S$8-12K/day — total S$1M+ before any production system is running. This project delivers working automations, not slide decks.

---

## 6. Risk & Compliance

| Risk | Mitigation |
|------|-----------|
| **FDA/QMSR validation requirements** | Phase 1-2 target non-regulated processes (scheduling, communications, supplier management, logistics). Quality and compliance workflows (deviations, CAPA, audit management) are built with IQ/OQ/PQ documentation from the start, but validation execution deferred to Phase 3 when the automation patterns are proven and stable. |
| **Data sovereignty (China PIPL, Singapore PDPA)** | n8n self-hosted on AP Tech infrastructure in-region. Singapore data stays in Singapore. Xiamen instance runs on China-based infrastructure. No cross-border data transfer without explicit architectural review. |
| **ERP/MES/QMS integration complexity** | Phase 0 specifically catalogs API availability and integration constraints for each system. Automations designed with graceful degradation — if an API call fails, the workflow notifies and falls back to manual, never silently drops data. |
| **Change management / user adoption** | Agents surface inside Teams where people already work. No new application to learn, no new login to remember. Site champions trained as first-line support. Two-week burn-in period for each automation with daily monitoring before handoff. |
| **26% engineering turnover** | Automation reduces dependency on individual knowledge. Workflows are documented and version-controlled. Site champion model ensures no single point of failure for automation operations. |
| **Multi-site coordination** | Singapore deployed and validated first. Each subsequent site adapts the proven patterns, not builds from scratch. Cross-site deployment is replication with localization, not greenfield development. |
| **QMSR alignment** | Automated workflows create digital audit trails that improve compliance posture — every action timestamped, every decision logged, every document version tracked. This is a compliance asset, not a compliance risk. |

---

## 7. What AP Tech Needs to Provide

| Item | Detail | When Needed |
|------|--------|-------------|
| **System access** | Read/write API access (or credentials) for ERP, MES, QMS, and customer portal systems | Phase 0 start |
| **Site champions** | 2-3 designated staff (one per major site) who own the automation relationship day-to-day — attend weekly syncs, test workflows, provide feedback, serve as first-line support | Phase 0 start |
| **IT support** | Infrastructure for n8n deployment (VM or container host on AP Tech network), firewall rules for system-to-system API calls, Entra ID configuration for Microsoft Agent 365 integration | Phase 1 start |
| **Stakeholder time** | 2-3 days during Phase 0 discovery (interviews + process shadowing). 2-4 hours/week during build phases for testing and feedback | Phase 0 start |
| **Microsoft 365 tenant access** | Teams, SharePoint, and Outlook integration permissions for n8n and agent deployment | Phase 1 start |
| **Process documentation** | Existing SOPs, work instructions, and process maps for the ten target processes (whatever currently exists — gaps are expected and will be documented in Phase 0) | Phase 0 start |

---

## 8. Acceptance Criteria

Each of the ten automations is accepted when all of the following conditions are met:

1. **End-to-end execution:** The workflow runs from trigger to completion without manual intervention for the documented standard path. Edge cases are handled with explicit error routing (notification + fallback), not silent failure.

2. **Error rate:** Less than 5% failure rate over a minimum 2-week production operation period. Failures are defined as workflows that require manual intervention to complete or that produce incorrect outputs.

3. **Cycle-time improvement:** Measured before-and-after cycle time demonstrates improvement consistent with the estimates in Section 3 (within 50% of the estimated range).

4. **Site champion competency:** The designated site champion can independently monitor workflow health, interpret error notifications, restart failed workflows, and escalate issues with appropriate context.

5. **Documentation delivered:** Each automation ships with:
   - Workflow map (visual n8n workflow + written description of logic)
   - Integration specifications (API endpoints, authentication, data mapping)
   - Runbook (monitoring procedures, common failure modes, troubleshooting steps, escalation path)
   - Test cases used during development and acceptance

6. **Stakeholder sign-off:** The designated process owner for each automation confirms the workflow meets their operational requirements via written acceptance (email or signed acceptance form).

---

## 9. Commercial Summary

| Phase | Duration | Investment (S$) | Deliverable |
|-------|----------|-----------------|-------------|
| Phase 0 — Discovery | 2 weeks | 15,000-25,000 | Process audit + Phase 1 SOW |
| Phase 1 — First Three | 30 days | 40,000-60,000 | 3 automations in production at SG |
| Phase 2 — Full Suite | 60 days | 80,000-120,000 | 10 automations at SG + Xiamen |
| Phase 3 — Multi-Site | 90 days | 60,000-90,000 | Full 4-site coverage + advanced agents |
| **Total** | **~6 months** | **S$195,000-295,000** | **10 processes, 4 sites, 50-150 hrs/week recovered** |

Payment terms: 50% at phase kickoff, 50% on completion for each phase. Phase 0 fee credited to Phase 1 if we continue.

Each phase has a clear decision point. AP Tech can pause or stop at any phase boundary with full ownership of all work product delivered to that point.

---

**KTG | Kevin Tan**
kevin.pl.tan@gmail.com

