# LLM-WIKI-PATTERN
## 1 (Analysis): LLM reads source → structured analysis
  - Key entities, concepts, arguments
  - Connections to existing wiki content
  - Contradictions & tensions with existing knowledge
  - Recommendations for wiki structure

## 2 (Generation): LLM takes analysis → generates wiki files
  - Source summary with frontmatter (type, title, sources[])
  - Entity pages, concept pages with cross-references
  - Updated index.md, log.md, overview.md
  - Review items for human judgment
  - Search queries for Deep Research
  
## 3 Additional Ingest
Additional ingest enhancements beyond the original:
* SHA256 incremental cache — source file content is hashed before ingest; unchanged files are skipped automatically, saving LLM tokens and time
* Persistent ingest queue — serial processing prevents concurrent LLM calls; queue persisted to disk, survives app restart; failed tasks auto-retry up to 3 times
* Folder import — recursive folder import preserving directory structure; folder path passed to LLM as classification context (e.g., "papers > energy" helps categorize content)
* Source folder auto-watch — files added, edited, or deleted in raw/sources/ outside the app are picked up automatically and reuse the same ingest/delete lifecycle as in-app actions
* Queue visualization — Activity Panel shows progress bar, pending/processing/failed tasks with cancel and retry buttons
* Auto-embedding — when vector search is enabled, new pages are automatically embedded after ingest
* Source traceability — every generated wiki page includes a sources: [] field in YAML frontmatter, linking back to the raw source files that contributed to it
overview.md auto-update — global summary page regenerated on every ingest to reflect the latest state of the wiki
* Guaranteed source summary — fallback ensures a source summary page is always created, even if the LLM omits it
* Language-aware generation — LLM responds in the user's configured language (English or Chinese)

https://github.com/nashsu/llm_wiki/blob/main/assets/3-knowledge_graph.jpg

## 4-Signal Relevance Model:

Signal	Weight	Description
Direct link	×3.0	Pages linked via [[wikilinks]]
Source overlap	×4.0	Pages sharing the same raw source (via frontmatter sources[])
Adamic-Adar	×1.5	Pages sharing common neighbors (weighted by neighbor degree)
Type affinity	×1.0	Bonus for same page type (entity↔entity, concept↔concept)
Graph Visualization (sigma.js + graphology + ForceAtlas2):

Node colors by page type or community, sizes scaled by link count (√ scaling)
Edge thickness and color by relevance weight (green=strong, gray=weak)
Hover interaction: neighbors stay visible, non-neighbors dim, edges highlight with relevance score label
Zoom controls (ZoomIn, ZoomOut, Fit-to-screen)
Position caching prevents layout jumps when data updates
Legend switches between type counts and community info based on coloring mode

## 5. Louvain Community Detection
Not in the original. Automatic discovery of knowledge clusters using the Louvain algorithm (graphology-communities-louvain):

Auto-clustering — discovers which pages naturally group together based on link topology, independent of predefined page types
Type / Community toggle — switch between coloring nodes by page type (entity, concept, source...) or by discovered knowledge cluster
Cohesion scoring — each community scored by intra-edge density (actual edges / possible edges); low-cohesion clusters (< 0.15) flagged with warning
12-color palette — distinct visual separation between clusters
Community legend — shows top node label, member count, and cohesion per cluster

https://github.com/nashsu/llm_wiki/blob/main/assets/kg_community.jpg

## 6. Graph Insights — Surprising Connections & Knowledge Gaps
Not in the original. The system automatically analyzes graph structure to surface actionable insights:

Surprising Connections:

Detects unexpected relationships: cross-community edges, cross-type links, peripheral↔hub couplings
Composite surprise score ranks the most noteworthy connections
Dismissable — mark connections as reviewed so they don't reappear
Knowledge Gaps:

Isolated pages (degree ≤ 1) — pages with few or no connections to the rest of the wiki
Sparse communities (cohesion < 0.15, ≥ 3 pages) — knowledge areas with weak internal cross-references
Bridge nodes (connecting 3+ clusters) — critical junction pages that hold multiple knowledge areas together
Interactive:

Click any insight card to highlight corresponding nodes and edges in the graph; click again to deselect
Knowledge gaps and bridge nodes have a Deep Research button — triggers LLM-optimized research with domain-aware topics (reads overview.md + purpose.md for context)
Research topic shown in editable confirmation dialog before starting — user can refine topic and search queries

## 7. Optimized Query Retrieval Pipeline
The original describes a simple query where the LLM reads relevant pages. We built a multi-phase retrieval pipeline with optional vector search and budget control:

Phase 1: Tokenized Search
  - English: word splitting + stop word removal
  - Chinese: CJK bigram tokenization (每个 → [每个, 个…])
  - Title match bonus (+10 score)
  - Searches both wiki/ and raw/sources/

