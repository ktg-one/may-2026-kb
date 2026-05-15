# Integrations — n8n Workflows

**Document:** integrations/n8n-workflows.md
**KB Version:** 2.0
**Last Updated:** 2026-02-27
**Source:** Rebuild context packets (Packets/02232026-COP-R7, Packets/02202026-COP-R6), mcp.json, STRUCTURED_AGENTS_KB.md

---

## Overview

Kismet Finance Group uses n8n as a secondary automation engine. The primary automation engine is **Fillout Forms** (direct push to Notion). n8n handles backup/redundancy automation, Google Calendar sync, error logging, and future complex multi-step workflows.

**n8n Instance:** `http://localhost:5678` (local) / `https://ai-yah-old.taile6f11d.ts.net` (remote, Tailscale)
**MCP Config:** `C:/Users/kevin/projects/fastmcp-sse-server/mcp.json` (server key: `n8n`)
**Timezone:** All workflows use AWST (UTC+8)

---

## Architecture Principle

```
Primary:  Fillout Forms → Notion (direct push, no middleware)
Backup:   n8n → Notion (webhook, hourly polling, or trigger-based)
Utility:  n8n → Google Calendar, Google Sheets, Error Log
```

**Decision rationale:** Fillout Forms is simpler and more reliable for the lead intake flow. n8n is demoted to backup and handles orchestration that Fillout cannot do (calendar sync, error aggregation, complex logic).

---

## Active Workflows

### 1. KISMET-DQFORM2NOTION

| Field | Value |
|-------|-------|
| **Workflow ID** | (see n8n instance — latest version v439) |
| **Status** | Active |
| **Purpose** | Backup ingestion: DQ Form submissions from Fillout → Notion MASTER DATABASE 2025 |
| **Trigger** | Hourly polling (webhook + schedule) |
| **Decision** | Hourly polling chosen over 5-minute intervals — leads typically added once daily around 18:00 AWST |

**Key nodes:**
1. Schedule Trigger (hourly) + Webhook (manual trigger)
2. Fillout API — fetch new DQ Form submissions
3. Deduplication check — match by phone/name against existing Notion records
4. Notion — create record in DQ Form Responses database (if not duplicate)
5. Notion — link to MASTER DATABASE 2025

**Notes:**
- Deduplication was a key fix in v439 — earlier versions created duplicate records
- Fillout Forms is the primary path; this workflow is the fallback only
- Do NOT modify deduplication logic without testing against existing records

---

### 2. KISMET-CLIENTASSESS

| Field | Value |
|-------|-------|
| **Workflow ID** | (see n8n instance) |
| **Status** | Active |
| **Purpose** | Auto-generate Client Assessment Form record when lead advances to PROSPECT with Discovery Booked date set |
| **Trigger** | Notion trigger — when `Status = PROSPECT` AND `Discovery Booked` date is set |

**Key nodes:**
1. Notion Trigger — watch MASTER DATABASE 2025 for status changes
2. IF node — filter: Status = PROSPECT AND Discovery Booked is not empty
3. Notion — create new Client Assessment Form record
4. Notion — link Assessment Form back to MASTER DATABASE 2025 record (relation)

**Notes:**
- The IF node uses n8n v2.2 syntax — unary operators (isNotEmpty) require `singleValue: true`
- This workflow feeds the consultant's post-discovery assessment process

---

### 3. KISMET-DQ-Discovery-Calendar

| Field | Value |
|-------|-------|
| **Workflow ID** | `ijUnMtkgZHMpdH3h` |
| **Status** | Active (complete as of v27) |
| **Purpose** | Sync Discovery meeting bookings from Notion to Google Calendar |
| **Trigger** | Dual-path: real-time (Notion Trigger) + nightly full sync (Schedule 8pm AWST + Webhook) |

**Architecture — dual-path design:**

```
Path A (Real-time):
  Notion Trigger → IF (Discovery Booked set?) → Google Calendar upsert

Path B (Full Sync - nightly):
  Schedule (8pm AWST) + Webhook (manual)
    → Read Notion (all PROSPECT records)
    → Code node (filter: has Discovery Booked, no calendar event yet)
    → Google Calendar upsert
```

**Key nodes:**
1. Notion Trigger — watch for `Discovery Booked` date changes
2. IF node — `Discovery Booked` is not empty
3. Schedule Trigger — daily at 20:00 AWST
4. Webhook — manual trigger for admin sync on demand
5. Read Notion — pull all PROSPECT records with Discovery Booked set
6. Code node — filter records without existing calendar events
7. Google Calendar — upsert event (create or update)

**Calendar event upsert key:** NotionPageID (dashes stripped) = Google Calendar Event ID. This prevents duplicate events.

**Google Calendar target:** `c_d37ee4a14c458c1f24782d46ea45b35bb4b176cc599216918c5adef0d73eb3c1@group.calendar.google.com`

**Google Calendar credential:** `3eEGNiAFZao0PZiW` ("Google Calendar account 2") — requires periodic re-authentication (OAuth token expiry).

**Notes:**
- Bi-directional sync (GCal → Notion) is blocked — Notion webhooks do not support inbound from GCal
- Last verified working: execution #347
- Use `n8n_update_full_workflow` (not partial) when modifying this workflow via MCP — partial update causes errors

---

### 4. KISMET-Error-Log

