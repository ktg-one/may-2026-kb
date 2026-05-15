# CRM Schema — Notion Database Structure

**Document:** business-context/crm-schema.md
**KB Version:** 1.0
**Last Updated:** 2026-02-27

---

## Overview

The Kismet CRM is built entirely in Notion and consists of three core relational databases plus supporting databases for forms, tasks, and pipeline management. These databases are already built and populated with historical client data.

**Primary Notion workspace:** Kismet Finance Group (Operations 2026)

---

## Core Database Architecture

```
MASTER DATABASE 2025 (main pipeline)
    ↕ relates to
People Database (contacts & relationships)
    ↕ relates to
Household Database (client units & collective assets)
    ↕ relates to
Entities Database (corporate structures & legal entities)
    ↕ relates to
DQ Form Responses (door-knock intake)
    ↕ relates to
Client Assessment Form (post-discovery financial data)
```

---

## 1. MASTER DATABASE 2025 (Pipeline)

**Purpose:** The primary lead and client pipeline. Every active lead, prospect, and client record lives here. This is the operational heart of the CRM.

**Also known as:** Operations 2026 (the active view name), Pipeline 2026

### Key Properties

| Property | Type | Description |
|----------|------|-------------|
| Name | Title | Lead/client full name |
| Status | Select | Pipeline stage (see lead-stages.md for full list) |
| Lead Owner | Person | Assigned field rep or consultant |
| Phone | Phone | Primary contact number |
| Email | Email | Primary contact email |
| Address | Text | Physical address of the lead |
| Suburb | Text | Suburb for territory tracking |
| Discovery Booked | Date | Date of booked discovery meeting |
| Discovery Date | Date | Actual discovery meeting date |
| Pathway | Select | "Housing" or "SMSF" |
| Notes | Text | Free-form notes from reps/consultants |
| Agent Confirmation | Text | ID of AI agent currently working the task |
| DQ Form | Relation | Links to DQ Form Responses |
| Assessment Form | Relation | Links to Client Assessment Form |
| Household | Relation | Links to Household database |
| Drive Folder | URL | Google Drive folder for this client |
| Calendar Event | URL | Google Calendar discovery event link |

### Active Views

| View Name | Purpose |
|-----------|---------|
| **CHECK** | Quality control — verify new leads landed correctly, validate phone/data |
| **FEEDBACK CALL** | Qualified leads ready for feedback call and discovery booking |
| **DISCOVERY** | Pipeline board showing leads at DISCOVERY stage |
| **Active Pipeline** | All active work across all stages |
| **Investor** | Filtered view for investor pathway leads |
| **SMSF** | Filtered view for SMSF pathway leads |
| **Missing Notes** | Compliance — records missing required documentation |
| **Ghost Detector** | (Planned) Appointments with no post-meeting notes recorded |

---

## 2. People Database

**Purpose:** Stores individual contacts and their relational mappings within the ecosystem. A "person" can be a lead, a client, a partner, or a professional contact.

### Key Properties

| Property | Type | Description |
|----------|------|-------------|
| Name | Title | Full legal name |
| Role | Select | Lead / Client / Partner / Referral / Staff |
| Email | Email | Primary email |
| Phone | Phone | Mobile/landline |
| DOB | Date | Date of birth (PII — handle with care) |
| TFN Status | Checkbox | Tax File Number provided (do not store TFN itself) |
| Household | Relation | Links to their Household record |
| Entity | Relation | Links to any corporate entity they control |
| Pipeline Record | Relation | Links to their MASTER DATABASE 2025 entry |
| Notes | Text | Additional context |

---

## 3. Household Database

**Purpose:** Represents a household or client unit — typically a couple or family. Aggregates individual People records and collective financial data.

### Key Properties

| Property | Type | Description |
|----------|------|-------------|
| Household Name | Title | Family/unit name (e.g., "Smith Family") |
| Members | Relation | Links to People database (all household members) |
| Primary Contact | Relation | Links to one Person as main contact |
| Entity | Relation | Links to any entities owned by the household |
| Total Super Balance | Number | Aggregated super balance (for SMSF qualification) |
| Property Ownership | Checkbox | Does household own property? |
| Investment Properties | Number | Count of investment properties held |
| Pathway | Select | Housing / SMSF / Both |
| Status | Select | Lead / Prospect / Client / Inactive |
| Drive Folder | URL | Household-level Google Drive folder |
| Pipeline Records | Relation (rollup) | All pipeline entries for this household |

---

## 4. Entities Database

**Purpose:** Tracks corporate structures and legal entities associated with clients — companies, trusts, SMSFs, and other legal vehicles.

### Key Properties

