---
created: 2026-02-20
status: active
tags:
  - project
  - kismet
  - client
---

# Kismet Automation

## What
Automate Kismet Finance Group's lead-to-client pipeline using Fillout Forms, Notion, and Google Workspace. Create tutorial documentation.

## Stack
- **Fillout Forms** — primary automation engine (DQ Form + Client Assessment)
- **Notion** — CRM, pipeline management, task tracking
- **Google Workspace** — Calendar sync, Drive storage, Sheets backup
- **n8n** — backup/redundancy layer only

## Key Resources
- Tutorial: `D:/Kismet/Kismet-Workflow-Tutorial.md`
- Pipeline: CALLBACK → WARM LEAD → NRA → DISCOVERY → FA → SALE
- Client Assessment Form: `https://forms.fillout.com/t/tA8hBVT7ypus`

## Tasks
- [ ] Finish tutorial video series
- [ ] Set up button automations (Complete, Escalate, Sync to Google)
- [ ] Compliance dashboard
- [ ] DocuSign integration
- [x] KISMET-DQFORM2NOTION workflow fixed (dedup bug, hourly polling)
- [x] KISMET-DQ-Discovery-Calendar rebuilt (Notion→GCal sync)
- [x] KISMET-Error-Log workflow created

## Notes
- **Sync Logic:** Uses Notion Page ID (dashes stripped) as the Google Calendar Event ID to ensure one-way sync remains idempotent and prevents duplicates.
- **Polling:** Hourly polling decided for lead ingestion (daily 6 PM batch is the norm).
- **Agent Signature:** Use "Claude code" in Notion "Agent Confirmation" property for task sign-off.

