# Business Process Discovery — How I Figure Out Where I Can Actually Help

## Version 1.0 | May 2026 | Kev Tan

---

## 1. What This Is

This is my working method for walking into a new client's operation, mapping their manual processes, figuring out which ones I can automate, and being honest about which ones I can't. It works in any industry but has extra depth for regulated manufacturing (medical devices, aerospace, precision engineering) because that's where the compliance complexity lives.

The output is a **Process Audit Report** — a clear picture of what's worth automating, what tools to use, and in what order. Not a strategy deck. A build plan.

**Core rule:** recommend what's right, not what generates billing. If Power Automate handles it natively, say that. If they need a real ERP, say that. If the answer is "write better SOPs and train your people," say that too. Trust compounds faster than invoices.

---

## 2. Discovery Phase Structure

A standard discovery runs five business days. The phases overlap — interviews surface processes, mapping reveals scoring inputs, and scoring drives recommendations.

### Phase A: Stakeholder Interviews (Days 1-2)

Three tiers of interviews, each with a different purpose and question set. Allocate roughly 60 minutes per executive, 45 minutes per manager, and 30 minutes per operator.

#### Executive Level (CEO, COO, CFO)

**Purpose:** Understand strategic priorities, pain points, budget constraints, and what success looks like.

| # | Question |
|---|---|
| 1 | What are the three processes that consume the most management attention? |
| 2 | Where do you lose the most time waiting for information from another person, site, or system? |
| 3 | If you could automate one thing tomorrow, what would it be and why? |
| 4 | What is your biggest compliance or audit headache? |
| 5 | Where are errors most costly — in dollars, in reputation, or in regulatory risk? |
| 6 | How do you currently get visibility into operations across sites? |
| 7 | What has your experience been with past technology or automation initiatives? |
| 8 | Where do you see the company in 18 months, and what operational capabilities does that require? |
| 9 | What keeps you up at night about the business that better systems could fix? |
| 10 | How would you define success here — what does "this worked" look like in 6 months? |

#### Manager Level (Department Heads, Site Leads, Quality Managers)

**Purpose:** Understand day-to-day operational friction, workarounds, team capacity constraints, and information gaps.

| # | Question |
|---|---|
| 1 | Walk me through how [process X] works today, step by step, from trigger to completion. |
| 2 | Where do things get stuck or delayed most often? |
| 3 | What percentage of your team's time goes to manual data entry, re-keying, or copying between systems? |
| 4 | What reports do you create manually, and how long does each one take? |
| 5 | What information do you wish you had in real-time that you currently get hours or days late? |
| 6 | Where do handoffs between your team and other teams break down? |
| 7 | What workarounds has your team built to get around system limitations? |
| 8 | If I gave you back 10 hours per week of team capacity, what would you spend it on? |
| 9 | Which processes have the most variation — done differently depending on who does it or which site does it? |
| 10 | What is the most error-prone step in your department's workflow? |

#### Operator Level (The People Who Actually Do the Work)

**Purpose:** Ground truth. Executives and managers often describe the intended process. Operators reveal the real one.

| # | Question |
|---|---|
| 1 | Show me how you do [process X] — walk me through it on your screen or at your workstation. |
| 2 | What workarounds have you built that your manager might not know about? |
| 3 | What tools do you use that are not official company tools (personal spreadsheets, WhatsApp groups, sticky notes)? |
| 4 | What takes the longest in your day? |
| 5 | Where do you have to wait for someone else before you can continue? |
| 6 | What information do you have to look up in multiple places to complete a task? |
| 7 | What part of your job feels like a waste of your skills? |
| 8 | When something goes wrong, how do you find out — and how long does it take? |
| 9 | If you could change one thing about how you do your job, what would it be? |
| 10 | What did you do last week that you will do again this week in exactly the same way? |

**Interview tip:** Operator interviews are the most valuable. Schedule them after executive and manager interviews so you know what to probe. Ask to watch, not just listen — observation catches steps that people forget to mention because they are second nature.

---

### Phase B: Process Mapping (Days 2-3)

For each process identified during interviews, fill in this template. A typical discovery surfaces 15-30 processes; expect to map 10-20 in detail.

#### Process Mapping Template

