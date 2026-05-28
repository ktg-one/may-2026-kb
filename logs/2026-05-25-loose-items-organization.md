---
title: Loose-items Organization Ingest
tags: [log, ingest, llm-wiki-pattern, restructure]
created: 2026-05-25
author: claude-opus-4-7
type: log
status: completed
---

# Loose-items Organization Ingest (2026-05-25)

Executed per CLAUDE.md two-step LLM Wiki Pattern. 17 loose root items + 1 misfiled CSV + 2 untracked folders processed.

## Step 1 — Analysis

Full structured analysis at [[2026-05-25-loose-items-analysis]]. Covers per-source entities/concepts/connections/contradictions/recommendations, cross-cutting themes, contradictions, review items, and Deep Research queries.

## Step 2 — Generation

### New wiki pages created
| Type | Path | Subject |
|------|------|---------|
| framework | wiki/frameworks/business-process-discovery.md | 5-day discovery methodology (sellable) |
| framework | wiki/frameworks/aiant.md | AI-Anthropology model honesty framework |
| concept | wiki/concepts/transparency-fabrication-complexity.md | AIANT core thesis |
| concept | wiki/concepts/perth-childrens-books-opportunity.md | Market exploration (status: review) |
| project | wiki/projects/automation-station.md | Portable Docker + n8n station |
| index | wiki/sources/_index.md | Source-summary index |
| source-summary | wiki/sources/business-process-discovery-framework.md | |
| source-summary | wiki/sources/aiant-framework.md | |
| source-summary | wiki/sources/market-demand-analysis-perth-childrens-books.md | |
| source-summary | wiki/sources/cop-r8-aptech-kismet-swarm.md | |
| source-summary | wiki/sources/pre-engagement-discovery-sop.md | |
| source-summary | wiki/sources/wa-sme-research.md | |
| source-summary | wiki/sources/ktg-ai-education-platform-feasibility.md | high-priority review |
| source-summary | wiki/sources/goodai-competitive-analysis-apr2026.md | |
| source-summary | wiki/sources/aptech-notebooklm-slides.md | |
| source-summary | wiki/sources/door-knocking-script.md | |
| source-summary | wiki/sources/professor-prompt-code.md | |
| source-summary | wiki/sources/optimine-assets.md | review needed |
| source-summary | wiki/sources/parm-tjhungs-assets.md | review needed |

### Updated navigation
- `_index.md` — added Frameworks, Concepts, Source summaries sections; updated Operational + sources/ folder listings.
- `wiki/_map.md` — added Frameworks/Concepts tables, source-summary cluster, expanded sources/operational tables.

## Move Manifest (sources side)

All moves complete. Vault root is now clean of loose `.md`/`.docx`/`.xlsx`/`.pdf`/`.zip` items. See [[2026-05-25-loose-items-analysis]] §"Move Manifest" for the per-file mapping.

Specifically:
- 2 duplicates → `archive/2026-05-25-loose-items/`
- 5 loose `.md` files → `sources/research/aiant/`, `sources/packets/`, `sources/methodology/`, `sources/research/perth-childrens-books/`
- 4 `.docx` → `sources/methodology/`, `sources/research/wa-sme/`, `sources/pitches/` (x2)
- 1 large `.zip` (slides) → `clients/AP-tech/ap-tech-slides/`
- 1 `.xlsx` → `clients/kismet-finance/`
- 1 `.pdf` → `assets/sales/`
- 3 asset `.zip` → `assets/code/`, `assets/optimine/`, `assets/parm-tjhungs/`
- `LEE-monarc/*` → `clients/lee-monarch/assets/` (folder dissolved)
- `clients/AP Technologies...csv` → `clients/AP-tech/ap-tech-research/`
- `automation-station/` — **unchanged**, registered via `wiki/projects/automation-station.md`

## Review items (require Kev's judgment)

| # | Item | Question | Priority |
|---|------|----------|----------|
| R1 | AI Education Platform Feasibility | Promote to project page (5th revenue stream) or archive? | **High** |
| R2 | Perth Children's Books | New revenue stream, client work, or pure research? | Medium |
| R3 | Optimine assets | What project / whose? | Medium |
| R4 | Parm Tjhungs assets | Old client / partner / archive? | Low |
| R5 | Professor Prompt code | Active or superseded by LEGIO? | Low |
| R6 | AIANT framework | Monetize as methodology/training/publication? | Medium |
| R7 | AP Tech wiki client page | Does `wiki/clients/ap-tech.md` exist? Create if not. | Medium |
| R8 | Competitive Analysis docx | Extract text → update REVENUE-MAP competitor section | Medium |
| R9 | WA SME docx | Extract text → enrich AI Talent Gap cluster | Medium |
| R10 | Pre-Engagement Discovery SOP docx | Extract text → wire to business-process-discovery framework | Medium |

## Deep Research queries to schedule

1. Published model context degradation thresholds — Claude / GPT / Gemini 2026
2. AI discovery engagement pricing benchmarks — Australia 2026
3. Personalized children's books market — Perth competitors 2026
4. AI education platform business models — Australia
5. Process mining vs interview-based discovery — accuracy comparison
6. n8n portable / Docker Compose deployment patterns — enterprise client model

## Notes

- Two new folders appeared at root during this run (`052026/`, `New folder/`) — left untouched per user instruction ("ill get cwork on top helping").
- The `packets/` folder at root (separate from `sources/packets/`) was not inspected — flag for future consolidation review.
- All new pages include `sources: [...]` frontmatter per LLM Wiki Pattern source traceability rule.
- All new pages use `[[wikilinks]]` for cross-references per the 4-signal relevance model.

---

*Restructure pattern: CLAUDE.md LLM Wiki Pattern §1-2 | Owner: Kevin | Executor: claude-opus-4-7 | Date: 2026-05-25*
