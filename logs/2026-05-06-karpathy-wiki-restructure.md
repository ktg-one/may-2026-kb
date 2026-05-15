---
title: Karpathy Wiki Restructure
tags: [log, migration, restructure]
created: 2026-05-06
author: claude-opus
---

# Vault Restructure: Karpathy LLM Wiki Pattern

**Date:** 2026-05-06
**Pattern:** Andrej Karpathy's three-layer LLM Wiki (sources → wiki → index)
**Scope change:** Mid-migration pivot to revenue-only focus. Wiki contains ONLY content that helps make money or deliver paid work.

## What Changed

### New Structure Created

**_index.md** — Complete rewrite as revenue decision tree with three-layer architecture documentation.

**wiki/** — 15 compiled articles, all revenue-focused:
- wiki/REVENUE-MAP.md — All 4 revenue streams, 10 products, pricing, margins, projections, competitors, blockers
- wiki/PIPELINE.md — Active deals (Kismet 198 leads), prospects, investor pipeline, eligible grants
- wiki/good-ai.md — Company profile with TAM/SAM/SOM, infrastructure, product catalog
- wiki/clients/kismet-finance.md — Primary channel partner profile
- wiki/clients/leemonarc.md — Brand kit project
- wiki/clients/weitj-investments.md — Pitch opportunity
- wiki/clients/sun-island-bali.md — Completed assessment
- wiki/clients/manaa.md — Completed audit
- wiki/projects/n8n-workflows.md — 18 workflow inventory (delivery backbone)
- wiki/projects/goodai-voice.md — Voice assistant product
- wiki/projects/gws-cli.md — Google Workspace CLI v0.22.3
- wiki/projects/legio-framework.md — Prompt engineering framework
- wiki/projects/ktg-one.md — Portfolio site
- wiki/projects/fastmcp-server.md — MCP server infrastructure
- wiki/projects/ap-tech.md — Client site
- wiki/_map.md — Map of Content
- wiki/_projects-index.md — All project folders mapped

**sources/** — Raw immutable inputs (copies, originals untouched):
- sources/pitches/ — 3 pitch/feasibility documents
- sources/clients/kismet-finance/ — 13 raw Kismet docs + 2026 Contract folder
- sources/clients/weitj-investments/ — Strategic analysis
- sources/clients/manaa/ — AI audit
- sources/research/ — AI Talent Gap (feeds pitch), voice agent personas (sellable specs)
- sources/packets/ — Context carry packets (copied from packets/)

### Nothing Deleted

All original files remain in place. The restructure is additive:
- areas/ — still exists, now superseded by wiki/clients/ and wiki/projects/
- clients/ — still exists, raw docs also copied to sources/clients/
- packets/ — still exists, also copied to sources/packets/
- Root-level research docs — still in place, also in sources/

### What Was NOT Included in Wiki (Revenue Filter)

These exist in the vault but are excluded from wiki/ because they don't directly generate revenue:
- references/60-second-training-scripts.md — training content, not billable
- references/60s-google-workspace.md — generic tutorial
- references/60s-raycast-basics.md — personal productivity
- references/glossary.md — generic terms (any LLM knows these)
- references/model-selection.md — generic AI knowledge
- references/prompt-patterns.md — not tied to revenue stream
- references/notion-agents.md, notion-agents-duplicate.md, notion-untitled.md — duplicates/stale
- references/n8n-ideas.md — brainstorming, not actionable
- references/tools-and-systems.md — superseded by wiki/good-ai.md
- archive/ — historical content
- 25+ prompt templates in references/prompts/ — generic, not client-specific

### Operational Folders (Kept As-Is)
- workflows/ — 7 process docs (DEEPTASTEL, BMAD, etc.) — procedural, not wiki
- tasks/ — kanban board
- templates/ — note templates
- prompts/ — 5 production prompts
- skills/ — agent skills
- assets/ — binary files
- logs/ — session history

## Lint Pass Results

### Orphan Notes (in areas/, not referenced by wiki/)
These are superseded by wiki/ articles. Content has been compiled into the wiki layer:
1. areas/111925-GoodAI_legacy.md → superseded by wiki/good-ai.md
2. areas/darling-good.md → referenced in wiki/projects/goodai-voice.md
3. areas/good-ai-agent-knowledge-base.md → superseded by wiki/good-ai.md
4. areas/kismet-automation.md → superseded by wiki/clients/kismet-finance.md
5. areas/kismet-crm-schema.md → compiled into wiki/clients/kismet-finance.md
6. areas/kismet-data-handling.md → compiled into wiki/clients/kismet-finance.md
7. areas/kismet-invoice-template.md → moved to sources/clients/kismet-finance/
8. areas/kismet-lead-stages.md → compiled into wiki/clients/kismet-finance.md
9. areas/kismet-overview.md → compiled into wiki/clients/kismet-finance.md
10. areas/kismet-voice-agent.md → compiled into wiki/projects/goodai-voice.md
11. areas/weitj-investments-final-rewrite.md → moved to sources/clients/weitj-investments/

### Stale Content Identified
- references/notion-agents-duplicate.md — duplicate, no value
- references/notion-untitled.md — empty/placeholder
- archive/mcp-servers-feb2026.md — outdated (current version in references/mcp-servers.md)
- archive/n8n-workflows-feb2026.md — outdated (current version in references/n8n-workflows.md)

### Missing Articles (Recommended Future Additions)
- wiki/clients/hewson.md — Hewson Voice Agents assessment exists but no wiki article
- wiki/projects/bmad-framework.md — only if BMAD becomes a sellable methodology
- wiki/CASE-STUDIES.md — needed urgently for first sales conversions

## Token Budget

Wiki layer total: ~2,821 words (~3,700 tokens). Fits easily in a single LLM context window with room for conversation.

## Recommended Next Steps

1. Convert first Kismet warm lead → first case study → update REVENUE-MAP status
2. Create wiki/CASE-STUDIES.md once first implementation completes
3. Make productization decision on LEGIO and gws CLI
4. Clean up orphan areas/ files once confident wiki/ is authoritative
5. Add Hewson as wiki client article if engagement reactivates
