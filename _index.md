---
title: knowledge2026
type: schema
last_updated: 2026-05-06
---

# knowledge2026

> Revenue-focused vault for Good AI Australia. Optimized for AI agent consumption.
> Structure follows Karpathy's LLM Wiki pattern: sources/ (immutable inputs) → wiki/ (compiled knowledge) → this index (navigation).

## Decision Tree

**What can I sell?** → [[wiki/REVENUE-MAP]] (4 revenue streams, 10 products, 3 tiers, pricing, margins)
**Who can I sell to?** → [[wiki/PIPELINE]] (198 Kismet leads, active deals, outreach targets, investor pipeline)
**What's the company?** → [[wiki/good-ai]] (market position, infrastructure, products, team)
**What's ready to deliver?** → [[wiki/projects/n8n-workflows]] (11 Kismet + 3 KTG production workflows)

## Three-Layer Architecture

### sources/ — Raw Immutable Inputs
LLMs read but NEVER modify. Feeds monetizable outputs only.

- `sources/pitches/` — Funding pitch, market analysis, feasibility report
- `sources/clients/kismet-finance/` — Raw Kismet docs, phases, invoices, contracts
- `sources/clients/weitj-investments/` — Weitj strategic analysis
- `sources/clients/manaa/` — Manaa AI audit
- `sources/research/` — Australia AI Talent Gap (feeds pitch), voice agent personas (sellable specs)

### wiki/ — Compiled Knowledge (Revenue-Focused)
LLM-generated, cross-referenced, queryable. Every article traces a revenue path.

**Core:**
- [[wiki/REVENUE-MAP]] — All revenue streams, status, blockers, projections
- [[wiki/PIPELINE]] — Active deals, prospects, investor pipeline, grants
- [[wiki/good-ai]] — Company profile, market sizing, products, infrastructure

**Clients:**
- [[wiki/clients/kismet-finance]] — PRIMARY channel partner (HIGH revenue impact)
- [[wiki/clients/leemonarc]] — Brand kit project (LOW, active)
- [[wiki/clients/weitj-investments]] — Pitch opportunity (MEDIUM, paused)
- [[wiki/clients/sun-island-bali]] — Completed assessment (LOW)
- [[wiki/clients/manaa]] — Completed audit (LOW, case study value)

**Projects (billable/sellable):**
- [[wiki/projects/n8n-workflows]] — Delivery backbone, 18 workflows (HIGH)
- [[wiki/projects/goodai-voice]] — Voice assistant product + sales demo (HIGH)
- [[wiki/projects/gws-cli]] — Google Workspace CLI v0.22.3 (MEDIUM, needs GTM)
- [[wiki/projects/legio-framework]] — Prompt engineering framework (MEDIUM, needs productization decision)
- [[wiki/projects/ktg-one]] — Portfolio site ktg.one (MEDIUM)
- [[wiki/projects/fastmcp-server]] — MCP server infra (LOW)
- [[wiki/projects/ap-tech]] — Client site (LOW)

**Navigation:**
- [[wiki/_map]] — Full Map of Content
- [[wiki/_projects-index]] — All project folders with status and tech stack

### Operational (not wiki — procedural/active work)
- `workflows/` — Process docs: [[deeptastel]], [[bmad-framework]], [[agent-onboarding]], [[delegation-rules]]
- `tasks/` — [[kanban]] (active work board)
- `templates/` — Note templates
- `prompts/` — 5 production prompts (SEO blog, business plan, social media, course creator, prompt engineer)
- `references/` — Supplementary: [[mcp-servers]], [[n8n-workflows|n8n-workflows-ref]], [[people]], [[glossary]]
- `logs/` — Session history
- `assets/` — Binary files (logos, financials, templates)
- `skills/` — Agent skills

## Agent Protocol

1. Start here. Read this index for orientation.
2. For revenue questions → [[wiki/REVENUE-MAP]]
3. For "what should I work on" → [[wiki/PIPELINE]] then [[kanban]]
4. For client context → wiki/clients/
5. For project status → wiki/projects/
6. For raw source material → sources/ (read-only)
7. Log significant actions to `logs/YYYY-MM-DD-<description>.md`
8. Use frontmatter on all new notes: tags, status, revenue_impact, last_updated
9. Backlinks trace revenue paths: client → project → deliverable → invoice status

## Vault Rules
1. Revenue-first — if it doesn't help make money or deliver paid work, it doesn't belong in wiki/
2. Self-contained files — every note readable without context
3. Low token count — entire wiki/ should fit in one LLM context window
4. sources/ is immutable — agents never modify source documents
5. wiki/ is compiled — agents can update/regenerate from sources

---

*Restructured: 2026-05-06 | Owner: Kevin (Kev) | Pattern: Karpathy LLM Wiki*
