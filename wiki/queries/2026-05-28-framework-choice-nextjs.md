---
title: Framework choice for the Good AI orchestrator — Next.js (2026-05-28)
type: query
tags: [decision, frontend, framework, nextjs, tanstack]
sources: [[wiki/queries/2026-05-28-orchestrator-migration-plan]]
last_updated: 2026-05-28
status: decided (for launch)
---

# Framework choice for the Good AI orchestrator — Next.js

## Decision

**Next.js for the July 2026 launch.** Revisit TanStack Start at the 6-month review post-launch.

## Context

The custom Good AI orchestrator (drag-and-drop GWS / Gmail / Calendar / Maps / Twilio platform) is built in Google AI Studio's React + Vite output. Question on the table: convert to Next.js or TanStack Start for production.

## Reasoning

**Next.js wins for the launch because:**

- **Five weeks to launch.** Boring, well-understood tech minimises debug cycles.
- **AI assistance reliability.** Claude / GPT / Cursor know Next.js orders of magnitude better than TanStack Start. TanStack's training corpus is small — AI agents hallucinate APIs that don't exist. For a sole founder building with AI help, that delta is real cost.
- **Drop-in AI integrations.** Vercel AI SDK, embeddable chat widgets, OAuth boilerplates, n8n connectors, Trillet's likely integrations all assume Next.js first.
- **Familiar from GoodAIVoice.** Existing GoodAIVoice project is already Next.js — cross-project muscle memory.
- **Hosting flexibility.** Deploys to Vercel (5 min) or Cloudflare Pages (5 min). No vendor lock unless you use App Router + Server Actions in their Vercel-tuned form — mitigation: stay on traditional API routes if portability matters.

**TanStack Start is real, just not now:**

- Better type-safe routing and data flows
- No vendor lock — Nitro deploys anywhere
- Lighter framework opinions
- But: 1.x with breaking changes, smaller community, AI tooling lags

## Action

- Convert AI Studio Vite export → Next.js 15 + TypeScript + Tailwind. ~1–2 days with AI assistance.
- Stay on boring patterns (Pages Router or App Router without heavy Server Actions) if Vercel portability matters.
- Deploy to Cloudflare Pages or Vercel — your call; both work.
- Use Vercel AI SDK for any chat/streaming components (Anthropic + OpenAI + Gemini providers included).

## Revisit if

- Vercel pricing or framework opinions start biting (move to Cloudflare or migrate framework)
- Next.js routing / type-safety pain repeats (consider TanStack)
- TanStack Start hits stable 2.x and you have a refactor window

## Related

- [[wiki/queries/2026-05-28-orchestrator-migration-plan]] — the two-migration sequence this is part of
- [[wiki/queries/2026-05-28-notion-vs-gws-decision]] — stack decision context
- [[feedback-stay-fluid-policy]]