| Field | Description | Example (AP Tech: OEM RFQ Processing) |
|---|---|---|
| Process Name | Short descriptive name | OEM RFQ Processing |
| Owner | Person or role responsible for end-to-end outcome | Sales Director |
| Trigger | What event starts this process | Customer sends RFQ via email |
| Inputs | Data, documents, materials, or information needed | RFQ document, BOM, engineering specs, historical pricing |
| Steps | Numbered sequence of actions (capture 5-15 steps) | 1. Receive RFQ email 2. Log in tracker 3. Route to engineering ... |
| Decision Points | Where does a human need to exercise judgment? | Feasibility assessment, pricing tier selection, go/no-go |
| Outputs | What is produced when the process completes | Quotation document, updated CRM record, engineering assessment |
| Systems Used | Tools, software, platforms, spreadsheets touched | Email, Excel tracker, ERP, CAD system, SharePoint |
| Handoffs | Where does work pass between people, teams, or sites | Sales to Engineering, Engineering to Quality, Quality back to Sales |
| Pain Points | What is slow, error-prone, or frustrating | Manual data re-entry across systems, version control on quotes |
| Time Spent | Hours per occurrence and frequency (hours/week or hours/month) | 4 hrs per RFQ, ~12 RFQs/month = 48 hrs/month |
| Error Rate | How often does it go wrong, and what happens when it does | ~15% of quotes require rework due to spec misalignment |
| Volume | How many times per day, week, or month | 12 per month |
| Regulatory Impact | Does this process touch compliance, audit trail, or quality records | Traceability requirements for medical device customers |

---

### Phase C: Automation Opportunity Scoring (Day 4)

Score each mapped process using a weighted matrix. The goal is an objective, comparable score that drives prioritization.

#### Scoring Matrix

| Criterion | Weight | Scale | Scoring Guide |
|---|---|---|---|
| **Impact** | 30% | 1-5 | 1 = Saves <1 hr/wk. 2 = Saves 1-3 hrs/wk. 3 = Saves 3-8 hrs/wk. 4 = Saves 8-20 hrs/wk. 5 = Saves 20+ hrs/wk or eliminates critical errors. |
| **Feasibility** | 25% | 1-5 | 1 = No API access, legacy systems, poor data. 2 = Partial access, significant custom work. 3 = APIs available, moderate integration effort. 4 = Well-documented APIs, clean data, standard patterns. 5 = Near plug-and-play, proven integrations exist. |
| **Risk** | 20% | 1-5 (inverted) | 1 = High regulatory exposure, irreversible actions, strong change resistance. 5 = Low risk, easily reversible, team eager for change. |
| **Strategic Value** | 15% | 1-5 | 1 = No exec visibility, tangential to strategy. 3 = Aligns with one strategic priority. 5 = Directly enables stated strategic goal, high visibility. |
| **Quick Win Potential** | 10% | 1-5 | 1 = 6+ month timeline. 2 = 3-6 months. 3 = 60-90 days. 4 = 30-60 days. 5 = Under 30 days to production. |

#### Weighted Score Formula

```
Score = (Impact × 0.30) + (Feasibility × 0.25) + (Risk × 0.20) + (Strategic Value × 0.15) + (Quick Win × 0.10)
```

Maximum possible score: **5.00**. In practice, anything above 3.5 is a strong candidate. Scores between 2.5 and 3.5 merit further investigation. Below 2.5, defer or deprioritize.

---

### Phase D: Solution Recommendation (Day 5)

#### Decision Tree: What Is the Right Solution?

For each scored process, walk through the following logic to determine the appropriate solution category.

```
Is the process well-defined and repeatable?
|
+-- NO --> Improve SOPs first, then revisit for automation
|
+-- YES --> Does it involve system-to-system data movement?
    |
    +-- YES --> Does Microsoft 365 handle it natively?
    |   |
    |   +-- YES (e.g., document approval, Teams alerts, Planner tasks)
    |   |   --> Recommend Power Automate / M365 native
    |   |
    |   +-- NO --> Does it need API integration across non-Microsoft systems?
    |       |
    |       +-- YES --> n8n workflow (KTG builds this)
    |       |
    |       +-- NO --> Does it need desktop UI interaction (legacy systems)?
    |           |
    |           +-- YES --> Power Automate Desktop / UiPath RPA
    |           |
    |           +-- NO --> Custom development or ERP module
    |
    +-- NO --> Does it require AI or judgment?
        |
        +-- YES --> AI agent (KTG builds) + human-in-the-loop review
        |
        +-- NO --> Is it a reporting or visibility problem?
            |
            +-- YES --> Power BI dashboard + data integration (KTG builds)
            |
            +-- NO --> Manual process improvement / training
```

