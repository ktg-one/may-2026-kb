# Business Context — Firm Overview

**Document:** business-context/overview.md
**KB Version:** 1.0
**Last Updated:** 2026-02-27

---

## Firm Identity

| Field | Value |
|-------|-------|
| **Firm Name** | Kismet Finance Group |
| **Operating Brand** | GoodAI.au (AI ops layer) |
| **Location** | Perth, Western Australia, Australia |
| **Primary Website** | https://goodai.au |
| **Agent Hub** | https://ktg.one |
| **Owner/Developer** | Kevin Tan |
| **Admin** | Admin Kismet |

---

## Business Model

Kismet Finance Group is an Australian financial services firm that operates across three core service lines:

### 1. Mortgage Broking (Housing Pathway)
- Residential home loans and refinancing
- First home buyer assistance
- Investment property finance
- Clients are primarily homeowners or prospective buyers with a property focus

### 2. Self-Managed Superannuation Fund (SMSF) Advisory
- SMSF setup and administration guidance
- SMSF property investment strategy
- Target client: individuals with super balance $100k+
- Regulatory context: SMSF rules under Australian superannuation law (SIS Act)

### 3. Financial Planning
- General financial advice
- Wealth accumulation strategy
- Integrated with mortgage and SMSF pathways

---

## Client Acquisition Model

**Primary channel: Door-to-door lead generation**

Field representatives knock doors in residential suburbs, identify prospects, and submit qualification forms (DQ Forms) on the spot via mobile. This is the top-of-funnel entry point for most leads.

**Secondary channels:**
- Referrals (existing clients)
- Inbound (digital/web)

---

## Client Types

| Type | Description | Key Qualifier |
|------|-------------|---------------|
| **Homeowner** | Owns property, potential for refinance or equity release | Confirmed property ownership |
| **Investor** | Holds or seeks investment properties | Investment intent confirmed |
| **SMSF Prospect** | Has or wants an SMSF for property investment | Super balance $100k+ |
| **First Home Buyer** | No current property, seeking first purchase | Savings/income serviceability |

---

## Service Pathways

Leads are classified into one of two primary strategic pathways after qualification:

### Housing / Property Pathway
- Scope: Owner-occupier or investment property loans
- Tools: Notion pipeline, Google Calendar (discovery bookings), DocuSign (authority docs)
- Outcome: Settled loan, ongoing client relationship

### SMSF Pathway
- Scope: SMSF establishment, LRBA (Limited Recourse Borrowing Arrangement) for property
- Tools: Client Assessment Form, specialist SMSF adviser referral
- Outcome: SMSF set up, property purchased within super, ongoing administration

---

## Pipeline Overview

The end-to-end client journey follows this flow:

```
Door Knock
    ↓
DQ Form (Fillout) — field rep submits on mobile
    ↓
DQ Form Responses DB — auto-populates Notion
    ↓
CHECK View — admin verifies lead quality
    ↓
FEEDBACK CALL — qualify, book discovery
    ↓
DISCOVERY — meeting/call to assess needs
    ↓
Client Assessment Form — consultant fills post-discovery
    ↓
Pathway Assignment (Housing or SMSF)
    ↓
ONBOARDING — email sent, authority docs prepared
    ↓
CLIENT — active file opened, servicing begins
```

---

## Key Personnel

| Role | Person | Responsibilities |
|------|--------|-----------------|
| Dev / Owner | Kevin Tan | n8n workflows, button automations, DocuSign, webhooks, agent orchestration |
| Admin | Admin Kismet | API/credential management, form connections, sync debugging, lead quality control |
| Field Reps | Shane, Josh (and others) | Door-knock, DQ form submission, discovery booking |
| Notion AI | (automated) | Documentation, database structures, reporting templates |
| Vertex AI | (planned) | RAG, summarization, voice transcription, GPS integration |

---

## Technology Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| CRM | Notion | Primary database and operations system |
| Automation | n8n (self-hosted + cloud) | Webhooks, workflow logic, API integrations |
| Forms | Fillout | DQ Form (door knock), Client Assessment Form |
| Calendar | Google Calendar | Discovery booking, callback scheduling |
| Storage | Google Drive | Client folders, signed documents, backups |
| Documents | DocuSign | Authority to Act, Engagement Agreement (planned) |
| Analytics | Looker Studio | BI dashboards, CRM activity overview (planned) |
| AI Orchestration | Claude Code (orchestrator) | Primary agent runtime for complex tasks |
| AI Agents | Gemini CLI, Codex CLI | Parallel agent workers |
| AI Platform | Vertex AI (GCP) | RAG, voice note transcription, conversation agent (planned) |
| Memory | mem0 | Agent memory and task logging |
| Remote n8n | https://ai-yah-old.taile6f11d.ts.net/ | Tailscale-connected n8n instance |

---

## Compliance Context (Australian Financial Services)

- **Regulatory body:** ASIC (Australian Securities and Investments Commission)
- **Licence type:** Australian Credit Licence (ACL) for mortgage broking; Australian Financial Services Licence (AFSL) for financial planning and SMSF advice
- **Key obligation:** "Authority to Act" document must be signed before acting on client's behalf
- **Engagement Agreement:** Required before providing financial advice
- **Data sensitivity:** All client records contain PII — strict handling required
- **SMSF regulation:** Superannuation Industry (Supervision) Act 1993 (SIS Act)

---

## Operational Rules for Agents

- **Do NOT modify OPERATIONS 2026** view filters, layouts, or automations in Notion
- **Do NOT touch the Databases (do not touch) page** structure in Notion
- **Do NOT expose PII** in logs, outputs, or external transmissions
- **Do NOT process SMSF-specific advice** — refer to qualified SMSF adviser
- **Do verify lead quality** before marking any status as PROSPECT or above

---

*Back to [index.md](../index.md)*
