# Email Leakage Scanner — Scope & Quote
## AP Technologies | May 2026
### Kev Tan

---

## What Charles Asked For

"A chatbot that scans all company emails to check for data leakage."

What this means in practice: an automated system that reads every email flowing through AP Tech's Exchange Online environment, classifies whether it contains proprietary or sensitive content, scores the risk of that content reaching the wrong hands, and alerts when something looks wrong. Not a chatbot in the conversational sense — a scanning engine with an alert and dashboard layer on top.

The scope covers all four sites (Singapore HQ, Xiamen, Bac Ninh, Irvine) since they share the same Microsoft 365 tenant.

---

## The Honest Conversation First

Before quoting a custom build, I need to flag something: Microsoft already has a built-in tool for this — **Microsoft Purview Data Loss Prevention**. It's included with M365 E5 (or as an add-on to E3). It scans emails, flags sensitive content, blocks transmission of classified data, and generates compliance reports. It covers Exchange, SharePoint, OneDrive, Teams, Power BI, and endpoints with unified policy enforcement.

**So why would you build a custom scanner instead of just configuring Purview?**

Three reasons it might make sense:

1. **AP Tech-specific IP detection.** Purview is good at detecting standard sensitive data — credit card numbers, national IDs, health records. It ships with 300+ sensitive information types and trainable classifiers. It is not good at detecting YOUR proprietary IP — PTFE extrusion parameters, die geometry specs, customer-specific tolerance requirements, FEP melt temperature profiles, pricing matrices. A custom scanner trained on your actual documents can catch leakage that Purview misses entirely.

2. **Cross-jurisdictional intelligence.** Purview doesn't natively understand that sending a Xiamen engineer's process parameters to a personal Gmail crosses both IP protection and PIPL boundaries simultaneously. A custom system can layer jurisdictional rules on top of content classification — flagging not just what was sent, but the legal implications of where it went.

3. **Actionable intelligence, not just blocking.** Purview blocks or warns. A custom system provides intelligence — who's sending what to whom, pattern analysis over time, risk scoring per department and site, trend dashboards that show whether your security posture is improving or degrading. This moves from compliance checkbox to actual visibility into how your IP flows.

**My recommendation**: configure Purview first for the standard stuff (PII, financial data, health records). Build the custom scanner for AP Tech-specific IP detection and the intelligence layer. They complement each other. If you're on E3 today, the Purview DLP add-on is worth evaluating — but it won't replace the custom IP detection layer regardless.

---

## What I'd Build

### Architecture

```
Microsoft Graph API (read emails + attachments)
       ↓ scheduled scan (every 15 min or real-time via webhooks)
n8n Orchestration Layer
       ↓ extracts content: body, attachments, metadata, recipients
AI Classification Engine (Claude/GPT)
       ↓ classifies against AP Tech's custom ruleset:
       │  - Proprietary process parameters
       │  - Customer pricing / commercial terms
       │  - Design files / CAD / specifications
       │  - Employee data / HR records
       │  - Regulatory submissions / audit data
       ↓ risk scoring: Low / Medium / High / Critical
   ┌───┴───────────────────┐
   ↓                       ↓
Alert Dashboard          Notification
(Power BI / SharePoint)  (Teams alert to security lead)
```

Microsoft Graph API provides full access to Exchange Online messages, attachments, and metadata. The Message Trace API is now GA as of early 2026, replacing the legacy Reporting Web Service that retired in April 2026. Webhooks can push change notifications in near real-time, or we batch-poll on a 15-minute cycle depending on volume and urgency requirements.

### What It Scans For (AP Tech-Specific Ruleset)

This is where the value lives. Not generic PII detection — AP Tech-specific intellectual property:

| Category | What to Detect | Risk Level | Example |
|---|---|---|---|
| Process IP | Extrusion parameters, melt temps, line speeds, die geometries, CpK data | Critical | Engineer forwarding parameter card to personal email |
| Material Formulations | PTFE/FEP/PEBAX/PEEK specs, resin ratios, additive formulations | Critical | Spec sheet attached to email going to competitor domain |
| Customer Commercial | Pricing matrices, contract terms, volume commitments, OEM-specific specs | High | Pricing spreadsheet sent to wrong customer |
| Design Files | CAD files, tooling drawings, catheter assembly specs | High | Design file going to non-approved recipient |
| Regulatory | FDA submissions, validation protocols, audit reports, CAPA details | Medium | Audit report forwarded outside the company |
| HR/Personnel | Employee records, salary data, performance reviews | Medium | HR data sent to personal email |
| Cross-Border | Any of the above crossing jurisdictional boundaries inappropriately | Varies | Singapore process data going to personal Chinese email account |

