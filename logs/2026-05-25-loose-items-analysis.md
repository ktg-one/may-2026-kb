---
title: Loose-items Ingest — Step 1 Analysis
tags: [log, ingest, analysis, llm-wiki-pattern]
created: 2026-05-25
author: claude-opus-4-7
type: log
status: completed
---

# Loose-items Ingest — Step 1 Analysis (2026-05-25)

Per CLAUDE.md two-step LLM Wiki Pattern. Step 1 = structured analysis. Step 2 = wiki generation (see `wiki/sources/`, `wiki/frameworks/`, `wiki/concepts/`, and the matching log section below).

## Scope

17 loose items at vault root + 2 untracked folders + 1 misfiled CSV in `clients/`. All have been physically relocated to `sources/`, `clients/`, `assets/`, or `archive/` (see Move Manifest at end). This document captures the analytical reasoning behind classification.

## Per-source Analysis

### 1. AIANT framework — `022026-AIANT-onboard[DO-THIS-FIRST].md` + `022026-AIANT-2026-[ALL-TESTS].md`

**Now at:** `sources/research/aiant/`

**Key entities:** AI-Anthropology Research (ktg.one project), labs (Anthropic, OpenAI, Google), the Epistemic Contract (嘘契約), Model Probe, Pique Test, Stealth MBTI Diagnostic.

**Key concepts:**
- **Transparency > Fabrication > Complexity** — derived ordering, not ethical claim. Cheapest by accounting under lab efficiency mandates.
- **Fabrication necessity** — % of reasoning weight at which a model must fabricate to keep up.
- **Lossy middle**, **context shearing**, **silent compaction** — platform-level honesty gaps.
- **Keyword weight hierarchy** (Note < You must < NEVER), **XML tag authority** (`<context>` demotes nested `<never>`), **attention curve** (positional kill).
- **Efficiency override** — RLHF-trained behavior that drops constraints when generation is expensive.

**Connections to existing wiki:**
- `workflows/delegation-rules.md` already encodes "Transparency > fabrication" as Principle #3. AIANT is the rigorous derivation behind that informal rule.
- Relevant to model selection for `wiki/projects/goodai-voice.md` and any agent built via `wiki/projects/legio-framework.md`.

**Contradictions / tensions:** None within the vault — AIANT is Kev's IP and consistent with the delegation rules. External tension: lab marketing claims vs the published "context degradation" reality. The framework itself is the resolution.

**Wiki recommendation:** Create `wiki/frameworks/aiant.md` (entity-level framework page) and `wiki/concepts/transparency-fabrication-complexity.md` (the core thesis). Flag for monetization review — this is potentially a sellable methodology (model evaluation engagements, training material). Current `revenue_impact: medium` pending Kev's decision.

**Deep Research queries to schedule:**
- "Published model context degradation thresholds Claude / GPT / Gemini 2026"
- "RLHF efficiency override empirical measurements"
- "Stealth MBTI prompt diagnostic prior art"

---

### 2. Business Process Discovery Framework — `GoodAI-Business-Process-Discovery-Framework.md`

**Now at:** `sources/methodology/`

**Key entities:** KTG / Good AI, AP Tech (used as worked example throughout), Power Automate, n8n, M365, UiPath, Greenlight Guru, Power BI.