Phase 1.5: Vector Semantic Search (optional)
  - Embedding via any OpenAI-compatible /v1/embeddings endpoint
  - Stored in LanceDB (Rust backend) for fast ANN retrieval
  - Cosine similarity finds semantically related pages even without keyword overlap
  - Results merged into search: boosts existing matches + adds new discoveries

Phase 2: Graph Expansion
  - Top search results used as seed nodes
  - 4-signal relevance model finds related pages
  - 2-hop traversal with decay for deeper connections

Phase 3: Budget Control
  - Configurable context window: 4K → 1M tokens
  - Proportional allocation: 60% wiki pages, 20% chat history, 5% index, 15% system
  - Pages prioritized by combined search + graph relevance score

Phase 4: Context Assembly
  - Numbered pages with full content (not just summaries)
  - System prompt includes: purpose.md, language rules, citation format, index.md
  - LLM instructed to cite pages by number: [1], [2], etc.
Vector Search is fully optional — disabled by default, enabled in Settings with independent endpoint, API key, and model configuration. When disabled, the pipeline falls back to tokenized search + graph expansion. Benchmark: overall recall improved from 58.2% to 71.4% with vector search enabled.

---

# LLM Wiki schema — knowledge2026

> Operational schema for this vault. The reference material above describes the *pattern*; this section describes how the pattern is *instantiated here*. Co-evolves with use. The `/llm-wiki:wiki` command (with `init`, `ingest`, `query`, `lint`, `compile` subcommands) reads this section to operate.

## Three layers (Karpathy)

- `sources/` and `raw/sources/` — immutable raw inputs. LLM reads, never writes. (This vault uses `sources/` directly at the root — variant convention noted below.)
- `wiki/` — LLM-generated compiled knowledge. LLM writes; user reads.
- This file (`CLAUDE.md`) + `purpose.md` — schema and soul. Co-evolve with use.

## Four operations

- `/llm-wiki:ingest <file>` — two-step CoT (analysis → generation).
- `/llm-wiki:query <question>` — 4-phase retrieval with `[N]` citations; files good answers back to `wiki/queries/`.
- `/llm-wiki:lint` — graph health check; weekly cadence.
- `/llm-wiki:compile <doc-type> <scope>` — produce a company doc from the wiki state.

## Frontmatter standard (every wiki page — infrastructure, not optional)

```yaml
---
title: <human title>
type: <see "Page types in use" below>
tags: [<short tag list>]
sources: [<[[wikilinks]] to raw sources and parent wiki pages>]
last_updated: YYYY-MM-DD
---
```

**`sources[]` is load-bearing** — powers the ×4.0 source-overlap signal in the 4-signal relevance graph (highest weight). Never omit it.

## 4-signal relevance model (tunable defaults)

| Signal | Weight | Source of truth |
|---|---|---|
| Direct link | ×3.0 | `[[wikilinks]]` in body text |
| Source overlap | ×4.0 | shared entries in `sources[]` frontmatter |
| Adamic-Adar | ×1.5 | shared neighbors, weighted by neighbor degree |
| Type affinity | ×1.0 | same `type` bonus |

## Log format (Karpathy heading-prefix, grep-parseable)

```
## [YYYY-MM-DD] <op> | <one-line title>

<body — pages touched, decisions, contradictions resolved>
```

Query: `grep "^## \[" wiki/log.md | tail -5`.

## Read order on a cold start

1. `purpose.md` — why the vault exists, current focus, operating policies
2. This file (`CLAUDE.md`) — schema + operational rules
3. `wiki/index.md` — content catalog
4. `wiki/_dashboard.md` — Monday-morning attention routing
5. `wiki/overview.md` — global state snapshot
6. `wiki/log.md` (`tail -5`) — what changed most recently
7. The page or query at hand

If the agent is running on another tool (Codex, Pi, Gemini, etc.) and looking for `AGENTS.md` — this file is the equivalent; treat it as such.

## Hard rules (infrastructure-level, apply to every operation)

- LLM writes the wiki; user curates sources.
- Never invent facts. Missing data → `[NEEDS USER: <what's needed>]` inline.
- `sources[]` frontmatter on every wiki page, no exceptions.
- `[[wikilinks]]` over plain prose names. Dangling links are positive signal — knowledge gaps the wiki has declared intent on.
- `compile` produces `status: draft` only. Never publish, send, or commit.
- Compatible with the auto-memory layer at `memory/MEMORY.md` — read at session start; update when material context changes.

---

## Page types in use

Types this vault has committed to so far. Append when a new type is introduced via ingest.