| Property | Type | Description |
|----------|------|-------------|
| Entity Name | Title | Registered entity name |
| Entity Type | Select | Company / Trust / SMSF / Partnership / Sole Trader |
| ABN | Text | Australian Business Number |
| ACN | Text | Australian Company Number (if applicable) |
| SMSF Fund Name | Text | Name of SMSF (if entity type = SMSF) |
| SMSF Balance | Number | Current SMSF balance (for qualification) |
| Directors / Trustees | Relation | Links to People database |
| Household | Relation | Links to parent Household |
| ATO Registration | Checkbox | Registered with Australian Tax Office? |
| Drive Folder | URL | Entity-level document folder |
| Status | Select | Active / Winding Up / Inactive |

---

## 5. DQ Form Responses Database

**Purpose:** Captures raw intake data from door-knock qualification forms submitted by field reps via Fillout. This is the top-of-funnel entry point.

**Important:** Do NOT modify this database's structure.

### Key Properties

| Property | Type | Description |
|----------|------|-------------|
| Lead Name | Title | Name as submitted in DQ form |
| Submission Date | Date | When form was submitted |
| Rep | Person | Field rep who submitted |
| Phone | Phone | Lead's phone number |
| Address | Text | Lead's address |
| Homeowner | Checkbox | Is the lead a homeowner? |
| Investor | Checkbox | Does lead have investment properties? |
| Super Balance | Select | Estimated super range (e.g., $100k+, $50-100k, under $50k) |
| Interest Level | Select | High / Medium / Low / Not Interested |
| Best Call Time | Text | When lead prefers to be contacted |
| Pipeline Record | Relation | Links to MASTER DATABASE 2025 once verified |
| Status | Select | New / Verified / Invalid / Duplicate |

---

## 6. Client Assessment Form Database

**Purpose:** Stores detailed financial assessment data collected post-discovery. Contains sensitive financial information — handle with extreme care.

**Important:** Do NOT modify this database's structure.

### Key Properties

| Property | Type | Description |
|----------|------|-------------|
| Client Name | Title | Full name of client assessed |
| Assessment Date | Date | Date of assessment |
| Consultant | Person | Consultant who conducted assessment |
| Pathway | Select | Housing / SMSF / Both |
| Income (Applicant 1) | Number | Annual gross income — PII |
| Income (Applicant 2) | Number | Annual gross income — PII |
| Existing Debts | Number | Total existing liabilities — PII |
| Super Balance | Number | Total superannuation — PII |
| Property Goals | Text | Client's stated property goals |
| SMSF Goals | Text | Client's SMSF objectives |
| Risk Profile | Select | Conservative / Balanced / Growth / Aggressive |
| Special Notes | Text | Consultant observations, exceptions, flags |
| Pipeline Record | Relation | Links to MASTER DATABASE 2025 |

---

## Automation Integration Points

These are the connection points between Notion databases and external systems:

| Trigger | System | Action |
|---------|--------|--------|
| DQ Form submitted | Fillout → n8n | Create record in DQ Form Responses DB |
| Status = PROSPECT AND Discovery Booked set | Notion → n8n | Generate Client Assessment Form, sync to Google Calendar |
| Status = ONBOARDING | Notion → n8n | Send welcome email, create Drive folder, prepare DocuSign packet |
| Status = CLIENT | Notion → n8n | Trigger onboarding automation sequence |
| Missing notes detected | Ghost Detector (planned) | Alert rep and manager via email |
| 24hr no action | Escalation engine (planned) | Notify manager |

---

## Button Automations (In-Notion)

| Button | Action | Status |
|--------|--------|--------|
| Complete | Marks task done and advances pipeline stage | Planned (n8n) |
| Escalate | Sends manager alert for pending action | Planned (n8n) |
| Sync to Google | Forces Drive/Calendar data sync | Planned (n8n) |
| Send Authority | Prepares DocuSign packet for client signature | Planned (DocuSign) |
| Ask AI | Triggers Vertex AI query for lead analysis | Planned (Vertex AI) |

---

## Relational Property Map

```
People ←→ Household (many People per Household)
People ←→ Entities (People can control multiple Entities)
Household ←→ Entities (Household can own Entities including SMSFs)
Household ←→ MASTER DB (Household has pipeline records)
MASTER DB ←→ DQ Form Responses (one pipeline record per DQ submission)
MASTER DB ←→ Client Assessment Form (one assessment per pipeline record)
```

---

## Data Governance Rules

- All databases are already built — do not add or remove properties without approval from Kevin Tan
- Do not expose PII (phone, email, DOB, TFN, income) in logs or outputs
- Financial figures (income, debt, super balance) are classified as sensitive — treat as PII
- SMSF balances and entity structures are commercially sensitive
- Historical data has been cleaned and imported — validate before modifying

---

*Back to [index.md](../index.md)*
