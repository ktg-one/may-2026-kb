---
title: Good AI orchestrator — migration plan (2026-05-28)
type: query
tags: [decision, migration, platform, orchestrator, launch-blocker]
sources: [[wiki/operations/launch-checklist-july-2026]], [[wiki/queries/2026-05-28-framework-choice-nextjs]]
last_updated: 2026-05-28
status: planning
---

# Good AI orchestrator — migration plan

## Context

Kev has built a custom drag-and-drop GWS orchestrator on Google AI Studio. Currently:

- **Hosted on personal Google account** (`kevin.pl.tan@gmail.com`)
- 2 templates worth of work shipped
- Built up to: universal kanban, automated socials in progress
- Integrated: Gmail, Maps, Twilio, Workspace
- Output: React + Vite (AI Studio's only output format)

This tool IS Good AI's delivery platform for several of the 10 productised offerings:
- Voice Reception (Twilio + Workspace)
- Lead Capture (forms + email + kanban)
- Social Media Automation (in build)
- Client Onboarding (workspace + email + kanban)

**[NEEDS KEV]** Tool name not yet confirmed for ingest.

## The two migrations (separate concerns)

### Migration 1 — Personal Google account → Good AI Workspace tenant (URGENT)

**Blocks credible launch for due-diligence-sensitive clients** (Kismet's finance / professional-services pipeline, anyone touching regulated data). PRIS Act alignment and ISO 42001 posture both expect tenant separation. Do this **before** the soft-launch friends-and-family clients in the T-2 weeks block of [[wiki/operations/launch-checklist-july-2026]].

Steps:

1. Spin up Good AI Australia Workspace tenant (add a Good AI domain user, or new workspace if separation is needed)
2. Re-auth integrations (Gmail, Calendar, Drive, Maps) against the Good AI tenant
3. Re-issue Twilio API credentials under a Good AI billing account
4. Test orchestrator end-to-end against the new tenant before any paying client touches it
5. Migrate any data/state stored in the personal-account scope to the Good AI scope

### Migration 2 — Vite output → production deployment (LOW URGENCY)

**Vite is production-ready as-is.** AI Studio's Vite-only constraint is a dev-environment constraint, not a deployment constraint. The "we need to convert it" framing risks delaying launch unnecessarily.

Sequence:

1. Ask AI Studio to bundle / export the project. Take the export.
2. `git init` a new repo for it (separate from `knowledge2026`). Name TBD per [NEEDS KEV] above.
3. Deploy the Vite build directly to Cloudflare Pages or Vercel. ~30 minutes including DNS pointing under a Good AI subdomain (`app.goodai.au` or similar).
4. Re-wire integrations to the Good AI Workspace tenant (Migration 1 above).
5. **Only if** Vite has a specific limitation that bites in real use, convert frameworks. Default target: Next.js per [[wiki/queries/2026-05-28-framework-choice-nextjs]].

## Outstanding questions before next ingest

- **Tool name** and intended status (internal-only / prototype / shipped-to-a-client / sellable / sellable-to-strangers)
- **Does the AI Studio export include integration credentials embedded in code, or are they expected to be configured via environment variables at deploy time?** Affects how clean the migration is.
- **Migration 1 timing** — pre-launch (preferred) or post-launch (carries risk)?

## Action

- Defer the Vite → Next.js conversion until post-launch unless a specific limitation forces it earlier.
- Run Migration 1 (account move) as a launch-blocker.
- Capture the tool as a proper [[wiki/projects/]] page once the name and status are confirmed.

## Related

- [[wiki/queries/2026-05-28-framework-choice-nextjs]] — Next.js for launch, TanStack later
- [[wiki/queries/2026-05-28-notion-vs-gws-decision]] — stack decision context
- [[wiki/operations/launch-checklist-july-2026]] — launch sequence
- [[wiki/good-ai]] — company root; orchestrator delivers multiple products in the catalogue