| Type | First used | What it covers |
|---|---|---|
| `purpose` | 2026-05-25 | Vault soul — why this exists, goals, scope, policies |
| `log` | 2026-05-25 | Chronological operation record |
| `index` | 2026-05-28 | Content catalog |
| `overview` | 2026-05-28 | Global state summary, regenerated on material ingest |
| `dashboard` | 2026-05-25 | Single-page attention routing for the week |
| `company` | 2026-05-25 | Company root pages (e.g. `wiki/good-ai.md`) |
| `entity` | 2026-05-25 | People, organisations, vendors, partners, standards |
| `concept` | 2026-05-25 | Theories, methods, capability models, frameworks |
| `source-summary` | 2026-05-25 | One summary page per ingested raw source |
| `project` | (pre-existing) | Internal builds / products |
| `client` | (pre-existing) | Client engagement pages |
| `framework` | (pre-existing) | Sellable methodologies (BPD, AIANT) |
| `plan` | 2026-05-25 | Multi-page commercial / strategic plans |
| `handbook` | 2026-05-28 | Domain-level index (operations handbook, etc.) — TOC + operating philosophy + read order |
| `sop` | 2026-05-28 | Standard operating procedure (repeatable process with steps, timing, responsible) |
| `runbook` | 2026-05-28 | Operational runbook (what to do when a specific situation occurs — delivery, incident, etc.) |
| `register` | 2026-05-28 | Tracked list with owner / status / mitigation (risk register, decision log, etc.) |
| `checklist` | 2026-05-28 | Time-boxed gated checklist (launch, audit, etc.) |
| `playbook` | 2026-05-28 | Multi-phase build plan for a feature or capability (AI-on-site, channel-partner rollout, etc.) |
| `legal` | 2026-05-28 | Legal documents that ship publicly (Privacy Policy, ToS, partner agreements) — drafted in vault, reviewed by lawyer, published on the site |
| `lint-report` | (queued — will be created on first `/lint` run) | Periodic health-check output |
| `query` | (queued — created when the first `/query` answer is filed back) | Filed query answers |

## Conventions (vault-specific)

Conventions decided for *this* vault. These deviate from the canonical LLM Wiki layout in places — listed here so agents on every tool stay aligned.

- **`sources/` at the vault root**, not `raw/sources/`. Reason: legacy from the May 2026 restructure; no need to migrate.
- **`wiki/` files prefixed with `_`** (`_index.md`, `_map.md`, `_projects-index.md`, `_dashboard.md`) sort to the top in Obsidian's file pane and are the navigation surfaces. The canonical `wiki/index.md` (no underscore) is also present and points at them — both forms coexist.
- **`wiki/sources/_index.md`** is the sources sub-index.
- **`logs/` directory at vault root** (not under `wiki/`) holds long-form session reports — separate from `wiki/log.md` which holds the event ledger. Cross-referenced from log entries when applicable.
- **`areas/` directory** holds working documents that are not yet stable wiki pages (e.g. the SEA business-plan redraft). Promoted into `wiki/` only when finalised.
- **`packets/` directory** holds context-handoff packets (KTG-CEP carry-packets, COP/GP5 session handoffs). Not part of the wiki proper; raw context.
- **Auto-memory directory** at `memory/MEMORY.md` (outside the vault, in the Cowork session-space) — read at session start, updated when material context changes. Treated as state, not as a wiki page.
- **`[NEEDS KEV: ...]`** is this vault's inline gap marker (equivalent to canonical `[NEEDS USER]`). Used consistently across plans, drafts, and ingest output.

## Hot cache (high-traffic pages)

Pages that should typically be in the agent's working context when active on this vault:

- [[purpose]]
- [[wiki/_dashboard]]
- [[wiki/REVENUE-MAP]]
- [[wiki/PIPELINE]]
- [[wiki/good-ai]]
- [[wiki/log]] (tail 5)
- [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]]

## Plugin

`llm-wiki` plugin v2.0.0. Source: [`ktg-one/llm-wiki`](https://github.com/ktg-one/llm-wiki) — fork of `ekadetov/llm-wiki`. Working tree at `plugins/llm-wiki/` (separate nested git repo, gitignored by the vault). Registered as a github marketplace + enabled in `.claude/settings.json` so any machine that pulls the KB installs the plugin on first session.

Command surface: a single `/llm-wiki:wiki` command with subcommands — `init`, `ingest`, `query`, `lint`, `compile`. Underlying skill: `skills/wiki/SKILL.md` inside the plugin.

Reference doc: the canonical Karpathy gist is bundled with the plugin itself.

Non-Claude-Code CLIs (Codex, Gemini, Pi, etc.): plugin hooks/commands are Claude-Code-specific. The schema/pattern in this CLAUDE.md is portable; the runtime isn't. Each tool needs its own surface (e.g. AGENTS.md / GEMINI.md) wired to the same `skills/wiki/SKILL.md` and `scripts/lint-wiki.py`.
