---
tags:
  - area
  - client
  - kismet
created: 2026-03-31
updated: 2026-03-31
---

# Kismet Finance Group

## Overview
Perth-based finance firm. Full CRM automation stack built on Notion + n8n + Google Workspace.

## Infrastructure
| System | Detail |
|--------|--------|
| CRM | Notion database |
| Notion DB ID | `726bf4c7-4ce9-49f1-9b84-adaffa3769e3` |
| Automation | n8n (localhost:5678, Docker) |
| Calendar | Google Calendar sync |
| Docs | Google Drive auto-folders |
| Forms | Fillout → Notion DQ intake |

## n8n Workflows (11 production)
| Workflow | Purpose |
|----------|---------|
| KISMET-DQ-Discovery-Calendar | Google Calendar sync with dedup |
| KISMET-CRM-Complete-Button | Pipeline stage advancement |
| KISMET-CRM-Escalate-Button | Compliance-tracked escalation alerts |
| KISMET-CRM-SyncToGoogle | Drive folder + Calendar sync |
| KISMET-AskAI-LeadAnalysis | Lead intelligence generation |
| KISMET-CLIENTASSESS | Client assessment automation |
| KISMET-DQFORM2NOTION | DQ form ingestion to Notion |
| KISMET-DocuSign-Onboarding | DocuSign integration |
| KISMET-ObsidianAgent | Obsidian vault integration |
| KISMET-Error-Log | Error handling & logging |
| Notion-New-Lead-→-3CX-Contact | CRM contact sync |

## Key Patterns
- Notion REST API via httpRequest (not n8n Notion node) to conditionally skip empty fields
- Bridge from Notion button → n8n webhook triggers
- KISMET-CRM-Escalate-Button added Notion DB properties: Escalated, Escalated At, Escalation Note

## Open Items
- Fix Update node credential in n8n UI, then set up Notion button (from mem0, March 2026)
- KISMET-DQ-Discovery-Calendar sync completed (from mem0)