### How It Works Day-to-Day

- **Automated scanning**: every email gets scanned — body text and attachments (PDFs, Excel, Word, images with OCR). Either real-time via Graph API webhooks or batched every 15 minutes.
- **Risk scoring**: each email gets a risk score. Low = normal business email. Medium = contains some sensitive content but sent to appropriate recipients. High = sensitive content going to unusual recipients. Critical = IP going to personal email, competitor domains, or unauthorized external parties.
- **Alerts**: High and Critical trigger immediate Teams notification to a designated security lead — probably Charles or Sean Tang initially, then a dedicated person once the system is trusted.
- **Dashboard**: weekly and monthly view of the email risk landscape. Which departments, which sites, which content types, trending up or down.
- **No blocking on day one**: the system monitors and alerts. It does not block. Blocking can come later once you trust the classification accuracy and have defined enforcement policies. Starting with blocking creates massive pushback and false-positive noise.

### Privacy Architecture

This is the section Charles needs to think through carefully before anything gets built.

- **Who sees flagged emails?** Only designated security leads. Not managers, not general IT staff, not HR. Define this in a written policy before deployment.
- **What gets logged?** Email metadata: sender, recipient, subject line, timestamp, risk score, category. NOT full email content. Full content is only accessed when investigating a High or Critical flag, by an authorized person, with an audit trail.
- **Employee notification**: employees must be told the system exists. This is required by PDPA in Singapore, PIPL in China, and is generally good practice everywhere. Frame it as protecting company IP and ensuring regulatory compliance — not monitoring individuals.
- **Jurisdictional compliance**:
  - **Singapore (PDPA)**: notification required, must demonstrate legitimate business purpose, access controls mandatory
  - **China (PIPL)**: employee consent may be required for content scanning, data localization rules apply — scan results for Xiamen should stay in-region if possible
  - **US (Irvine)**: generally permissible on company email systems, but California privacy law (CCPA/CPRA) requires transparency; check with counsel
  - **Vietnam (Cybersecurity Law)**: notification required, data localization considerations for Bac Ninh operations
- **Retention**: scan results retained for an agreed period (6-12 months is typical), then auto-deleted. No indefinite storage of metadata.
- **False positive handling**: clear process for when something gets flagged incorrectly. Quick resolution, no permanent mark on the employee. This needs to be documented and communicated.

### What It Won't Do

- It won't read WhatsApp or WeChat messages. Different systems, different privacy rules, and much harder to justify legally in China and Vietnam.
- It won't catch someone photographing a screen or verbally sharing information. This is email-layer protection only.
- It won't block emails in real-time on day one. Monitor-first approach for at least 4-6 weeks.
- It's not a replacement for Purview — it complements it for AP Tech-specific IP that Purview can't detect.
- It won't achieve 100% accuracy. AI classification will have false positives and false negatives. The system requires human review for anything flagged High or Critical.

---

## Timeline

### Phase 1 — Core Scanner MVP (5-7 weeks)

- **Week 1**: Discovery. Inventory AP Tech's IP categories with the engineering and commercial teams. Define the classification ruleset. Assess email volume across all four sites. Get Graph API permissions configured. Review privacy requirements per jurisdiction.
- **Week 2**: Build classification engine. Train and prompt-engineer the AI on AP Tech's specific IP types using sample documents. I'll need real examples of what "sensitive" looks like for your business.
- **Weeks 3-4**: Build scanning pipeline. n8n workflow reading emails via Graph API, running classification, storing results. Handle attachment extraction — PDFs, Office documents, images.
- **Week 5**: Build alert system. Teams notifications for High and Critical flags. Basic SharePoint or Power BI dashboard showing scan results.
- **Weeks 6-7**: Testing and tuning. Run against recent historical emails (with explicit permission and legal sign-off). Tune for false positive rate. Adjust thresholds and classification prompts.
- **Deliverable**: working scanner monitoring all company email, alerting on AP Tech-specific IP leakage, basic dashboard. Accuracy target: below 10% false positive rate on High/Critical alerts.

### Phase 2 — Intelligence Layer (4-6 weeks after Phase 1)

- Pattern analysis: who sends sensitive content, to whom, how often
- Risk scoring per department, site, and role (aggregated, not punitive)
- Trend dashboards in Power BI with drill-down by site, category, and time period
- Attachment deep scanning: OCR for scanned documents and images, table extraction from spreadsheets, CAD file metadata analysis
- Cross-border rule engine: flag content crossing jurisdictional boundaries with specific regulatory context
- **Deliverable**: full intelligence dashboard with trend analysis and jurisdictional awareness

