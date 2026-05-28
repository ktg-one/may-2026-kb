---
title: Vault Operation Log
type: log
last_updated: 2026-05-28
---

# Vault Operation Log

Chronological record of material ingest / generation / restructure / strategic events in the vault. LLM Wiki canonical file — heading-prefix format so it's parseable with `grep "^## \[" wiki/log.md | tail -5`. See also `logs/` for longer-form session reports.

## [2026-05-28] query | Kev's cognitive architecture filed as canon

Kev shared [ktg-one/adhd](https://github.com/ktg-one/adhd) (fork of UditAkhourii/adhd) as the codified model of how his brain works. The repo is Tree-of-Thought with pruning — parallel divergent generation under cognitive frames in isolated contexts, then a separate mechanical critic pass to score/cluster/prune/deepen. Operational implication: his message-sprawl is the divergence phase by design; my role is the critic phase, not another branch. The `wiki/queries/` pattern is the right archival format because it preserves branch isolation (synthesis happens via the 4-signal relevance graph later, not by merging pages prematurely). Updated `user-adhd-parallel-projects` memory; filed canon doc at `wiki/queries/2026-05-28-cognitive-architecture-adhd-pattern.md`.

## [2026-05-28] query | Filed three chat-exploration decisions back to wiki/queries/

Karpathy pattern — good answers file back into the wiki so explorations compound rather than evaporate. Three decisions captured: (1) Notion vs GWS — skip Notion; use GWS + AppSheet + n8n + LLM Wiki vault. (2) Framework choice — Next.js for July launch; revisit TanStack at 6-month review. (3) Good AI orchestrator migration plan — two migrations (personal-account → Good AI Workspace tenant is urgent / launch-blocking; Vite → Next.js is low-urgency, defer until post-launch unless specific Vite limitation forces it). Tool name still [NEEDS KEV] before a proper `wiki/projects/` page can be created. Output: `wiki/queries/2026-05-28-notion-vs-gws-decision.md`, `wiki/queries/2026-05-28-framework-choice-nextjs.md`, `wiki/queries/2026-05-28-orchestrator-migration-plan.md`.

## [2026-05-28] compile | Next launch-blocker batch — AI-on-site playbook, legal drafts, payment SOP

Four docs shipped to clear the next gates. Website ☑ and service agreement ☑ confirmed cleared. New critical gate surfaced (per Kev): AI-on-site — can't ship an AI company's site without live AI on it. New page types `playbook` and `legal` appended to CLAUDE.md. Output: `wiki/operations/ai-on-site-playbook.md`, `wiki/legal/privacy-policy-draft.md`, `wiki/legal/terms-of-service-draft.md`, `wiki/operations/payment-processor-setup.md`. Legal drafts marked `status: draft — REQUIRES LAWYER REVIEW`.

## [2026-05-28] compile | Operations docs cluster for July 2026 launch

Compiled 8 operations docs in `wiki/operations/` grounded in the SEA plan + Trillet entity + voice-operating-layer concept. Operations handbook (`_index`), service delivery runbook, client onboarding SOP, support/incident runbook, capacity plan, weekly cadence, risk register, July 2026 launch checklist. Six new page types appended to CLAUDE.md (handbook, sop, runbook, register, checklist — plus `plan` already present). Updated `wiki/index.md` to surface the operations cluster. All docs `status: draft` — to be field-tested against the first 3 client deployments.

## [2026-05-28] sort | Vault sorted to canonical LLM Wiki structure

Migrated `wiki/log.md` from mixed table+heading format to pure Karpathy heading-prefix. Appended operational LLM Wiki schema section to `CLAUDE.md` (page types in use populated, vault conventions documented). Created `wiki/index.md` (canonical content catalog pointing to existing `_map.md` / `_dashboard.md` / `_projects-index.md`) and `wiki/overview.md` (global summary). Cleared dangling `[[wiki/concepts/iso-42001-ai-management-systems]]` by writing the concept page.

## [2026-05-25] plugin | llm-wiki.plugin v0.2.0 — validation fix

Validator rejected v0.1.1. Root cause: SKILL.md `name:` field carried the plugin prefix (`llm-wiki:ingest`) instead of bare local name (`ingest`) as the brand-voice plugin uses. Fix shipped: stripped prefix on all 5 skills; aligned `plugin.json` keys to brand-voice's exact set (dropped `homepage`, `author.email`). JSON validated on disk and inside the zip. Plugin installed successfully — `llm-wiki:*` skills now available across this Cowork install.

## [2026-05-25] plugin | llm-wiki.plugin v0.1.1 — wiki-is-individual fix

Corrected over-prescription from v0.1.0. The init skill was writing a fixed page-type taxonomy into CLAUDE.md (nashsu's source-summary/entity/concept/query/synthesis/comparison list). Per Karpathy and per Kev's directive that "the wiki is individual", the schema template is now minimal infrastructure only; page types start empty and co-evolve from ingest. Common types listed only as inspiration, explicitly not prescribed.

## [2026-05-25] plugin | llm-wiki.plugin v0.1.0 — first build

Built `llm-wiki.plugin` v0.1.0 — 5 skills (init, ingest, query, lint, compile), 5 slash commands, Karpathy gist bundled as seed doc. Output: `outputs/llm-wiki.plugin` (~27 KB, 21 files). Makes the LLM Wiki method repeatable across all Claude Code / Cowork projects.

## [2026-05-25] todo | v0.2.x of llm-wiki.plugin queued

Clone nashsu/llm_wiki repo source (TypeScript + Rust) and extract: (1) exact Step 1/Step 2 prompt templates from `src/lib/ingest.ts`; (2) Unicode-safe filename slug rules; (3) full Tavily Deep Research orchestration → add `llm-wiki:deep-research` skill; (4) cascade-delete 3-method matching → add `llm-wiki:remove-source` skill; (5) `dataVersion` material-change signalling for `overview.md` regeneration. Fresh-context session.

## [2026-05-25] ingest | Good AI Australia SEA Business Plan redraft

Two-step CoT ingest of the SEA plan redraft. Step 1 surfaced 5 new entities, 3 new concepts, 6 cross-ref updates, 2 contradictions (goodai-voice platform stack + pricing model). Step 2: source summary + 2 entity pages + 1 concept page + 3 cross-ref updates. Pages touched: `wiki/sources/goodai-sea-businessplan-redraft-2026-05-25.md`, `wiki/entities/trillet-ai.md`, `wiki/entities/kevin-tan.md`, `wiki/concepts/voice-operating-layer.md`, `wiki/good-ai.md` (rewrite), `wiki/projects/goodai-voice.md` (reconcile), `wiki/projects/ap-tech.md` (status change).

## [2026-05-25] session | LLM Wiki pattern adopted as canonical persistent state

`purpose.md` created at vault root. `wiki/log.md` created. Plan: wiki + auto-memory together ARE the AI-agnostic persistent state across sessions, models, and tools.

## [2026-05-25] dashboard | Project Dashboard built

Single attention-routing surface for an ADHD operating week. Earning → Pipeline → Building → IP → Paused → Done. At `wiki/_dashboard.md`.

## [2026-05-25] plan | Good AI Australia SEA Business Plan redrafted end-to-end

All 12 sections rewritten over multiple clarification rounds with Kev. [NEEDS KEV] pruned from 15 → 11 items. Output: `areas/2026-05-25-GoodAI-SEA-BusinessPlan-redraft.md`.

## [2026-05-25] memory | Five new memory entries

User memory (ADHD parallel-projects). Feedback memories (stay-fluid policy, no-option-menus-when-authorised, wiki-template-is-individual). Project memory (LLM Wiki as cross-platform state). Pages: `memory/user_adhd_parallel_projects.md`, `memory/feedback_stay_fluid_policy.md`, `memory/feedback_no_option_menus_when_authorised.md`, `memory/feedback_wiki_template_is_individual.md`, `memory/project_llm_wiki_as_cross_platform_state.md`.

## [2026-05-25] research | Trillet AI platform refresh

Fetched current trillet.ai (site + pricing + agency page). Resolved the COGS conflict in the SEA plan ($99/mo Studio + $0.12/min + $5/number). Confirmed certifications: SOC 2 Type II, ISO 27001, HIPAA, GDPR, TCPA. Updated SEA plan Sections 7, 11, 12.

## [2026-05-25] strategic | Packaging direction decision

Direct-to-SME subscriptions AND white-label agency resale run in parallel; market signal decides which is the lead lucrative path. Reflected in SEA plan Sections 1 and 9.

## [2026-05-25] strategic | Founder credentials substantiated

PromptBase top 0.8% (Sept 2025) and Recursive Council top 0.01% (Dec 2025) with full provenance — adversarial Vertex AI benchmark, Reddit-published, ThoughtLogic enumeration. Plus ISO/IEC 42001 (AI Management Systems). SEA plan Section 5.

## [2026-05-06] restructure | Karpathy LLM Wiki pattern restructure

Vault restructured to `wiki/` (compiled knowledge) + `sources/` (raw inputs) + MoC + projects index. Pages: `wiki/_map.md`, `wiki/_projects-index.md`, `wiki/good-ai.md`, `wiki/REVENUE-MAP.md`, `wiki/PIPELINE.md`. See `logs/2026-05-06-karpathy-wiki-restructure.md` for the full session report.

## [2026-03-31] init | Vault initialised

Vault scaffolded. Pages: `_index.md`, base structure. See `logs/2026-03-31-vault-init.md`.