#### Solution Categories

| Category | Description | Who Delivers | Example |
|---|---|---|---|
| **KTG Build: n8n Workflow** | System integration, data routing, automated notifications, multi-step orchestration | KTG | OEM RFQ processing, material lot receipt automation |
| **KTG Build: AI Agent** | Intelligent processing requiring judgment, classification, or natural language understanding | KTG | NPI parameter lookup, compliance query bot, spec interpretation |
| **KTG Build: Dashboard** | Data aggregation and visualization across disparate systems | KTG | Cross-site production dashboard, quality KPI tracker |
| **Microsoft Native** | Handled by Power Automate, SharePoint workflows, Teams, or Planner | Client IT (KTG advises) | Document approval routing, meeting scheduling, simple notifications |
| **Third-Party Tool** | Specialized software better suited than custom build | Vendor (KTG recommends) | Full ERP replacement, dedicated QMS (e.g., Greenlight Guru), PLM system |
| **Process Improvement** | No automation needed — fix the process definition first | Client ops team (KTG advises) | Unclear SOPs, undefined decision criteria, inconsistent naming |
| **Keep Manual** | Too complex, too risky, or too infrequent to justify automation | N/A | One-off engineering judgment calls, rare exception handling |

**Credibility principle:** the long-term relationship depends on honest recommendations. If Power Automate handles it natively, recommend that. If they need a proper ERP, say so even though it means a vendor, not KTG, gets the work. Clients remember the consultant who saved them money more than the one who built them something unnecessary.

---

## 3. Discovery Deliverable Template

The Process Audit Report is what the client gets at the end. It should be clear enough for a board member and practical enough that an ops manager can act on it the same day.

### Process Audit Report Structure

#### Section 1: Executive Summary (1 page)

| Element | Content |
|---|---|
| Engagement scope | Sites visited, teams interviewed, date range |
| Processes mapped | Total count and breakdown by department |
| Top 5 opportunities | Name, score, estimated impact, recommended solution |
| Total estimated impact | Hours/week recoverable, FTE equivalent, annualized cost savings |
| Recommended phasing | High-level timeline for Phase 1/2/3 |
| Investment overview | Range estimate for recommended automations |

#### Section 2: Process Inventory (table)

| # | Process | Owner | Dept | Frequency | Time/Week | Score | Category | Recommended Solution | Phase |
|---|---|---|---|---|---|---|---|---|---|
| 1 | OEM RFQ Processing | Sales Dir | Sales | 12/month | 12 hrs | 4.15 | KTG: n8n | Automated routing + AI extraction | 1 |
| 2 | NPI Deviation Mgmt | Quality Mgr | Quality | 8/month | 10 hrs | 3.90 | KTG: AI Agent | AI-assisted deviation classification | 1 |
| ... | ... | ... | ... | ... | ... | ... | ... | ... | ... |

Sort by weighted score descending. Include all mapped processes, not just the automation candidates.

#### Section 3: Automation Opportunity Map

Plot all processes on an Impact vs. Feasibility quadrant:

```
                        HIGH IMPACT
                            |
              PLAN FOR      |      DO FIRST
           (High Impact,    |   (High Impact,
            Low Feasibility)|    High Feasibility)
                            |
   LOW FEASIBILITY ---------+--------- HIGH FEASIBILITY
                            |
              DON'T DO      |      QUICK WINS
           (Low Impact,     |   (Low Impact,
            Low Feasibility)|    High Feasibility)
                            |
                        LOW IMPACT
```

- **Q1 — DO FIRST:** High impact, high feasibility. These are Phase 1.
- **Q2 — PLAN FOR:** High impact but harder to implement. Phase 2 after foundations are in place.
- **Q3 — QUICK WINS:** Low impact but easy. Slot into spare capacity or Phase 1 if they build credibility.
- **Q4 — DON'T DO:** Low impact, hard to build. Deprioritize or eliminate.

