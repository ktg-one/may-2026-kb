---
title: Notion vs Google Workspace — stack decision (2026-05-28)
type: query
tags: [decision, stack, notion, gws, lock-in]
sources: [[purpose]], [[feedback-stay-fluid-policy]]
last_updated: 2026-05-28
status: decided
---

# Notion vs Google Workspace — stack decision

## Decision

**Skip Notion as a canonical layer.** Use Google Workspace + AppSheet + n8n + the LLM Wiki vault as the operational stack. Notion gets used only as a publishing surface for the occasional client-facing one-pager that needs to be shared without giving the recipient a Google account.

## Context

Notion offered 1 free month + 3 startup-credit months (~4 months free). Kev holds an Advanced Notion certification — knows the platform deeply.

## Reasoning

- **"Forever in Notion" lock-in.** Kev's own framing — once databases, relations, automations and views are built in Notion, migration cost grows non-linearly. Notion's data model doesn't export cleanly to anything else.
- **GWS already does ~90% of what Notion would be selling.** Google Sheets for databases, Forms for intake, Docs for client-facing pages, Drive for storage, Calendar for scheduling. All data-portable (CSV, doc export).
- **AppSheet provides the UI gloss** that Notion gets praised for, on top of the same Sheets data. Kev has already shipped one AppSheet build (Kismet engagement) — muscle memory exists, no new tool to learn.
- **n8n is already the glue.** Same delivery muscle that's running the Kismet ops OS extends to Good AI's productised offerings.
- **The custom Good AI orchestrator** built on Google AI Studio (drag-and-drop wireframes over Gmail / Calendar / Maps / Twilio / Workspace) is already the operational UI layer Kev would otherwise have built in Notion. He built the Notion-killer for himself.
- **Stay-fluid policy applies.** Notion is the opposite of fluid — closed, proprietary, hard to leave. See [[feedback-stay-fluid-policy]].

## Action

- **Claim the free credits.** Costs nothing to claim; parks runway in your account for a specific client who demands Notion or a one-off publishing use case.
- **Do not move canonical state into Notion.** Knowledge layer stays in the markdown vault. Operational state stays in GWS / AppSheet / the custom orchestrator.
- **Architecture stays as documented in the SEA plan + ops cluster** — no Notion column needed.

## Related

- [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]] — SEA plan
- [[feedback-stay-fluid-policy]] — operating principle this decision implements