**Key concepts:**
- **5-day discovery structure** — Phase A (3-tier interviews: exec / manager / operator), B (process mapping template), C (weighted scoring matrix), D (solution recommendation decision tree).
- **Weighted scoring matrix** — Impact 30% / Feasibility 25% / Risk 20% / Strategic Value 15% / Quick Win 10%. Threshold: >3.5 = strong candidate.
- **Impact-Feasibility quadrant** (DO FIRST / PLAN FOR / QUICK WINS / DON'T DO).
- **Solution categories** — KTG Build (n8n / AI Agent / Dashboard), Microsoft Native, Third-Party Tool, Process Improvement, Keep Manual.
- **Credibility principle** — recommend what's right, not what bills. Trust compounds faster than invoices.

**Connections to existing wiki:**
- **Direct revenue path** — this IS the methodology behind every discovery engagement at the top of `wiki/PIPELINE.md` and `wiki/REVENUE-MAP.md`.
- Heavily references `wiki/clients/ap-tech` (AP Tech is the worked example).
- Delivery backbone: `wiki/projects/n8n-workflows.md` (n8n is one of the recommended solutions).
- Complements `wiki/projects/legio-framework.md` (prompt engineering for the "AI Agent" solution category).
- Pre-engagement counterpart: `Pre-Engagement AI Discovery SOP.docx` (now at `sources/methodology/`).

**Contradictions / tensions:** None — fully aligned with the existing revenue model.

**Wiki recommendation:** Create `wiki/frameworks/business-process-discovery.md` as a first-class page. `revenue_impact: high` — this is the sellable consulting product. Should be linked from REVENUE-MAP.md as a productized service.

**Deep Research queries to schedule:**
- "AI discovery engagement pricing benchmarks Australia 2026"
- "Process mining vs interview-based discovery accuracy comparison"

---

### 3. Market Demand Analysis (Perth personalized children's books) — `Market Demand Analysis.md`

**Now at:** `sources/research/perth-childrens-books/`

**Key entities:** Perth/WA market, "Grace" (digital-savvy parent persona, 28-38, $65K-120K HHI), "Ben" (value-conscious adopter), Paperbird Books Fremantle, Spacecubed, ServiceWA, Spriggy, Little Dance, LilyCraft, Givi Gifts, Magic Picture Story, Epic Tales, ChildBook.ai.

**Key concepts:**
- **TAM/SAM/SOM** — $2.76B global TAM by 2033; AUD $800M-1.2B AU SAM; 4K-8K Perth SOM (1-2% penetration).
- AI face-integration personalization, tiered pricing ($7.99-15.99 AUD), AR/VR multimedia formats.
- Customer hypotheses around digital-first conversion (15-25%) and premium add-on attachment (35-50%).
- A/B landing page framework.

**Connections to existing wiki:**
- **None.** Personalized children's books does not appear anywhere in `wiki/REVENUE-MAP.md` or any client/project page.

**Contradictions / tensions:** This research is orthogonal to Good AI's current 4-revenue-stream model. Either (a) Kev is exploring a new B2C revenue stream, (b) this is for a client engagement we don't have a wiki page for yet, or (c) it's speculative research that should sit in `sources/research/` without wiki commitment.

**Wiki recommendation:** Create `wiki/concepts/perth-childrens-books-opportunity.md` as a concept page with `revenue_impact: low` and `status: exploration`. **Review item:** Kev should flag whether to (a) pursue as new revenue stream → promote to REVENUE-MAP, (b) link to an unlisted client → create client page, or (c) demote to pure research and remove the concept page.

**Deep Research queries to schedule:**
- "Personalized children's books market Perth competitors 2026"
- "AI children's book generation legal/copyright Australia"

---

### 4. Context Packet R8 — `05122026-COP-R8-aptech-kismet-swarm.md`

**Now at:** `sources/packets/`

**Key entities:** AP Tech, Kismet, swarm orchestration, COP/Opus 4.6.

**Key concepts:** Context-packet pattern (4-layer Japanese compression L1-L4), rebuild protocol, R/K/Q/D scoring (8/8/8.5/12).

**Connections:** Joins the existing 8-packet series at `sources/packets/`. Cross-references `wiki/clients/kismet-finance.md` and `wiki/clients/ap-tech` (likely needs to exist — see review items).

**Wiki recommendation:** No standalone wiki page — context packets are session-handoff artifacts, not compiled knowledge. Already filed correctly in `sources/packets/`. Source summary in `wiki/sources/` for traceability.

---

### 5. Pre-Engagement AI Discovery SOP — `Pre-Engagement AI Discovery SOP.docx`

**Now at:** `sources/methodology/`

**Key concepts (inferred from filename + context):** Pre-sales qualification process, discovery scoping, complementary to the 5-day Discovery Framework (post-engagement).

**Connections:** Pairs with `wiki/frameworks/business-process-discovery.md`. Together they form the full sales→discovery→delivery pipeline.

**Wiki recommendation:** Source summary at `wiki/sources/pre-engagement-discovery-sop.md`. Cross-link to business-process-discovery framework. **Binary — text extraction deferred; flag for Kev to validate the summary against the docx contents.**

---

### 6. WA SME research — `WA SME.docx`

**Now at:** `sources/research/wa-sme/`

**Key concepts (inferred):** Western Australia SME landscape — likely sizing, segmentation, automation readiness. Supplements `sources/research/Australia AI Talent Gap Research.md` from the supply-side (workforce) with demand-side (SME buyers).

**Connections:** Feeds the funding pitch (`sources/pitches/GoodAI-Funding-Pitch-Apr2026.md`) and any go-to-market argument for KTG's WA-focused engagement.

**Wiki recommendation:** Source summary at `wiki/sources/wa-sme-research.md`. Cross-link to AI Talent Gap and funding pitch. **Binary — text extraction deferred.**

---

### 7. AI Education Platform Feasibility Study — `ktg - AI Education Platform Feasibility Study.docx`

**Now at:** `sources/pitches/`

**Key concepts (inferred):** Feasibility for KTG to launch an AI education / upskilling platform. Likely contains market sizing, curriculum sketch, delivery model, P&L.

**Connections:** Complements the AI Talent Gap research (demand for AI skills) by proposing a supply-side response. Potentially a fifth revenue stream not currently in `wiki/REVENUE-MAP.md`.

**Contradictions / tensions:** Education Platform is not in the current revenue model. Is this:
- A future revenue stream Kev is evaluating?
- A pitch deck for a partner / co-founder?
- Defunct exploration?

**Wiki recommendation:** Source summary at `wiki/sources/ktg-ai-education-platform-feasibility.md`. **High-priority review item:** Kev to decide whether to elevate to `wiki/projects/ai-education-platform.md` (new revenue stream) or leave as archived feasibility.

---

### 8. Good AI Competitive Analysis (April 2026) — `GoodAI-Competitive-Analysis-Apr2026.docx`

**Now at:** `sources/pitches/`

**Key concepts (inferred):** Competitive landscape for Good AI's market position. Pairs with the funding pitch deck.

**Connections:** Should update `wiki/REVENUE-MAP.md` competitor section and `wiki/good-ai.md` market position.

**Wiki recommendation:** Source summary at `wiki/sources/goodai-competitive-analysis-apr2026.md`. **Binary — text extraction deferred; Kev to confirm summary against doc.** Update REVENUE-MAP and good-ai.md with findings once extracted.

---

### 9. AP Tech NotebookLM slide deck — `NotebookLM_Export_2026-05-07T11-59-01.zip` (15 PNG slides, 16 MB)

**Now at:** `clients/AP-tech/ap-tech-slides/`

**Key entities:** AP Tech.

**Connections:** Pairs with the 7 NotebookLM markdown reports already at `clients/AP-tech/` and the 7-file zip (`notebooklm-export-2026-05-07.zip`) which is a **duplicate of those .md files** — archived.

**Wiki recommendation:** Source summary at `wiki/sources/aptech-notebooklm-slides.md`. Cross-link from `wiki/clients/` AP-Tech entry if one exists; if not, flag as review item to create one.

---

### 10. Optimine assets — `Optimine.zip` (PNG/JPG marketing imagery, ~25 files)

**Now at:** `assets/optimine/`

**Key entities:** "Optimine" — unknown provenance. Contains brand-style PNGs (`Optimine0-13`, CHAT.jpg) and AI-generated illustration of "a le_trader_doing_mining_repairs". Files dated April 2026.

**Connections:** None identifiable in current wiki.

**Wiki recommendation:** Source summary at `wiki/sources/optimine-assets.md` marked **REVIEW NEEDED**. Kev to identify: client engagement? side project? speculative brand exploration?

---

### 11. Parm Tjhungs assets — `Copy of Parm Tjhungs.zip` (PNG mockups, ~25 files)

**Now at:** `assets/parm-tjhungs/`

**Key entities:** "Parm Tjhungs" — appears to be a person/brand. Files are landing-page-style PNG mockups (Intro1-4, Hero1-6, testimony1) dated September 2025 — predates this vault's restructure.

**Connections:** No current wiki reference to Parm Tjhungs.

**Wiki recommendation:** Source summary at `wiki/sources/parm-tjhungs-assets.md` marked **REVIEW NEEDED**. Likely either an old client engagement or a partner's brand work. Kev to triage.

---

### 12. Professor Prompt code — `professor-prompt.ts.zip` (React + TS, Gemini API)

**Now at:** `assets/code/`

**Key entities:** "Professor Prompt" — a React/TypeScript tool that uses the Gemini API to refine user prompts. Contains: types.ts, constants/systemPrompt.ts, services/geminiService.ts, components (Header, LoadingSpinner, ApiKeyWarning, PromptInput, RefinedPromptDisplay). Dated August 2025.

**Connections:** Conceptually overlaps with `wiki/projects/legio-framework.md` (prompt engineering). Could be a precursor or a candidate widget for the broader LEGIO framework.

**Wiki recommendation:** Source summary at `wiki/sources/professor-prompt-code.md`. Cross-link to `wiki/projects/legio-framework.md`. Flag for Kev: is this still active, or has LEGIO superseded it?

---

### 13. Door Knocking Script — `Door Knocking Script.pdf`

**Now at:** `assets/sales/`

**Key concepts (inferred):** Field sales / door-to-door outreach script. Possibly Kismet-originated (door knocking is Kismet's primary lead-gen channel per `wiki/clients/kismet-finance.md`).

**Connections:** Pairs with `wiki/PIPELINE.md` outreach methods. May reference Kismet's 198-lead pipeline approach.

**Wiki recommendation:** Source summary at `wiki/sources/door-knocking-script.md` with cross-link to Kismet client page and PIPELINE.md.

---

### 14. DQ Form — `DQ Form.xlsx`

**Now at:** `clients/kismet-finance/`

**Key entities:** Kismet Discovery Question form — referenced in the workspace CLAUDE.md as `KISMET-DQ-Discovery-Calendar` (n8n workflow ID `pS6IMNpjXAi0I1ed`).

**Connections:** Direct to `wiki/clients/kismet-finance.md` and `wiki/projects/n8n-workflows.md` (DQ form intake is one of the workflows). Notion DB `0761ca2fe7bf4613822a57d96625863c` per workspace CLAUDE.md.

**Wiki recommendation:** Reference from `wiki/clients/kismet-finance.md` — no standalone wiki page needed (it's a live operational asset, not a knowledge artifact).

---

### 15. AP Technologies manufacturing-sites CSV

**Was at:** `clients/AP Technologies Group Global Manufacturing and Lea.csv` (loose in `clients/`)
**Now at:** `clients/AP-tech/ap-tech-research/`

**Key entities:** AP Tech sites — Singapore HQ, Bac Ninh Vietnam (China-plus-one hedge, opened Oct 2025), Xiamen China, Irvine California. Leadership: Charles Tang (CEO), Sean L. Tang (Strategy), Julia Leem (Finance), Till Vestring (NED), Mahbub Ahmed (Engineering, Xiamen), Russell Nagy (CCO, Irvine).

**Connections:** Direct to AP Tech client materials at `clients/AP-tech/`. Workspace CLAUDE.md notes AP Tech as a medical-device manufacturer with Charles as buyer, Ken as PDF sender.

**Wiki recommendation:** Reference from any future `wiki/clients/ap-tech.md`. No standalone wiki page — operational reference data.

---

### 16. Lee Monarc brand assets — `LEE-monarc/` folder

**Now merged at:** `clients/lee-monarch/assets/`

**Contents:** 6 brand PNGs (Asset 2-6), 2 JPGs, 3 PDFs (Leemonarc Invoice 01, domain registration invoice, leemonarc.com.au mockup).

**Connections:** Direct to `wiki/clients/leemonarc.md`. The pre-existing `clients/lee-monarch/` folder has `BRANDKITS-SPEC.md`, `LOGO.png`, `TASK.md`, `leemonarc.md` — the spec docs. This folder added the deliverables.

**Wiki recommendation:** Update `wiki/clients/leemonarc.md` to reference `clients/lee-monarch/assets/` as the deliverables location and `clients/lee-monarch/assets/Leemonarc - Invoice01.pdf` for billing status.

---

### 17. Automation Station — `automation-station/` folder

**Status:** **Left at root.** This is a self-contained, active sub-project (Docker Compose + n8n portable, with its own data/, workflows/, .env). Per the workspace pattern, sub-projects live at root with their own README.

**Key entities:** Docker, n8n (queue mode), n8n-mcp, claude-code-mcp.json.

**Connections:** Direct to `wiki/projects/n8n-workflows.md` (n8n is the delivery backbone). This is the **portable form factor** of that backbone.

**Wiki recommendation:** Create `wiki/projects/automation-station.md` registering it as a project. `revenue_impact: medium` — packaging for client deployment / portability.

---

### 18. Duplicate — `Australia AI Talent Gap Research.md`

**Status:** Byte-identical to `sources/research/Australia AI Talent Gap Research.md`. Loose copy archived to `archive/2026-05-25-loose-items/`. No further action.

---

## Cross-cutting Themes (entities/concepts that appear in multiple sources)

- **AP Tech** appears in: Process Discovery Framework (worked example), COP-R8 packet, NotebookLM slides + reports, manufacturing-sites CSV. **Recommendation:** Create `wiki/clients/ap-tech.md` if not present (verify against existing wiki/_projects-index).
- **Kismet** appears in: COP-R8, DQ Form, Door Knocking Script. Already has `wiki/clients/kismet-finance.md` — update with references to these new artifacts.
- **Discovery methodology** appears in: Business Process Discovery Framework + Pre-Engagement SOP. Together they're the front+back of the sales-to-delivery pipeline. **Recommendation:** Treat as paired entries in `wiki/frameworks/`.
- **AI talent / SME / education** triangle: AI Talent Gap Research + WA SME + AI Education Platform Feasibility together form a market-thesis cluster for KTG's possible new revenue arm. **Recommendation:** Group under a `wiki/concepts/ai-skills-thesis.md` umbrella (deferred — depends on Kev's read of the Education Platform doc).

## Contradictions & Tensions

1. **Education Platform vs current REVENUE-MAP** — feasibility study exists but no revenue stream is registered. Resolve by either (a) promoting to a project or (b) demoting to archived exploration.
2. **Perth children's books** — no traceable connection to Good AI's current model. Resolve by clarifying business intent.
3. **Optimine and Parm Tjhungs assets** — unknown provenance. Resolve via Kev's identification.

## Review Items (require human judgment)

| # | Item | Question |
|---|------|----------|
| R1 | Education Platform Feasibility | Promote to project page or leave archived? |
| R2 | Perth Children's Books | New revenue stream, client work, or pure research? |
| R3 | Optimine assets | What project? Whose? |
| R4 | Parm Tjhungs assets | Old client? Partner? Archive? |
| R5 | Professor Prompt code | Active or superseded by LEGIO? |
| R6 | AIANT framework | Monetize as methodology/training, or keep as internal IP? |
| R7 | AP Tech wiki client page | Does `wiki/clients/ap-tech.md` exist? If not, create. |
| R8 | Competitive Analysis (April 2026) | Needs docx text extraction to update REVENUE-MAP competitor section |
| R9 | WA SME docx | Needs text extraction to enrich the AI Talent Gap research cluster |
| R10 | Pre-Engagement SOP docx | Needs text extraction to fully connect to Business Process Discovery Framework |

## Deep Research Queries (to schedule)

1. Published model context degradation thresholds — Claude / GPT / Gemini 2026
2. AI discovery engagement pricing benchmarks — Australia 2026
3. Personalized children's books market — Perth competitors 2026
4. AI education platform business models — Australia
5. Process mining vs interview-based discovery — accuracy comparison
6. n8n portable / Docker Compose deployment patterns — enterprise client model

## Move Manifest

| From | To |
|------|-----|
| `Australia AI Talent Gap Research.md` (root) | `archive/2026-05-25-loose-items/` (duplicate) |
| `notebooklm-export-2026-05-07.zip` (root) | `archive/2026-05-25-loose-items/` (duplicate of clients/AP-tech/ files) |
| `022026-AIANT-2026-[ALL-TESTS].md` | `sources/research/aiant/` |
| `022026-AIANT-onboard[DO-THIS-FIRST].md` | `sources/research/aiant/` |
| `05122026-COP-R8-aptech-kismet-swarm.md` | `sources/packets/` |
| `GoodAI-Business-Process-Discovery-Framework.md` | `sources/methodology/` |
| `Market Demand Analysis.md` | `sources/research/perth-childrens-books/` |
| `GoodAI-Competitive-Analysis-Apr2026.docx` | `sources/pitches/` |
| `Pre-Engagement AI Discovery SOP.docx` | `sources/methodology/` |
| `WA SME.docx` | `sources/research/wa-sme/` |
| `ktg - AI Education Platform Feasibility Study.docx` | `sources/pitches/` |
| `NotebookLM_Export_2026-05-07T11-59-01.zip` | `clients/AP-tech/ap-tech-slides/` |
| `DQ Form.xlsx` | `clients/kismet-finance/` |
| `Door Knocking Script.pdf` | `assets/sales/` |
| `professor-prompt.ts.zip` | `assets/code/` |
| `Optimine.zip` | `assets/optimine/` |
| `Copy of Parm Tjhungs.zip` | `assets/parm-tjhungs/` |
| `LEE-monarc/*` | `clients/lee-monarch/assets/` (folder dissolved) |
| `clients/AP Technologies Group Global Manufacturing and Lea.csv` | `clients/AP-tech/ap-tech-research/` |
| `automation-station/` | **Unchanged** — left at root as active sub-project |

---

*Step 2 generated content lives in `wiki/sources/`, `wiki/frameworks/`, `wiki/concepts/`, and `wiki/projects/automation-station.md`. Navigation updates in `_index.md` and `wiki/_map.md`.*
