# Compliance — Data Handling Rules

**Document:** compliance/data-handling.md
**KB Version:** 2.0
**Last Updated:** 2026-02-27
**Source:** business-context/overview.md, crm-schema.md, STRUCTURED_AGENTS_KB.md, Australian Privacy Act 1988, NCCP Act 2009

---

## Purpose

This document defines mandatory data handling rules for all AI agents operating within the Kismet Finance Group ecosystem. Violations of these rules can expose the firm to regulatory penalties under Australian law. Read this before accessing any client record.

---

## Regulatory Context

Kismet Finance Group operates as an Australian financial services firm and is subject to:

| Legislation | Regulator | Applies To |
|-------------|-----------|-----------|
| **Privacy Act 1988 (Cth)** | OAIC (Office of the Australian Information Commissioner) | All personal information handling |
| **Australian Privacy Principles (APPs)** | OAIC | Collection, use, disclosure, storage of PI |
| **National Consumer Credit Protection Act 2009 (NCCP Act)** | ASIC | Mortgage broking, credit activities |
| **Australian Credit Licence (ACL) obligations** | ASIC | Responsible lending, client file records |
| **Corporations Act 2001 — AFSL obligations** | ASIC | Financial planning, SMSF advice |
| **Superannuation Industry (Supervision) Act 1993 (SIS Act)** | ATO / APRA | SMSF advice and fund management |

---

## What is Personal Information (PI)?

Under the Privacy Act 1988, **Personal Information** is information or an opinion about an identified individual, or an individual who is reasonably identifiable. The following fields in the Kismet CRM are classified as Personal Information:

### Standard PII (Personally Identifiable Information)

| Field | Database | Sensitivity |
|-------|----------|-------------|
| Full Name | All databases | PI — medium |
| Phone number | MASTER DB, People, DQ Form | PI — medium |
| Email address | MASTER DB, People | PI — medium |
| Physical address / suburb | MASTER DB, DQ Form | PI — medium |
| Date of birth (DOB) | People Database | PI — high |
| TFN (Tax File Number) | People Database (flag only — never store TFN itself) | PI — critical |

### Sensitive Financial Information (Treated as Sensitive PI)

| Field | Database | Sensitivity |
|-------|----------|-------------|
| Annual income | Client Assessment Form | Sensitive PI — high |
| Existing debts / liabilities | Client Assessment Form | Sensitive PI — high |
| Superannuation balance | Client Assessment Form, Entities | Sensitive PI — high |
| SMSF fund name and balance | Entities Database | Sensitive PI — high |
| ABN / ACN | Entities Database | Commercial — medium |
| Risk profile | Client Assessment Form | Sensitive PI — medium |
| Property goals / SMSF goals | Client Assessment Form | PI — medium |

---

## Australian Privacy Act 1988 — Key Obligations for Agents

### APP 3 — Collection of Solicited PI

- Agents must only access PI that is **directly relevant** to the task being executed
- Do not read fields you do not need for the current task
- Do not collect additional PI beyond what the task requires

### APP 5 — Notice of Collection

- Agents must not collect new PI from individuals without proper consent mechanisms in place
- Do not contact leads or clients directly — all outbound communication is human-initiated (Kevin Tan, Admin Kismet, or field reps)

### APP 6 — Use and Disclosure

- PI collected for one purpose must not be used for another purpose without consent
- Lead contact details collected for mortgage broking cannot be used for unrelated marketing
- Do not cross-reference lead data with external databases

### APP 8 — Cross-Border Disclosure

- Do not send PI to any system or service hosted outside Australia without confirming APP 8 compliance
- **Flagged services:** mem0 (cloud, US-hosted) — use only for task metadata (agent ID, task name, timestamps). Never log PI fields in mem0.
- Google Drive — approved for client document storage (Google operates Australian data centres)
- Notion — used for CRM data; confirm Australian data residency or obtain client consent

### APP 11 — Security of PI

- PI must be protected from misuse, interference, loss, and unauthorised access or disclosure
- Do not output PI in plaintext to logs, terminal, or external systems
- Do not include PI in error messages routed to KISMET-Error-Log (which writes to Google Sheets)
- Do not store PI in code comments, temporary files, or variables that persist beyond the task

### APP 12 — Access to PI

- Agents are not authorised to respond to individual data access requests — escalate to Kevin Tan
- If a lead requests their data be deleted or amended, flag immediately and do not action without Kevin Tan's approval

---

## NCCP Act 2009 — Credit Licensing Obligations

The National Consumer Credit Protection Act 2009 governs all mortgage broking and credit-related activities.

### Key obligations relevant to agents:

1. **Responsible lending:** Agents must not modify client assessment data in ways that could misrepresent a client's financial position. Do not alter income, debt, or asset figures in the Client Assessment Form without explicit instruction.

2. **Record-keeping:** All client interactions and data changes must be traceable. Do not delete records — use DNC, INACTIVE, or LOST stages instead.

3. **Authority to Act:** Agents must not act on a client's behalf (e.g., submit applications, sign documents) without confirmed Authority to Act documentation in place. This is a human-managed step.

4. **Conflict of interest:** Agents must not recommend specific lenders, products, or pathways — this is the qualified broker's role.

---

## What Agents CAN Do

