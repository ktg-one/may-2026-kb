# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Not a software codebase — an **Obsidian knowledge vault** (`knowledge2026` / "kb2026") that is the single operating system for Kev's commercial work at **Good AI Australia**. It follows Karpathy's **LLM Wiki pattern** ([nashsu/llm_wiki](https://github.com/nashsu/llm_wiki)): raw inputs are compiled into cross-referenced, revenue-focused knowledge. There is no build/lint/test — the "code" here is Markdown notes, their frontmatter, and `[[wikilinks]]`.

## AGENTS.md is canonical — read it

`AGENTS.md` holds the full operational schema (LLM Wiki pattern internals, the 4-signal relevance model, the frontmatter standard, the page-type registry, and vault-specific conventions). This file is a Claude-Code-oriented summary and pointer, not a second source of truth. **When this file and `AGENTS.md` disagree, `AGENTS.md` wins** — and if you materially change how the vault operates, update `AGENTS.md`, not this file. (Historically CLAUDE.md was a full copy of the schema and drifted behind `AGENTS.md`; keeping it a thin pointer prevents that.)

## Cold-start read order (do this first, every session)

The vault is designed to cancel context loss across sessions. Before any consequential action, read in this order:

1. `purpose.md` — why the vault exists, current focus, operating policies
2. `AGENTS.md` — canonical schema + hard rules
3. `memory/MEMORY.md` — auto-memory layer (persistent state; update when material context changes)
4. `STATE.md` — where things stand right now, open loops, next actions
5. `_index.md` / `wiki/_dashboard.md` — navigation and this-week attention routing
6. The page or task at hand

`_agent-protocol.md` covers vault access mechanics.

## Three-layer architecture — respect the boundaries

| Layer | Path | Access | Purpose |
|-------|------|--------|---------|
| Sources | `sources/` (root, not `raw/sources/`) | **READ ONLY** | Immutable raw inputs. Organised into category subfolders (`research/`, `strategy/`, `architecture/`, `doctrine/`, `operations/`, `methodology/`, `clients/`, `pitches/`, `packets/`). Never modify. |
| Wiki | `wiki/` | READ + WRITE | LLM-compiled, cross-referenced knowledge. Every page traces a revenue path. Agents regenerate this from sources. |
| Schema | `AGENTS.md` + `purpose.md` | READ + WRITE | The vault's rules and soul. Co-evolve with use. |

Operational (not wiki): `tasks/` (kanban), `workflows/` (process docs), `logs/` (session reports), `areas/` (unstable drafts, promoted to `wiki/` when finalised), `packets/` (context handoffs), `memory/` (auto-memory), `Company-Core-june-2026/` (canonical company docs — positioning, pricing, service list; STATE.md may still reference the older name `Company Core/`).

## Hard rules (from AGENTS.md — these are infrastructure, not suggestions)

- **Never fabricate.** A doc is "done" ONLY when the file exists at a named path with content in it. Every "written/updated/done" claim carries the exact path or it didn't happen. Missing data → inline marker `[NEEDS KEV: <what's needed>]` (this vault's variant of canonical `[NEEDS USER]`).
- **`sources[]` frontmatter on every wiki page, no exceptions** — it powers the ×4.0 source-overlap signal (highest weight) in the 4-signal relevance graph. Standard frontmatter: `title`, `type`, `tags`, `sources: [[[wikilinks]]]`, `last_updated: YYYY-MM-DD`. `_agent-protocol.md` adds `status` (`active`/`paused`/`completed`) and `revenue_impact` (`critical`/`high`/`medium`/`low`).
- **Recency rule (Kev, 2026-06-08):** a source dated more than one month before today is **LEGACY** — kept for lineage, not cited as current truth. Newer always overrides older on conflict. When a current page rests on a legacy source, say so.
- **Delete is blocked from the agent sandbox — archive, don't delete.** Duplicates and ingested round-trips go to `sources/_archive/`.
- **No loose files at the vault root.** Only the 4 structural files live there: `AGENTS.md`, `purpose.md`, `_index.md`, `_agent-protocol.md`. Everything else routes into `sources/`, `wiki/`, `areas/`, `packets/`, `logs/`, or `memory/`.
- **`[[wikilinks]]` over plain names.** They resolve by basename, so folder location never breaks a link. Dangling links are positive signal — declared knowledge gaps, not errors.
- **`compile` output is `status: draft` only** — never publish, send, or commit on Kev's behalf.
- Prefer editing existing files over creating new ones; keep files self-contained (readable without external context) and the whole `wiki/` lean enough to fit one LLM context window.

## Operating policies (from purpose.md / memory)

- **No menus when authorised.** Pick the sensible default and execute — the deliverable is the proof, not a proposal of it.
- **Carry the structure for Kev.** Severe ADHD means the vault holds the index, not his head; message-sprawl is a divergence phase — the job is synthesis, not another branch.
- **Log significant actions** to `logs/YYYY-MM-DD-<description>.md`; append events to `wiki/log.md` in Karpathy heading-prefix format: `## [YYYY-MM-DD] <op> | <one-line title>` (grep-parseable via `grep "^## \[" wiki/log.md`).

## Tooling

- **`llm-wiki` plugin** (v2.0.0, working tree in `plugins/`, gitignored). Single command `/llm-wiki:wiki` with subcommands: `init`, `ingest <file>` (two-step analysis→generation), `query <question>` (4-phase retrieval with `[N]` citations, files answers to `wiki/queries/`), `lint` (graph health, weekly), `compile <doc-type> <scope>` (produce a company doc from wiki state). Underlying skill: `skills/wiki/SKILL.md` in the plugin. Plugin commands are runtime-specific; the schema in `AGENTS.md` is portable, the runtime isn't.
- **GSD skills** (`/gsd-*`, documented in `COMMANDS.md`) are general project-workflow tooling, not vault-specific.
- `.gitignore` excludes `plugins/`, binaries (`*.exe`, `*.zip`, etc.), and logs. Nested tool dirs (`.smart-env/`, `.serena/`, `.obsidian/`, `.planning/`) are Obsidian/agent state, not hand-edited.