#### Section 4: Solution Recommendations (per process)

For each top-10 scored process, provide:

| Element | Description |
|---|---|
| Current state | How the process works today, including pain points and workarounds |
| Proposed state | How the process would work after automation |
| Solution category | From the decision tree (KTG build, Microsoft native, etc.) |
| Tools and integrations | Specific platforms, APIs, and connectors required |
| Estimated build time | Days or weeks to production |
| Estimated cost | Range in S$ |
| Dependencies | What must be in place before this can start (system access, data cleanup, etc.) |
| Prerequisites | Other automations that should go first |
| Risk factors | What could go wrong and how to mitigate |

#### Section 5: Phased Implementation Roadmap

| Phase | Timeline | Scope | Deliverables | Investment | Success Criteria |
|---|---|---|---|---|---|
| Phase 1 | Days 1-30 | Top 3 processes by score | Production workflows, initial dashboards | S$X-Y | Measurable time savings, zero increase in error rate |
| Phase 2 | Days 31-60 | Next 4-5 processes | Additional workflows, AI agents, integrations | S$X-Y | Cumulative savings target, user adoption metrics |
| Phase 3 | Days 61-90 | Remaining processes + advanced features | Full automation suite, reporting, training | S$X-Y | Full ROI realization, team self-sufficiency |

Each phase should be independently valuable. If the client stops after Phase 1, they still have working automations and measurable ROI.

#### Section 6: Cost-Benefit Analysis

| Process | Build Cost (S$) | Monthly Time Saved (hrs) | Monthly Cost Saved (S$) | Payback Period |
|---|---|---|---|---|
| OEM RFQ Processing | 8,000-12,000 | 12 | 1,200 | 7-10 months |
| NPI Deviation Mgmt | 10,000-15,000 | 10 | 1,000 | 10-15 months |
| ... | ... | ... | ... | ... |
| **Total Portfolio** | **XX,000-XX,000** | **XX** | **X,X00** | **X-X months** |

Use client-specific labor cost assumptions. Default to S$100/hr fully-loaded for skilled staff if the client does not provide rates.

#### Section 7: Risk Register

| Risk | Likelihood (1-5) | Impact (1-5) | Risk Score | Mitigation |
|---|---|---|---|---|
| Regulatory non-compliance from automation errors | 2 | 5 | 10 | Human-in-the-loop review for all quality-impacting decisions, audit trail logging |
| Poor data quality in source systems | 4 | 3 | 12 | Data cleansing sprint in Phase 0, validation rules in workflows |
| User adoption resistance | 3 | 3 | 9 | Involve operators in design, phased rollout, training sessions |
| API/integration changes by vendors | 2 | 3 | 6 | Version-pinned integrations, monitoring alerts, n8n error handling |
| Key person dependency (KTG) | 2 | 4 | 8 | Full documentation, client team training, handover protocol |
| Scope creep during build phases | 3 | 3 | 9 | Fixed scope per phase, change request process, weekly check-ins |

---

## 4. AP Technologies Example (Demonstration)

The following demonstrates the framework applied to AP Technologies, a precision catheter manufacturer operating across Singapore and China with medical device OEM customers.

### Process 1: OEM RFQ Processing

**Process Map Summary:**

| Field | Detail |
|---|---|
| Trigger | Customer sends RFQ via email |
| Steps | 1. Receive email 2. Log in Excel tracker 3. Forward to engineering for feasibility 4. Engineering reviews specs against capabilities 5. Quality reviews regulatory requirements 6. Costing builds quote 7. Sales compiles and sends quotation |
| Handoffs | Sales > Engineering > Quality > Costing > Sales |
| Pain Points | Manual re-entry, version confusion, 5-7 day turnaround |
| Time | ~4 hrs per RFQ, 12/month = 48 hrs/month |

**Scoring:**

| Criterion | Score | Weighted |
|---|---|---|
| Impact | 4 | 1.20 |
| Feasibility | 4 | 1.00 |
| Risk (inverted) | 4 | 0.80 |
| Strategic Value | 5 | 0.75 |
| Quick Win | 4 | 0.40 |
| **Total** | | **4.15** |