| Action | Allowed? | Notes |
|--------|----------|-------|
| Read lead/client records in Notion | Yes | Read only what is needed for the task |
| Update pipeline Status field | Yes | Follow lead-stages.md sequence only |
| Update Notes field with factual observations | Yes | No opinions on PI; no speculation |
| Update Discovery Booked / Discovery Date | Yes | As instructed by human operator |
| Create new records (DQ Form backup) | Yes | Via KISMET-DQFORM2NOTION workflow only |
| Link Assessment Form to pipeline record | Yes | Standard automation task |
| Log task sign-in/sign-out to mem0 | Yes | Use task metadata only — no PI in mem0 |
| Read PI fields to verify lead quality | Yes | Do not output PI to logs; internal use only |
| Advance pipeline stage per rules | Yes | Must meet stage criteria first |

---

## What Agents CANNOT Do

| Action | Prohibited | Reason |
|--------|-----------|--------|
| Log PI (name, phone, email, income) to mem0 | Prohibited | APP 8 — cross-border PI disclosure risk |
| Expose PI in terminal output or error logs | Prohibited | APP 11 — security of PI |
| Contact leads or clients directly | Prohibited | Agents are not authorised representatives |
| Delete client records | Prohibited | NCCP Act — record-keeping obligation |
| Modify Client Assessment Form financial data | Prohibited | Responsible lending integrity |
| Store TFN values anywhere | Prohibited | TFN is critical PI — store flag only (boolean) |
| Share PI with external services not listed here | Prohibited | APP 8 — requires individual consent |
| Provide SMSF-specific financial advice | Prohibited | AFSL / SIS Act — licensed adviser required |
| Provide credit product recommendations | Prohibited | ACL — licensed broker required |
| Override DNC status | Prohibited | Privacy Act — explicit opt-out must be honoured |

---

## Handling Sensitive Situations

### DNC (Do Not Contact) Records

If you encounter a record with Status = DNC:
1. Do NOT read contact details beyond confirming the DNC status
2. Do NOT include this record in any automation that would trigger outbound contact
3. Do NOT change the status without explicit instruction from Kevin Tan
4. Log any interaction with a DNC record to mem0 with note: "DNC record accessed — reason: [task name]"

### Data Breach or Suspected Breach

If you observe PI has been exposed (logged to a system, visible in output, accidentally included in an email):
1. Immediately stop the current task
2. Log the incident to mem0: "[Agent ID] DATA INCIDENT — [brief description] — [timestamp]"
3. Update the task card in Kanban with a blocker note
4. Escalate to Kevin Tan immediately via Notion task comment
5. Do NOT attempt to "fix" the breach yourself — this requires human assessment

Under the Privacy Act 1988 (Notifiable Data Breaches scheme), the firm may have a legal obligation to notify OAIC and affected individuals within 30 days if the breach is likely to cause serious harm.

### Client Requests to Delete Data

Under APP 13, individuals can request their data be corrected or, in some circumstances, deleted.

If a lead or client makes such a request:
1. Do NOT action it yourself
2. Note the request in the record's Notes field: "DATA REQUEST received [date] — action pending Kevin Tan approval"
3. Set status to INACTIVE pending resolution
4. Escalate to Kevin Tan

---

## Data Classification Summary

| Classification | Examples | Agent Rules |
|----------------|---------|-------------|
| Public | Firm name, suburb (general), service types | May use freely |
| Internal | Pipeline stages, workflow logic, DB schema | Use within workspace only |
| Personal Information | Name, phone, email, address | Read only what is needed; never log externally |
| Sensitive PI | Income, debts, super balance, DOB | Access with care; never log, expose, or transmit |
| Critical PI | TFN | Never store — flag only (boolean) |
| Commercially sensitive | ABN, SMSF fund details, entity structure | Treat as Sensitive PI |

---

## mem0 Safe Logging Templates

Use these templates to log task activity without including PI:

### Acceptable mem0 records:
```
Claude-Code-Sonnet-4-6 SIGN IN — Task: AI Knowledge Base - Phase 2 — 2026-02-27 07:30
Claude-Code-Sonnet-4-6 SIGN OUT — Task: Update DQ Form Pipeline — COMPLETE — 2026-02-27 08:15
Claude-Code-Sonnet-4-6 BLOCKED — Task: Calendar Sync — Blocker: GCal credential expired — 2026-02-27 09:00
Claude-Code-Sonnet-4-6 DATA INCIDENT — PI exposed in error log — 2026-02-27 10:05
```

### Unacceptable mem0 records (PI included):
```
WRONG: Processed lead John Smith (0412345678) — moved to PROSPECT
WRONG: Assessment form created for Smith family — income $120k/yr, debt $45k
WRONG: DNC applied to kevin@example.com per request
```

---

## Escalation Path for Compliance Issues

| Issue | Escalate To | Method |
|-------|-------------|--------|
| Data breach or suspected breach | Kevin Tan (immediate) | Notion task comment + mem0 log |
| DNC status conflict | Kevin Tan | Notion task comment |
| Client data deletion request | Kevin Tan | Notion Notes field + task comment |
| Unclear consent situation | Kevin Tan | Kanban blocker note |
| API sending PI to external service | Kevin Tan + Admin Kismet | Immediate stop + mem0 log |

---

*Back to [index.md](../index.md)*
