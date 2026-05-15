# Data Definitions — Lead Pipeline Stages

**Document:** data-definitions/lead-stages.md
**KB Version:** 1.0
**Last Updated:** 2026-02-27
**Source:** Kismet Workflow - Lesson 1, STRUCTURED_AGENTS_KB.md, PHASE 1 Foundation

---

## Purpose

This document defines every stage in the Kismet Finance Group lead pipeline, what each stage means, what triggers entry and exit, and what actions are required at each stage. This is the authoritative reference for any agent or automation that reads or writes the `Status` field in the MASTER DATABASE 2025.

---

## Pipeline Stage Overview

```
LEAD
  ↓ (DQ Form verified — homeowner / investor / SMSF $100k+)
QUALIFIED LEAD
  ↓ (Feedback call completed, discovery meeting booked)
PROSPECT
  ↓ (Discovery meeting held, consultant assessment completed, pathway assigned)
ONBOARDING
  ↓ (Welcome email sent, authority docs signed, drive folder created)
CLIENT
```

**Special stages (non-linear):**

| Stage | Meaning |
|-------|---------|
| FAKE NUMBER | Lead's phone number was invalid or non-existent |
| NOT INTERESTED | Lead declined interest — no follow-up |
| DNC | Do Not Contact — explicit opt-out |
| INACTIVE | Was active, now paused or stalled — may be re-engaged |
| LOST | Opportunity lost to competitor or withdrawal |

---

## Stage Definitions (Detailed)

### LEAD

**What it means:** A raw submission from the field. The lead has submitted a DQ Form (or was manually entered) but has not yet been verified.

**Entry trigger:**
- DQ Form submitted via Fillout by a field rep
- Or: manual entry by admin after phone contact

**Exit triggers:**
- Verified as genuine → advance to QUALIFIED LEAD
- Phone invalid → move to FAKE NUMBER
- Declined → move to NOT INTERESTED

**Required actions at this stage:**
1. Record appears in DQ Form Responses database
2. Admin opens the CHECK view in Operations 2026
3. Verify: phone number is valid and working
4. Verify: all required DQ fields are filled (name, address, phone, homeowner/investor status)
5. Verify: lead is within an active territory (suburb is assigned to a rep)
6. Assign a Lead Owner (the field rep who submitted, or their supervisor)

**Data fields that must be populated:**
- Name (not blank)
- Phone (valid Australian mobile or landline)
- Address (suburb at minimum)
- Homeowner OR Investor OR Super Balance (at least one qualifier present)
- Lead Owner (assigned rep)

**Common issues:**
- Fake or typed-wrong phone numbers (use FAKE NUMBER stage)
- Duplicate submissions (check for existing record by phone/name before creating)
- Missing address (flag in notes, attempt to obtain via callback)

---

### QUALIFIED LEAD

**What it means:** The lead has been verified by admin as a genuine prospect with at least one qualifying criterion (homeowner, investor with property, or SMSF super balance $100k+).

**Entry trigger:**
- Admin completes CHECK view review
- At least one qualifier is confirmed:
  - Homeowner: confirmed owner of a property
  - Investor: confirmed holder of one or more investment properties
  - SMSF prospect: confirmed super balance $100k or more

**Exit triggers:**
- Feedback call completed and discovery meeting booked → advance to PROSPECT
- Lead unresponsive after follow-up attempts → move to INACTIVE
- Lead opts out → move to NOT INTERESTED or DNC

**Required actions at this stage:**
1. Lead appears in FEEDBACK CALL view
2. Rep contacts lead to build rapport and confirm interest
3. Book a Discovery meeting (in-person or video call)
4. Set `Discovery Booked` date field to confirmed meeting date/time
5. Sync to Google Calendar (automated or via "Sync to Google" button)

