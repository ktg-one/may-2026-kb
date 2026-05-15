---
tags:
  - ref
  - infrastructure
  - n8n
created: 2026-03-31
updated: 2026-03-31
---

# n8n Workflows

Registry of all production and utility workflows. n8n runs at localhost:5678 (Docker).

## Kismet Finance Group (11 workflows)
| Workflow | Purpose | Status |
|----------|---------|--------|
| KISMET-DQ-Discovery-Calendar | Google Calendar sync with deduplication | Active |
| KISMET-CRM-Complete-Button | Pipeline stage advancement automation | Active |
| KISMET-CRM-Escalate-Button | Compliance-tracked escalation alerts | Active |
| KISMET-CRM-SyncToGoogle | Drive folder + Calendar sync | Active |
| KISMET-AskAI-LeadAnalysis | Lead intelligence generation | Active |
| KISMET-CLIENTASSESS | Client assessment automation | Active |
| KISMET-DQFORM2NOTION | DQ form ingestion to Notion (Fillout) | Active |
| KISMET-DocuSign-Onboarding | DocuSign integration | Active |
| KISMET-ObsidianAgent | Obsidian vault integration | Active |
| KISMET-Error-Log | Error handling & logging | Active |
| Notion-New-Lead-→-3CX-Contact | CRM contact sync | Active |

## Kevin / KTG (3 workflows)
| Workflow | Purpose | Status |
|----------|---------|--------|
| KEVIN-VoiceAssistant-GeminiLive | Voice AI assistant with Gemini | Active |
| KTG-Agents-Hub | Agent orchestration hub | Active |
| KTG-ObsidianToWordPress | Knowledge base publishing | Active |

## Testing & Utilities
| Workflow | Purpose |
|----------|---------|
| TEST-SIMPLE-WEBHOOK | Webhook testing |
| Error | Error handling reference |
| Chat workflow | Chatbot workflow |

## Backups
- JSON exports: `n8n-backups/` in projects root
- Docker deployment: `n8n-railway/docker-compose.yml`

## Key Patterns
- Notion REST API via httpRequest preferred over n8n Notion node (conditional field skipping)
- Notion button → n8n webhook trigger bridge pattern
- 7 inactive medium/low-priority workflows noted in old kanban (March 2026)