### Phase 3 — Policy Enforcement (Optional, 3-4 weeks)

- Integration with Purview for blocking or warning on outbound emails (requires E5 or DLP add-on)
- Automated hold on High/Critical emails pending human review
- Compliance reporting formatted for FDA and ISO 13485 audits
- **Deliverable**: active enforcement layer, not just monitoring

---

## Pricing

| Phase | Duration | What You Get | Price |
|---|---|---|---|
| Phase 1 — Core Scanner | 5-7 weeks | Email scanning pipeline, AP Tech IP classification, alerting, basic dashboard | S$30,000-40,000 |
| Phase 2 — Intelligence | 4-6 weeks | Pattern analysis, trend dashboards, cross-border rules, deep attachment scanning | S$35,000-45,000 |
| Phase 3 — Enforcement | 3-4 weeks | Purview integration, automated holds, compliance reporting | S$20,000-30,000 |

### Pricing Notes

- Fixed price per phase. No hourly billing, no scope creep charges within the defined deliverables.
- Phase 1 price depends on email volume and number of IP categories to train. More categories means more tuning time.
- The biggest cost driver is accuracy tuning. Getting from 80% to 95% accuracy takes more time than getting from 0% to 80%. The difference between a system that's annoying (too many false positives) and one that's useful lives in those tuning weeks.
- If you have M365 E5 with Purview, I'll configure Purview for standard sensitive data types at no extra charge during Phase 1. That's 2-3 hours of work and gives you immediate coverage for PII and financial data while the custom scanner focuses on your proprietary IP.

### Ongoing Costs

- **My maintenance**: S$2,000-3,000/month — monitoring system health, reviewing false positive patterns, updating the ruleset as your IP categories evolve, adjusting classification as new document types appear
- **AI API costs**: S$100-400/month depending on email volume. This is the Claude or GPT classification cost and scales linearly with scan volume.
- **n8n hosting**: S$100-200/month
- **No additional Microsoft licensing** if you're already on M365 E3 or E5. Graph API access is included in your existing tenant.

### Total First-Year Cost (All 3 Phases)

- Build: S$85,000-115,000
- Ongoing (12 months): S$30,000-48,000
- **Total year 1: S$115,000-163,000**

---

## What I Need From You

1. **Admin consent for Microsoft Graph API** — specifically `Mail.Read` permissions across the tenant. This is an IT and security decision that needs sign-off from whoever manages your Azure AD.
2. **20-30 sample documents** representing each IP category: process parameter cards, pricing sheets, design files, formulation specs, regulatory submissions. These train the classifier and define what "sensitive" means for AP Tech specifically.
3. **A written decision on access control** — who gets access to flagged emails and scan results. Name specific people and roles before I build anything.
4. **Legal review per jurisdiction** — I can outline the privacy requirements, but your legal team (or external counsel in each country) needs to sign off on the monitoring approach, especially for Xiamen under PIPL.
5. **Email volume estimate** — rough daily email count across all four sites. I need this to size the infrastructure and refine the API cost estimate.

---

## Risks and Honest Assessment

**Privacy pushback is the biggest risk.** Not the technology. Employees will resist email scanning if it's framed poorly or rolled out without transparency. Get legal and HR aligned before deployment. Communicate clearly. The framing matters — this is about protecting AP Tech's trade secrets and meeting regulatory obligations across four jurisdictions, not about watching people.

**False positives will happen**, especially in the first few weeks. The AI will flag things incorrectly. Budget the time in weeks 6-7 for tuning. A 5-8% false positive rate on High/Critical alerts is realistic after tuning. Getting below 3% requires significant ongoing investment in classification refinement.

**China is the hardest jurisdiction.** PIPL is strict about employee monitoring and data processing. The Xiamen deployment may need a modified approach — possibly metadata-only scanning (sender, recipient, attachment type, file size) without full content analysis, at least initially. Get local legal counsel before scanning Xiamen email content.

**Scale matters.** This architecture works well for a company AP Tech's size. If daily email volume exceeds 50,000 messages, we need to discuss batch processing windows, infrastructure scaling, and potentially higher API costs.

**Purview overlap is a feature, not a bug.** If you upgrade to M365 E5 or add the Purview DLP license, the built-in DLP covers standard sensitive data types well. My custom build then becomes the AP Tech IP layer on top — still valuable for proprietary content detection and the intelligence dashboard, but the scope and pricing might shrink. That's a good outcome. You'd be paying less for the custom work because Microsoft handles more of the baseline.
