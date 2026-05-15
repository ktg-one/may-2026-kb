---
tags: [automation, n8n, infrastructure, delivery]
status: active
revenue_impact: high
last_updated: 2026-05-06
---

# n8n Workflows

Core delivery infrastructure. Every client automation build runs through n8n.

## Hosting

- Self-hosted: localhost:5678 (Docker)
- Cloud: Railway deployment (config in `n8n-railway/`)
- 18 workflow JSONs backed up in `n8n-backups/`

## Kismet Workflows (11)

DQ-Discovery-Calendar, CRM-Complete-Button, CRM-Escalate-Button, CRM-SyncToGoogle, AskAI-LeadAnalysis, CLIENTASSESS, DQFORM2NOTION, DocuSign-Onboarding, ObsidianAgent, Error-Log, Notion-New-Lead-to-3CX-Contact

## KTG Workflows (3)

VoiceAssistant-GeminiLive, Agents-Hub, ObsidianToWordPress

## Testing (2)

TEST-SIMPLE-WEBHOOK, Error

## Revenue

- Production system for all client delivery
- Every automation engagement depends on this stack
- Backbone of the service offering

## Links

- [[clients/kismet-finance/kismet-finance]]
- [[good-ai]]
- [[REVENUE-MAP]]