**Recommendation:** KTG Build — n8n Workflow. Automated email intake, AI-powered spec extraction, structured routing to engineering/quality/costing with parallel tracks, automated quote assembly. Reduces turnaround from 5-7 days to 1-2 days.

---

### Process 2: NPI Deviation Management

**Process Map Summary:**

| Field | Detail |
|---|---|
| Trigger | Out-of-spec result during new product introduction |
| Steps | 1. Operator flags deviation 2. Supervisor reviews 3. Quality investigates root cause 4. Engineering proposes corrective action 5. Quality approves CAPA 6. Documentation updated |
| Handoffs | Operator > Supervisor > Quality > Engineering > Quality |
| Pain Points | Paper-based deviation logs, inconsistent classification, slow root cause analysis |
| Time | ~5 hrs per deviation, 8/month = 40 hrs/month |

**Scoring:**

| Criterion | Score | Weighted |
|---|---|---|
| Impact | 4 | 1.20 |
| Feasibility | 3 | 0.75 |
| Risk (inverted) | 3 | 0.60 |
| Strategic Value | 5 | 0.75 |
| Quick Win | 3 | 0.30 |
| **Total** | | **3.60** |

**Recommendation:** KTG Build — AI Agent. AI-assisted deviation classification using historical deviation data, automated root cause suggestion, structured CAPA workflow with human-in-the-loop approval at every quality gate. Regulatory risk demands human sign-off; AI accelerates analysis, not decisions.

---

### Process 3: Material Lot Receipt and Release

**Process Map Summary:**

| Field | Detail |
|---|---|
| Trigger | Raw material shipment arrives at warehouse |
| Steps | 1. Receive shipment 2. Check packing list against PO 3. Inspect lot certificates 4. Log in inventory system 5. Quality samples and tests 6. Release or reject lot 7. Update ERP |
| Handoffs | Warehouse > Quality > Warehouse |
| Pain Points | Manual certificate checking, duplicate data entry between paper and ERP |
| Time | ~1.5 hrs per lot, 40 lots/month = 60 hrs/month |

**Scoring:**

| Criterion | Score | Weighted |
|---|---|---|
| Impact | 5 | 1.50 |
| Feasibility | 4 | 1.00 |
| Risk (inverted) | 3 | 0.60 |
| Strategic Value | 3 | 0.45 |
| Quick Win | 4 | 0.40 |
| **Total** | | **3.95** |

**Recommendation:** KTG Build — n8n Workflow + AI Agent. AI extracts data from supplier certificates of analysis (CoA), validates against spec tolerances, auto-populates ERP fields. Human reviews and approves release. Highest volume process; significant time recovery.

---

### Process 4: Cleanroom Environmental Monitoring

**Process Map Summary:**

| Field | Detail |
|---|---|
| Trigger | Scheduled monitoring intervals (continuous + periodic sampling) |
| Steps | 1. Sensors log temperature, humidity, particle count 2. Operator reads and records values manually 3. Supervisor reviews daily logs 4. Quality trends data monthly 5. Excursions trigger investigation |
| Handoffs | Sensors > Operator > Supervisor > Quality |
| Pain Points | Manual transcription from sensor displays, delayed excursion detection, monthly trending instead of real-time |
| Time | ~2 hrs/day manual logging = 40 hrs/month |

**Scoring:**

| Criterion | Score | Weighted |
|---|---|---|
| Impact | 4 | 1.20 |
| Feasibility | 3 | 0.75 |
| Risk (inverted) | 3 | 0.60 |
| Strategic Value | 4 | 0.60 |
| Quick Win | 2 | 0.20 |
| **Total** | | **3.35** |

**Recommendation:** KTG Build — Dashboard + n8n Workflow. If sensors have data export capability (API, CSV, MQTT), build automated data collection pipeline with real-time Power BI dashboard and automated excursion alerting via Teams. If sensors are analog/display-only, recommend sensor upgrade first (Third-Party Tool), then automate. Phase 2 candidate due to hardware dependency.

---

### Process 5: Sales-to-Engineering Handoff

**Process Map Summary:**