**Data fields that must be populated:**
- Status = QUALIFIED LEAD
- Discovery Booked (date/time) — set when booking is confirmed
- Notes (summary of feedback call — what was discussed, lead's stated interest)

**Qualification criteria summary:**

| Qualifier | Minimum Threshold |
|-----------|------------------|
| Homeowner | Owns primary place of residence |
| Investor | Owns at least one investment property |
| SMSF Prospect | Estimated super balance $100,000 AUD or more |

---

### PROSPECT

**What it means:** The lead has had a Discovery meeting or call. The consultant has assessed their needs and confirmed genuine financial planning, mortgage, or SMSF opportunity exists. The pathway (Housing or SMSF) has been assigned.

**Entry trigger:**
- Status set to PROSPECT AND `Discovery Booked` date is populated
- System automatically generates Client Assessment Form and notifies consultant

**Exit triggers:**
- Consultant completes assessment, assigns pathway → advance to ONBOARDING
- Opportunity does not proceed → move to LOST or INACTIVE

**Required actions at this stage:**
1. Consultant reviews pre-call notes from DQ Form and lead record
2. Conducts Discovery meeting (deep needs assessment)
3. Completes Client Assessment Form (post-meeting):
   - Income details (both applicants if applicable)
   - Existing debts and liabilities
   - Super balances
   - Property goals
   - Risk profile
4. Assigns pathway: Housing (mortgage) or SMSF or Both
5. Updates Notes field with discovery summary
6. Reviews SMSF or mortgage options appropriate for client situation
7. Advances status to ONBOARDING when ready to proceed

**Data fields that must be populated:**
- Status = PROSPECT
- Discovery Date (actual date of meeting, not just booked date)
- Pathway (Housing / SMSF / Both)
- Client Assessment Form (relation linked)
- Notes (discovery summary — key facts, goals, concerns)
- Consultant (person who conducted discovery)

**Pathway assignment logic:**

| Client Situation | Pathway |
|-----------------|---------|
| Wants to buy/refinance home | Housing |
| Has SMSF, wants to use it for property | SMSF |
| Has both property goal and SMSF | Both |
| Investor seeking growth via property | Housing (investor loan) |

---

### ONBOARDING

**What it means:** The client has confirmed they want to proceed. The firm is preparing authority documents and establishing the formal advisory relationship. This is a conversion stage — the prospect is becoming a client.

**Entry trigger:**
- Consultant marks status as ONBOARDING after completing the assessment and confirming client intent to proceed

**Exit triggers:**
- All onboarding documents signed, file opened → advance to CLIENT
- Client withdraws → move to LOST

**Required actions at this stage:**
1. System sends welcome email (automated via n8n)
   - Welcome message
   - Pathway summary (SMSF or Property or Both)
   - Next steps and expected timeline
   - Required documents checklist
   - Case manager contact details
2. Google Drive client folder created (automated)
3. "Authority to Act" document prepared (DocuSign — planned Phase 3)
4. "Engagement Agreement" prepared (DocuSign — planned Phase 3)
5. Documents sent to client for signature
6. Signed PDFs auto-saved to Drive (planned Phase 3)
7. Confirm receipt of signed documents before advancing to CLIENT

**Data fields that must be populated:**
- Status = ONBOARDING
- Drive Folder URL (link to Google Drive folder)
- Notes (what was sent, what is pending)

---

### CLIENT

**What it means:** The client has signed all authority documents and is now an active client of the firm. A formal file has been opened and work has commenced on their mortgage, SMSF, or financial plan.

**Entry trigger:**
- All onboarding documents signed
- Admin or consultant advances status to CLIENT

**Actions at this stage:**
1. Active file is maintained in Notion and Google Drive
2. Client record is linked to Household and Entity records in the CRM
3. Ongoing communication tracked in Notion Notes
4. Progress on mortgage application, SMSF setup, or financial plan tracked
5. Annual review reminders set (future automation)

**Data fields that must be populated:**
- Status = CLIENT
- Household (relation linked)
- Entity (relation linked, if applicable — e.g., SMSF fund name)
- Drive Folder URL

---

## Special/Terminal Stages

### FAKE NUMBER

**Meaning:** Lead's phone number is invalid, disconnected, or was entered incorrectly on the DQ form.

**Actions:**
- Mark as FAKE NUMBER in CHECK view
- Add note with what was attempted (e.g., "Tried 3 times — number not connected")
- Do not delete the record — keep for audit trail
- Field rep may need to return to the address if the lead was genuinely interested

---

### NOT INTERESTED

**Meaning:** Lead explicitly stated they are not interested in the firm's services at this time.

**Actions:**
- Mark as NOT INTERESTED
- Note the reason (if given)
- Respect the opt-out — do not follow up for at least 12 months unless lead re-contacts the firm

---

### DNC (Do Not Contact)

**Meaning:** Lead has explicitly requested to be removed from all contact. This is a compliance-sensitive status.

**Actions:**
- Mark as DNC immediately upon receiving the request
- Note the date and how the request was received
- Ensure no automated follow-ups fire for this record
- Do NOT contact this person again under any circumstances

---

### INACTIVE

**Meaning:** Lead was progressing but has stalled — not responding to follow-up, or timing is not right for them currently.

**Actions:**
- Note the date set to INACTIVE and the reason
- Set a follow-up reminder (minimum 3 months out)
- Candidate for re-engagement campaign in future

---

### LOST

**Meaning:** Opportunity confirmed not proceeding — client chose a competitor, withdrew, or cannot qualify.

**Actions:**
- Note the reason for loss (competitor, qualification failure, timing, personal circumstances)
- Do not delete the record — valuable for analytics
- Consider whether re-engagement is appropriate in 6-12 months

---

## Pipeline Flow Summary Table

| Stage | Qualifier | Next Stage | Trigger |
|-------|-----------|-----------|---------|
| LEAD | DQ form submitted | QUALIFIED LEAD | Admin verifies in CHECK view |
| QUALIFIED LEAD | Homeowner / Investor / SMSF $100k+ | PROSPECT | Feedback call + Discovery booked |
| PROSPECT | Discovery held + Assessment done | ONBOARDING | Consultant completes Client Assessment Form |
| ONBOARDING | Client confirmed intent | CLIENT | All docs signed |
| CLIENT | Active file | (ongoing) | Annual reviews, ongoing servicing |
| LEAD | Invalid phone | FAKE NUMBER | CHECK view review |
| Any | Opt-out | NOT INTERESTED / DNC | Lead request |
| Any | Stalled | INACTIVE | No response after multiple attempts |
| PROSPECT/ONBOARDING | Withdrew | LOST | Client withdrawal |

---

## Notion Views by Stage

| Notion View | Stages Shown | Who Uses It |
|-------------|-------------|-------------|
| CHECK | LEAD (new, unverified) | Admin Kismet |
| FEEDBACK CALL | QUALIFIED LEAD | Rep / Consultant |
| DISCOVERY | PROSPECT | Consultant |
| Active Pipeline | All active stages | Team |
| Investor | QUALIFIED LEAD + PROSPECT (investor pathway) | Consultant |
| Missing Notes | Any stage with empty Notes field | Admin (compliance) |
| Ghost Detector (planned) | PROSPECT with no post-meeting notes | Admin / Manager |

---

## Automation Triggers by Stage Transition

| Transition | Automation | System |
|-----------|-----------|--------|
| LEAD → QUALIFIED | None (manual admin action) | Manual |
| QUALIFIED → PROSPECT (when Discovery Booked set) | Generate Client Assessment Form; sync to Google Calendar | n8n |
| PROSPECT → ONBOARDING | — | Manual (consultant) |
| ONBOARDING triggered | Send welcome email; create Drive folder; prepare DocuSign packet | n8n (planned) |
| ONBOARDING → CLIENT | Trigger formal onboarding confirmation | n8n (planned) |
| Any stage, Ghost Detector | Alert rep + manager if no notes after appointment | n8n (planned Phase 3) |
| Any stage, 24hr no action | Manager escalation email | n8n (planned Phase 3) |

---

*Back to [index.md](../index.md)*
