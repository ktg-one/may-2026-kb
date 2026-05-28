---
title: Source — KISMET-COMP-101 Compliance & Data Governance Training
type: source-summary
tags:
  - source
  - kismet
  - compliance
  - training
  - pris-act
  - apra
  - acl
  - data-governance
status: active
revenue_impact: high
client: "[[wiki/clients/kismet-finance|Kismet Finance Group]]"
date: 2026-03-07
audience: "All Kismet consultants, admin staff, and leadership"
sources:
  - sources/clients/kismet-finance/03072026-kismet-comp-101-training.docx
last_updated: 2026-05-25
---

# Source — KISMET-COMP-101

> [!info] Kismet Business OS — Compliance & Data Governance Training
> **Module code:** KISMET-COMP-101 · **Version:** 1.0 (Grant Compliant) · **Audience:** all consultants, admin, leadership.

**Original:** `sources/clients/kismet-finance/03072026-kismet-comp-101-training.docx`
**Date:** 2026-03-07 · **Type:** Training module, .docx, 3 MB

## The "Why"

> [!danger] The risks (per instance)
> - **$75,000 fine** for mishandling client PII
> - **Loss of ACL** (Australian Credit License) if no audit trail of advice can be produced

The Kismet Business OS is framed as a **"Regulatory Fortress"** that automatically handles compliance — *if* the Golden Rules are followed.

## Golden Rules

### Rule 1 — Contemporaneous Record

> [!warning]
> Every client interaction that could be construed as **"advice" or "instruction"** MUST have a contemporaneous record.

**System enforcement:**
- Mark appointment "Sat" in Notion → hidden **2-minute timer** starts
- System looks for Voice Note or Text Summary attached within **60 minutes**
- No data within 24 hours → **Household record locked** from further progression (cannot send DocuSign) until **Shane** unlocks

### Rule 2 — Single Customer View

> [!warning]
> Regulators can require a **Single Customer View** on demand. Notion is the **only** place client data lives.

**Forbidden:**
- ❌ Saving client phone numbers in personal iPhone contacts
- ❌ Side spreadsheets of leads
- ❌ Emailing docs from personal Gmail

### Rule 3 — Data Sovereignty

> [!warning]
> Australian client data should stay in Australia.

- Google Workspace + Notion instances configured for Australian data regions
- **Never** upload client data (Passports, IDs, Tax Returns) to unauthorized AI tools (free ChatGPT, random PDF converters)
- Only sanctioned AI tools

### Incident response

If you accidentally email the wrong client, lose a device logged into Notion, or suspect a phishing attempt → **IMMEDIATELY** report. (Acknowledgement signature line at end of training.)

## Why this matters for Good AI

> [!success] This is the operational counterpart to the Phase 3 architecture
> KISMET-COMP-101 is what happens **inside the people** when the architecture in `[[wiki/sources/kismet-phase3-stack-integration]]` is deployed. The tech enforces what the training documents — together they make the "Regulatory Fortress" claim real.

## Connections

- `[[wiki/sources/kismet-phase3-stack-integration]]` — the technical enforcement layer
- `[[wiki/clients/kismet-finance]]`
- `[[wiki/frameworks/business-process-discovery]]` — compliance is one of the scoring dimensions
- `workflows/delegation-rules.md` — analogous "non-negotiable rules" pattern

## Regulatory references in document

- **PRIS Act 2024** (WA)
- **SEC Rule 17a-4** (cited as analogue for "Banking-Grade" record-keeping)
- **ACL** (Australian Credit License)

## Review items

- Confirm "Shane" is the named unlock authority in current operations
- Is the 2-minute / 60-minute / 24-hour cadence reflected in the actual n8n workflows? Verify against `[[wiki/projects/n8n-workflows]]`