| Field | Detail |
|---|---|
| Trigger | New project or significant change order confirmed |
| Steps | 1. Sales confirms order details 2. Sales creates handoff document (Word/email) 3. Engineering reviews and asks clarifying questions 4. Back-and-forth until engineering has what they need 5. Engineering creates project in system |
| Handoffs | Sales > Engineering (with 2-4 round trips) |
| Pain Points | Incomplete information in initial handoff, 2-4 clarification cycles, no standard template |
| Time | ~3 hrs per handoff, 10/month = 30 hrs/month |

**Scoring:**

| Criterion | Score | Weighted |
|---|---|---|
| Impact | 3 | 0.90 |
| Feasibility | 5 | 1.25 |
| Risk (inverted) | 5 | 1.00 |
| Strategic Value | 3 | 0.45 |
| Quick Win | 5 | 0.50 |
| **Total** | | **4.10** |

**Recommendation:** Process Improvement + Microsoft Native. This is primarily a process problem, not a technology problem. Create a structured handoff template in SharePoint/Forms that forces completeness before submission. Use Power Automate to route and notify. No custom build needed — advise the client, help design the template, and move on. This is the kind of honest recommendation that builds trust.

---

## 5. Tools and Templates

Every discovery uses this toolkit. Templates live in my knowledge base and get customized per client.

| Tool | Format | Purpose |
|---|---|---|
| Stakeholder Interview Guide | This document, Section 2A | Structured questions for all three interview tiers |
| Process Mapping Template | Spreadsheet (Excel/Sheets) | Blank template with all fields from Section 2B |
| Scoring Spreadsheet | Spreadsheet with formulas | Weighted matrix with auto-calculated scores from Section 2C |
| Decision Tree Reference Card | One-page PDF | Printed reference for solution categorization from Section 2D |
| Process Audit Report Template | Word/Markdown | Deliverable structure from Section 3 |
| Phase 0 Scope Template | One-page proposal | Defines discovery scope, timeline, and cost |
| Engagement Letter | PDF | Terms, confidentiality, IP ownership, and pricing |
| Weekly Check-in Template | Email/Teams | Status update format for build phases |

---

## 6. Pricing Guidance

Discovery pricing is based on company complexity, not hourly rates. Fixed price covers everything — interviews, mapping, scoring, the report, and a readout call.

| Company Size | Profile | Price Range (S$) | Duration |
|---|---|---|---|
| Small | 1 site, <50 employees, <10 key processes | 8,000 - 12,000 | 1 week |
| Medium | 2-3 sites, 50-200 employees, 10-25 key processes | 15,000 - 25,000 | 2 weeks |
| Large | 4+ sites, 200+ employees, 25+ key processes | 25,000 - 40,000 | 2-3 weeks |

**Included in discovery fee:**
- All interviews (executive, manager, operator)
- Complete process mapping and documentation
- Weighted scoring and prioritization
- Solution recommendations with decision tree analysis
- Full Process Audit Report
- Readout presentation to leadership team
- 30-minute follow-up call two weeks after delivery

**IP ownership:** All work product belongs to the client unconditionally. No retained licenses, no usage restrictions.

**Phase 1 credit:** If the client proceeds to a build within 60 days of report delivery, the discovery fee gets credited toward Phase 1. Removes the "paying twice" objection. If the discovery is good, the build follows naturally.

**Travel:** For Singapore-based clients, travel is included. For international sites, travel and accommodation are billed at cost with prior approval.

---

## Appendix: Discovery Engagement Checklist

Before starting:

- [ ] Signed scope doc with pricing
- [ ] NDA executed (if required)
- [ ] Org chart or team structure received
- [ ] List of key systems and tools in use
- [ ] Interview schedule confirmed (all three tiers)
- [ ] Site access arranged (if manufacturing/cleanroom)
- [ ] Scoring spreadsheet prepared with client context
- [ ] Report template customized with client branding

During discovery:

- [ ] Executive interviews completed
- [ ] Manager interviews completed
- [ ] Operator interviews and observations completed
- [ ] All processes mapped using template
- [ ] Scoring completed for all mapped processes
- [ ] Decision tree applied to all scored processes
- [ ] Opportunity map plotted
- [ ] Draft report assembled

Post-discovery:

- [ ] Report reviewed and finalized
- [ ] Readout presentation prepared
- [ ] Readout delivered to leadership
- [ ] Follow-up call scheduled (2 weeks post-delivery)
- [ ] Phase 1 proposal prepared (if applicable)