| Field | Value |
|-------|-------|
| **Workflow ID** | `vOPU7utOtErr4A3D` |
| **Status** | Created, needs configuration |
| **Purpose** | Centralized error logging for all Kismet n8n workflows |
| **Trigger** | Error Trigger (fires when any workflow errors) |

**Key nodes:**
1. Error Trigger — catches errors from all other Kismet workflows
2. Format Code node — structures error data (workflow name, node, error message, timestamp)
3. Google Sheets — append row to error log sheet

**Configuration required:**
- `SheetID` in the Google Sheets node must be replaced with actual sheet ID (currently `REPLACE_WITH_SHEET_ID`)
- Google Sheets credential: `MAINDB-NEW-ROW` (credential ID: `R8G2MdpHgXKcZvWk`)
- Each other Kismet workflow must have `Settings > Error Workflow` set to this workflow's ID

**Notes:**
- Designed as a shared error handler — all Kismet workflows route errors here
- Do not disable or modify without updating error workflow settings in all other workflows

---

### 5. KTG Agents Hub

| Field | Value |
|-------|-------|
| **Workflow ID** | (see n8n instance) |
| **Status** | Active |
| **Purpose** | Central dispatch hub for AI agent tasks; routes agent instructions to appropriate systems |
| **Trigger** | Webhook (inbound from agent or manual trigger) |

**Key nodes:**
1. Webhook — receive task instructions from Claude Code or other agents
2. Router/Switch — dispatch by task type (Notion, Google, etc.)
3. Notion API — execute Notion operations
4. Response — return result to caller

**Notes:**
- Entry point URL: `https://ktg.one` (agent hub)
- Used by Claude Code and other CLI agents for programmatic n8n interactions

---

### 6. KEVIN-VoiceAssistant-GeminiLive

| Field | Value |
|-------|-------|
| **Workflow ID** | (see n8n instance) |
| **Status** | Active / Experimental |
| **Purpose** | Voice assistant integration using Gemini Live for real-time voice interaction |
| **Trigger** | Webhook (audio input stream or text) |

**Key nodes:**
1. Webhook — receive voice/text input
2. Gemini Live API — process voice or text
3. Response formatter — structure output
4. Return response to caller

**Notes:**
- Experimental workflow; not part of core Kismet CRM pipeline
- Phase 3 may expand voice capabilities via Vertex AI transcription

---

### 7. KISMET-CRM-Complete-Button

| Field | Value |
|-------|-------|
| **Workflow ID** | `ppAJbKrJDWRclYFa` |
| **Status** | New (recently created) |
| **Purpose** | Powers the "Complete" button automation in Notion — marks task done and advances pipeline stage |
| **Trigger** | Notion button automation trigger (webhook from Notion "Complete" button) |

**Key nodes:**
1. Webhook — receive trigger from Notion button click
2. Notion — read current record status
3. Logic node — determine next pipeline stage
4. Notion — update Status to next stage
5. Notion — mark task/action as complete

**Notes:**
- This is the implementation of the "Complete" button described in `business-context/crm-schema.md`
- Tied to OPERATIONS 2026 button automations — do NOT modify the Notion button without updating this workflow

---

## Archived / Inactive Workflows

These workflows exist in the n8n instance but are not active in the current production flow:

| Workflow Name | Status | Reason Archived |
|--------------|--------|-----------------|
| KISMET-WelcomeEmail | Inactive (planned Phase 3) | Requires DocuSign integration to be complete first |
| KISMET-DriveFolder | Inactive (planned Phase 3) | Google Drive connector setup pending |
| KISMET-GhostDetector | Inactive (planned Phase 3) | Requires Notion webhook support for appointment tracking |
| KISMET-EscalationEngine | Inactive (planned Phase 3) | Manager notification system, not yet configured |
| KISMET-DocuSign | Inactive (planned Phase 3) | DocuSign template setup pending |

---

## Workflow Development Rules

1. **Use `n8n_update_full_workflow`** — never use partial update via MCP (causes `additional properties` errors)
2. **IF node v2.2 syntax** — unary operators (isNotEmpty, isEmpty) require `singleValue: true`
3. **Calendar upsert** — always use Notion Page ID (dashes stripped) as Calendar Event ID to prevent duplicates
4. **Error routing** — all new Kismet workflows must have `Settings > Error Workflow = KISMET-Error-Log`
5. **Timezone** — all triggers and scheduled nodes must use AWST (UTC+8)
6. **Credential re-auth** — Google Calendar OAuth tokens expire; re-auth if calendar sync fails

---

## Common Troubleshooting

| Symptom | Likely Cause | Fix |
|---------|-------------|-----|
| Calendar events duplicated | Event ID not set from Notion Page ID | Check upsert key in KISMET-DQ-Discovery-Calendar |
| DQ Form records doubled | Dedup logic bypassed | Review KISMET-DQFORM2NOTION dedup node |
| IF node not filtering correctly | singleValue:true missing | Add `singleValue: true` to unary operator |
| Error workflow not firing | Workflow not linked | Set `Settings > Error Workflow` in each workflow |
| Calendar sync not working | OAuth token expired | Re-authenticate Google Calendar credential `3eEGNiAFZao0PZiW` |
| n8n unreachable | Tailscale disconnected | Check Tailscale status; fallback to localhost:5678 |

---

*Back to [index.md](../index.md)*
