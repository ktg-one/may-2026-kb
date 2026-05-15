---
title: "AP Tech Friday Prep — Decomp + Validation + Questions"
date: 2026-05-12
purpose: Pre-meeting working file. Validates Plexity, decomposes Ken's PDF for gaps, classifies IP sensitivity, answers Microsoft-strictness question, lists ranked questions for Kev to ask before Friday.
status: research synthesis — Kev to review before client conversation
authored_by: Claude (independent research this time, not on Plexity rails)
tags: [aptech, friday-meeting, decomp, validation, ip-classification, charles-tang]
---

# Friday Prep — AP Tech Decomp + Open Questions

## 0. Headline answers (read this if nothing else)

**Q: Does Microsoft only work with Azure models?**
**A: No.** Microsoft Foundry (renamed from Azure AI Foundry) now hosts Claude Sonnet 4.5, Haiku 4.5, Opus 4.1–4.6 alongside GPT-5.x. Microsoft Agent 365 + Agent Framework explicitly supports Microsoft Foundry, Anthropic direct, Azure OpenAI, OpenAI, Ollama, and "more" — model is decoupled from agent identity/Teams surface. **One critical caveat for AP Tech**: Singapore-billed enterprise Azure accounts are currently *restricted* from using Claude inside Foundry — they would need to route Claude via direct Anthropic API or AWS Bedrock instead. Microsoft Agent 365 still binds the Entra-ID-backed identity and Teams surface regardless of where the model runs.

**Q: Does Foundry have all the models?**
**A: Effectively yes for global frontier.** Confirmed in SEA region (Microsoft Foundry, May 2026): GPT-4.1, GPT-4o, GPT-5, GPT-5-mini, GPT-5.1, GPT-5.2, GPT-5.2-codex, GPT-5.3-codex, computer-use-preview. Plus Claude (Opus 4.6, Sonnet 4.6, Haiku 4.5) via partnership — though see the Singapore-billing caveat. **Plexity's "GPT-4o is what's available" claim was a year stale.** What is NOT in Foundry: Qwen, DeepSeek, Chinese open-weights. Those need separate inference (SiliconFlow, Together, self-hosted).

**Q: What's so sensitive we can't share it, vs what's fine?**
**A: The purchasing system mostly handles Tier-2/3 data (supplier identities, pricing, lead times, material specs), not Tier-1 product IP (polymer formulations, OEM-specific designs, internal margin structure).** This means the Microsoft estate (with its enterprise data-handling commitments) is sufficient for the bulk of the purchasing workflow. The crown jewels (Tier 1) rarely flow through purchasing — when they do, they need masking or routing to a stricter pipeline. Full classification in §4 below.

**Q: How sensitive is the IP of ordering material vs the actual product?**
**A: An order of magnitude less.** A material PO for "PEBAX 72D, 0.062" OD, 50m, ISO 13485 certified" leaks "AP Tech makes catheters" (already public). The actual product IP — die geometry, validated extrusion parameters, tri-layer co-extrusion recipes, customer-specific tolerances — is the moat AGIC paid for. Purchasing data is sensitive enough to need RBAC, encryption-at-rest, and audit trail. It is NOT sensitive enough to need the maximum-sovereignty architecture I previously over-engineered.

---

## 1. Plexity Validation Report — What's Right, Stale, Wrong, or Unchecked

Independent web research run May 12, 2026. Compared every "validated fact" Plexity cited against current sources.

### Right (validated independently)

| Plexity claim | Independent confirmation |
|---|---|
| AP Tech SG HQ: 8 Buroh Street #03-06, JTC Surface Engineering Hub, Singapore 627563 | Confirmed via ap-tech.com/about/ — exact match |
| US: 9272 Jeronimo Road, Suite 101, Irvine CA 92618 | Confirmed via ap-tech.com/about/ |
| China: 2002 Wengjiaoxi Road, Haicang District, Xiamen 361028 | Confirmed via ap-tech.com/about/ |
| Vietnam: NX-7, lot CN1-2, Yen Phong Industrial Park, Bac Ninh | Confirmed via ap-tech.com/about/ |
| ISO 13485 certified, multiple Class 10K & 100K cleanrooms | Confirmed via ap-tech.com/about/ |
| 110,000+ sq ft across 4 manufacturing sites | Confirmed via ap-tech.com/about/ |
| AGIC Capital growth equity investment August 2023, AGIC $2.2B AUM | Confirmed via Business Wire (Aug 2023) |
| Charles Tang CEO & Co-Founder | Confirmed via Business Wire |
| Blue-chip customers in diagnostics, interventional cardiology, neurology, diabetic care | Confirmed verbatim from Business Wire |
| First AGIC Fund II Asia deal | Confirmed via Business Wire |

### Stale (Plexity worked off 2024–early-2025 data)

| Plexity claim | Reality (May 2026) | Why it matters |
|---|---|---|
| "Azure OpenAI GPT-4o PTU is live in Singapore as of January 2025" | GPT-5.3-codex (2026-02), GPT-5.2 (2025-12), GPT-5.1 (2025-11), GPT-5 (2025-08), GPT-4.1, GPT-4.1-mini/nano all available in `southeastasia` per Microsoft Learn | Recommending GPT-4o in May 2026 dates the proposal by a year. **GPT-5.x is the current default.** |
| "GPT-4.1 and newer models may not yet be available in SEA" | GPT-4.1, GPT-5, GPT-5.1/.2/.3-codex all confirmed available in `southeastasia` | Plexity hedged because Plexity didn't actually know. |
| Architecture defaults to Azure OpenAI as the reasoning layer | Microsoft Foundry now hosts Claude Sonnet 4.5/4.6, Haiku 4.5, Opus 4.1–4.6 via partnership announced Nov 2025. $30B Azure compute commitment from Anthropic. | Claude is now a first-class Foundry option — though see Singapore-billing caveat below. |
| "Azure China (21Vianet) requires Chinese Business License — AP Tech Xiamen holds it" | Still true legally, but missing context: Azure China is **architecturally disconnected** from Azure Global per Microsoft docs. Cross-region latency ~3× higher. **You can't actually run a "single" Microsoft tenant across both.** | Reinforces that Azure China is procurement of a separate stack — which weakens the "stay in Microsoft" rationale. Qwen self-hosted or via SiliconFlow likely cleaner. |
| SGD 175–250/hr solution architect rate | Current 2026 Robert Half data confirms SGD 145K–295K base, ~SGD 200K median — translates to SGD 175–300/hr for independents. Plexity's range is correct, slightly conservative on top end. | Pricing stands. |

### Wrong / Inaccurate

| Plexity claim | Reality | Correction |
|---|---|---|
| "AP Tech has Suzhou office" | **Not on ap-tech.com.** Official 4 sites: Singapore, Xiamen, Bac Ninh (Vietnam), Irvine. No Suzhou anywhere on company site. | Plexity likely confused with another medical contract manufacturer. **Drop all Suzhou references from the proposal.** |

### Unchecked (need direct verification before quoting in a client doc)

| Plexity claim | Status | How to verify |
|---|---|---|
| Tze Han Yap = Procurement Director, 25+ years supply chain | LinkedIn URL cited by Plexity but my web search didn't independently surface his profile. Likely correct (Plexity cited his LinkedIn directly) but should be Kev-verified before naming him in the proposal. | Kev can check LinkedIn directly tonight |
| Weihang W. = Sourcing & Procurement Manager, 11 years on **indirect** materials | Same as above. **The "indirect materials" detail is critical** — if true, Weihang is not the right pilot partner for a *direct* materials (medical polymers) purchasing automation. | Kev to confirm role + scope |
| Russell Nagy = CCO appointed 2026 | Sourced from vault, not validated against external press | LinkedIn check |
| Singapore EDG covers 50% — application takes 4–8 weeks | **Updated 2026 reality is bigger:** EDG funds up to 50% (70% for sustainability, 80% for certain core capabilities). **There's now a dedicated "AI Development Path" under EDG** per Budget 2026 (announced Feb 2026). PLUS: Enterprise Innovation Scheme (EIS) gives 400% tax deduction on up to S$50K AI spend per Year of Assessment for YA2027/YA2028 — separate from EDG, stacks on top. | Both confirmed via Singapore Budget 2026 sources |
| Chinese Business License for AP Tech Xiamen Co. Ltd. | Sourced from a Chinese BBS company-bio site (fobshanghai.com) — secondary source. **AP Tech absolutely operates legally in Xiamen** (their facility is there), but the specific entity name needs Kev to confirm with AP Tech's Legal/Finance. | Kev to ask AP Tech Legal/Finance during discovery |

---

## 2. Ken's PDF — Deep Decomposition (Where Plexity Was Thin)

Plexity validated the 9 requirements against Microsoft services but did NOT do a critical read of the PDF itself. Below are **gaps, contradictions, and silent assumptions** in Ken's 15-page document that should inform Friday's conversation.

### Gap 1: Module count mismatch — 7 modules vs 9 requirements

§4.2 lists **7 Core Modules** (Request Parser, Supplier Matcher, Communication Hub, Negotiation Engine, Follow-up Scheduler, Order Tracker, Conversation Logger). §4.4 lists **9 Requirements**. The mapping is implicit but not stated. Two requirements (operate dedicated email account + markdown retention) don't have dedicated modules — they're cross-cutting concerns. Worth confirming with Ken whether this was deliberate or a documentation slip.

### Gap 2: Phase 1 MVP scope contradicts the §4.4 Requirements Map

**§4.4 says Parallel Processing → Phase 1 (MVP).**
**§5.1 lists MVP deliverables: chat interface, internal DB integration, AI-drafted email generation, markdown logging, basic dashboard. NO parallel processing.**

The §5.1 description even says "drafts outreach emails for purchasing team approval" — singular implication. Parallel multi-supplier outreach is actually §5.2 (Phase 2).

So the PDF says Phase 1 will deliver KPI improvements that *depend on capabilities only built in Phase 2*. §5.5 targets "Phase 2: 5–7 days cycle time" — but Phase 1 alone, as scoped in §5.1, would not achieve that. **The PDF's ROI math doesn't close at the Phase 1 stage.**

**Implication for Friday:** Either parallel processing IS in MVP (and §5.1 needs to be updated), or MVP commits to a smaller cycle-time improvement than §5.5 implies. Both are defensible — but pick one.

### Gap 3: React frontend mismatch with Microsoft-365 reality

§4.3 Tech Stack lists "Frontend: React + TailwindCSS — Chat interface for engineers." But the vault's broader KTG architecture (and reality at AP Tech) puts everyone in Microsoft Teams every day. A separate React app means:
- New login for 70+ engineers
- New IT security review
- New training program
- New maintenance surface
- Adoption risk (engineers won't switch from Teams)

This is exactly the kind of detail that signals the PDF author was working from a generic template rather than from AP Tech's daily-work surface.

**Implication for Friday:** Confirm Teams as the front door. The proposal can drop React entirely and use Microsoft Agent 365 + Power Apps / Teams adaptive cards.

### Gap 4: "Markdown in Git repo or S3" — S3 reference is non-Microsoft

§4.3 lists "Markdown files in Git repo or **S3**" for conversation logging. S3 is AWS, not Microsoft. For a client whose existing stack is Microsoft 365 + (presumably) Azure, suggesting S3 is a tell that the PDF was written from a generic template. The right answer is Azure DevOps Git OR SharePoint document library OR Azure Blob Storage. Drop the S3 reference entirely.

### Gap 5: §3.3 Cost of Inaction is qualitative only — no numbers

For a company with $50–66M revenue, 70+ engineers, 100+ NPI programs, and 30+ emails per PO, the dollar cost of the current state should be quantifiable. The PDF says "purchasing staff spend the majority of their time on low-value relay work" but doesn't compute:

- If Purchasing is 5 FTEs at SGD 80K loaded cost, and 60% is relay → ~SGD 240K/year on relay work alone
- If 70 engineers each lose 30 min/day on PO chasing × 250 days × SGD 150/hr loaded → ~SGD 1.31M/year of engineering time on procurement back-and-forth
- 2-week cycle delays per PO × (PO volume) × OEM penalty exposure → unknown but plausibly S$M

**Implication for Friday:** Charles will want a number. We don't have it. **Question to ask Ken: how many POs does AP Tech process per month? What's the average value? What's the current Purchasing team headcount?** This is the single most important answer for justifying the "name your price."

### Gap 6: §6 Risk table is missing 5 substantive risks

The PDF lists 5 risks but omits:

1. **OEM IP leakage via PO content.** Material specs for a Class III neurology catheter could be reverse-engineered to identify the OEM and product. Who sees the AI's view of supplier comms? RBAC by program? By customer?
2. **Adversarial PO injection.** What stops a malicious actor (internal or external) from submitting a forged PO request via the chat interface? Authentication is engineer-level — is approval gating tight enough?
3. **AI hallucinating supplier capabilities.** Different from "AI sends wrong specs to supplier." This is AI inventing a non-existent supplier or misattributing capabilities (e.g., claiming Supplier X is ISO 13485 when they are not).
4. **Cost overrun on Azure OpenAI / Foundry tokens.** GPT-5.x at scale on a busy purchasing workflow could blow out monthly Azure consumption. Need budget alerts + monthly review.
5. **Change-of-control on `purchasing-ai@aptech.com` mailbox.** What happens if KTG disengages? If Ken leaves AP Tech? Mailbox-as-dependency is a real risk for a regulated business.

### Gap 7: Material category ambiguity — direct / indirect / capital

The PDF treats "material purchase" generically. In a medical-device CDMO, three procurement processes coexist with very different rules:

- **Direct materials** (PTFE, FEP, PEEK, Pebax, Nitinol — the polymers / metals that go INTO the catheter). Tight tolerance specs, ISO 13485 supplier qualification, biocompatibility validation. Slow, careful procurement.
- **Indirect materials** (cleanroom consumables, packaging, MRO — gloves, gowns, swabs, lubricants). Higher volume, faster cycle, less regulated.
- **Capital equipment** (extruders, braiders, ovens). One-off, high-value, long-cycle.

**If Weihang W. has 11 years on *indirect* materials, the pilot scope of "purchase request automation" is naturally biased toward indirect.** That's actually a GOOD thing for a pilot — lower regulatory risk, higher PO volume, faster feedback loops. But Ken should confirm whether the Mar 2–17 example was direct or indirect.

### Gap 8: The "internal supplier database" is referenced but not specified

§5.1 says "Integration with AP Tech's internal approved supplier database." This assumes one exists in a queryable form. What if:
- It's in their ERP (which ERP? SAP? NetSuite? AX/D365? Local Singapore vendor?)
- It's an Excel sheet maintained by Procurement
- It's in QMS (which QMS?)
- It's split across sites (Singapore vs Xiamen ASLs may differ)

**Question for Kev to ask:** What system holds the Approved Supplier List today? Where does Weihang or Tze Han go when they need to find an approved vendor?

### Gap 9: No change management plan

70+ engineers across 4 sites need to adopt a Teams bot they have never used. The PDF has zero pages on:
- Site champion model
- Pilot user cohort selection
- Adoption metrics
- Training program
- Stakeholder communication
- Rollout sequencing

The KTG broader vault (`APTech-Centralized-Intranet-Architecture.md` §Phase 2) covers this for the intranet project. The purchasing proposal should reference / inherit that change management framework.

### Gap 10: KPI "tracking error rate" is undefined

§5.5 says "Tracking error rate: High → Near zero" but never defines what counts as a tracking error. Lost POs? Wrong delivery dates? Duplicate POs? Missed acknowledgements? Without a definition, this KPI is unmeasurable — therefore the Phase 1 pilot guarantee can't be enforced on it.

**Implication:** In the v2 proposal, tighten "tracking error" to a specific definition (e.g., "POs where status in system ≠ actual status at supplier, measured weekly by spot-check audit").

### Gap 11: §7 numbering jumps from 5 to 6–10

Small editorial slip but suggests the PDF was assembled in haste from sections written separately. Not a substantive issue.

---

## 3. Categorized Information

### A. Confirmed facts (use freely in any client doc)

- Company: AP Technologies Group Pte Ltd (Singapore-registered)
- Founded: 2013 by Charles Tang
- Business: Precision medical catheter and tubing CDMO; vertically integrated (compounding → extrusion → braiding → assembly → packaging)
- Sites (4): Singapore HQ + R&D | Irvine Catheter Lab | Xiamen high-volume hub | Bac Ninh (Vietnam) tariff-hedge
- Footprint: 110,000+ sq ft, multiple ISO Class 7 + Class 8 cleanrooms
- Tolerances: down to ±0.0003″, wall thicknesses 0.0005″
- Certifications: ISO 13485:2016
- Customer base: blue-chip OEMs in diagnostics, interventional cardiology, neurology, diabetic care
- Investor: AGIC Capital, growth equity Aug 2023, first Fund II Asia deal, AGIC AUM $2.2B
- Leadership: Charles Tang (CEO, Co-Founder), Sean L. Tang (Strategy & Tech), Russell Nagy (CCO appointed 2026), Till Vestring (NED, former Bain SEA MP)
- Regulatory horizon: FDA QMSR effective 02 Feb 2026 (incorporates ISO 13485:2016); CSA (Computer Software Assurance) effective 03 Feb 2026
- Current pain (their evidence): 30+ emails per PO, 2-week cycle (Mar 2 → Mar 17)

### B. Assumed / inherited from Plexity (NOT independently verified)

- Tze Han Yap as Procurement Director with 25+ years (LinkedIn-cited by Plexity)
- Weihang W. as Sourcing & Procurement Manager with 11 years (LinkedIn-cited by Plexity)
- AP Tech Singapore entity having 30%+ local shareholding (required for EDG eligibility — AGIC is European-Asian PE, the % held by Charles Tang and other locals matters here)
- AP Technologies (Xiamen) Co., Ltd. as the China entity with active Chinese Business License (BBS-source, secondary)
- Suzhou office — **this one's actually wrong**, drop it entirely

### C. Unknown — need to ask AP Tech

The 12-question list is in §6 below.

---

## 4. IP Sensitivity Classification — for the Architecture Conversation

### Tier 1 — Crown jewels (rarely flow through purchasing)

- Polymer compounding formulations (custom blends for specific OEM products)
- Validated extrusion parameters (die geometry, temperature profiles, pull speeds)
- Tri-layer co-extrusion process IP
- PTFE etching process IP (one of their stated differentiators)
- Customer-specific product designs (OEM IP held under NDA)
- Internal margin structure / cost breakdown

**Architecture implication:** Should never enter the AI reasoning loop unmasked. RBAC at the supplier-comms layer should prevent the AI from seeing OEM-attributable specs without masking.

### Tier 2 — Highly sensitive (regulated / competitive)

- Approved Supplier List (their vetted vendor base is a competitive moat)
- Supplier-specific pricing and contract terms
- Quality test results (CoAs, biocompatibility data)
- Production schedules cross-referenced with customer programs
- Tariff routing data (which products via Vietnam, which via China)

**Architecture implication:** Microsoft Foundry / Azure OpenAI with enterprise data-handling commitments (no training on customer data, in-tenant processing) is sufficient. Equivalent assurances available from Claude direct, Bedrock, or Vertex. RBAC + audit trail required.

### Tier 3 — Operationally sensitive

- Material specs (generic — PEBAX grade, OD/ID, tolerance class)
- PO quantities, lead times, delivery dates
- Supplier communication content (mostly transactional)
- Routine engineering specs (non-customer-attributable)

**Architecture implication:** This is the bulk of what the purchasing system processes. Any enterprise-grade model with standard data handling is fine. Don't over-engineer.

### Tier 4 — Public / low sensitivity

- General process descriptions
- Publicly-available capabilities (per ap-tech.com)
- Vendor outreach where the supplier already knows you're a medical CDMO

**Architecture implication:** Could even run on a public-API model with standard rate-limit and abuse protection. But there's no operational reason to mix tiers — keep everything at Tier 2-3 controls for simplicity.

### Cross-tier: "Spec aggregation" attack surface

A single PO line is Tier 3. **A pattern of POs** (this customer's program getting X material in Y quantity at Z timing for 6 months running) crosses into Tier 1 territory by inference. Implication: **logs and analytics need RBAC; the AI itself can see individual POs in context but aggregated cross-program views must be gated to specific roles.**

### How this answers the Microsoft-strictness question

**The Microsoft estate is sufficient for Tier 2-3 data, which is 95%+ of the purchasing workflow.** You don't *need* a separate maximum-sovereignty pipeline for purchasing. What you need is:

1. **One frontier model** (Claude Opus 4.6 or GPT-5.x) for spec parsing, supplier matching, draft generation — running anywhere with enterprise data assurances.
2. **One Chinese-language model** (Qwen 3.5 self-hosted or via SiliconFlow) for the Chinese supplier sourcing branch — driven by PIPL jurisdictional requirements, NOT by IP sensitivity.
3. **One observability/audit layer** that satisfies ISO 13485 Clause 7.5 traceability + FDA QMSR audit-trail.

The asymmetric architecture isn't about Tier 1 vs Tier 2 — it's about jurisdictional law (PIPL) for the Chinese branch. That's a much narrower and more honest justification.

---

## 5. Strict-Microsoft vs Modular — the Real Decision Frame

| Dimension | Strict Microsoft (Azure-only) | Modular (Microsoft for UX, best-tool-per-task underneath) |
|---|---|---|
| Engineer / Purchasing UX | Teams via Agent 365 ✓ | Teams via Agent 365 ✓ — identical |
| Identity / RBAC | Entra ID ✓ | Entra ID ✓ — identical |
| Reasoning model (SG side) | Azure OpenAI GPT-5.x in `southeastasia` | Either GPT-5.x OR Claude Opus 4.6 via Anthropic direct/Bedrock (depending on task) — **caveat: Claude in Foundry currently restricted for SG-billed enterprise accounts** |
| Reasoning model (CN side) | Azure China + Azure OpenAI (separate tenant) | **Qwen 3.5 self-hosted in Xiamen OR via SiliconFlow** — better Chinese, cheaper, faster deploy, no 2-4 week tenant setup |
| Data sovereignty | Azure China PIPL compliance via 21Vianet | Qwen self-hosted in AP Tech infra = stricter than Azure China. Or SiliconFlow with PIPL-compliant terms. |
| Procurement story | "Everything in Microsoft" — simpler for IT, weaker for Chinese-language performance | "Microsoft for what Microsoft is best at (UX, identity, M365 surface). Best-of-breed underneath." — stronger technical story for a Chinese founder |
| Lock-in | High (single vendor) | Lower (model swap is a config change, not a re-architecture) |
| Cost (per token) | Foundry billing | Anthropic / Bedrock / SiliconFlow can be cheaper per-task — depends on volume |

**My take: modular wins.** And it wins specifically *because* Charles is a Chinese founder building a vertically-integrated CDMO. He understands the value of picking the right tool for each region. Telling him "Microsoft for global ops, Qwen for Chinese ops, Claude for the reasoning that matters" is a stronger pitch than "everything Microsoft" — especially given that "everything Microsoft" has known performance gaps in Chinese-language tasks.

The Strict-Microsoft path is defensible for the broader engagement (intranet, document control) where Microsoft IS the best tool. For purchasing specifically, modular is technically superior.

---

## 6. Ranked Questions for Kev to Ask AP Tech Before Friday

Ranked by what unlocks the most material change in the proposal.

### Tier 1 — Must-have before Friday

**Q1. PO volume and value.**
"How many POs does AP Tech process per month, across all sites? What's the average PO value? What's the current Purchasing team headcount, and what % of their time goes to relay work today?"
*Why: this is the only way to compute the ROI Charles will demand. Without this, "name your price" is guesswork on both sides. If we know PO volume × time saved × loaded cost, we can quote with confidence.*

**Q2. Which materials does the pilot target — direct, indirect, or capital?**
"The Mar 2–17 example PO — was that a direct material (medical polymer / catheter component) or an indirect material (cleanroom consumable / MRO)? Which category does AP Tech feel highest cycle-time pain on right now?"
*Why: changes the regulatory profile (direct = ISO 13485 supplier qualification, biocompatibility, FDA-touchpoint), the supplier base (1688 medical-grade ≠ 1688 industrial-grade), and the right pilot partner (Weihang on indirect vs Tze Han on strategic direct).*

**Q3. Which site originated the Mar 2–17 example?**
"Was that PO from the Singapore HQ, Xiamen, Bac Ninh, or Irvine? Are the cycle-time numbers similar across sites or worse at one?"
*Why: determines whether Chinese-language sourcing is Phase 1 urgency (Xiamen-origin) or Phase 2 (SG/US-origin). Affects whether the Qwen vs Microsoft architecture decision is critical-path or deferrable.*

**Q4. Where does the Approved Supplier List actually live?**
"What system holds AP Tech's approved supplier list today — an ERP (which one?), an Excel sheet maintained by Procurement, the QMS, or something else? Is it the same list across all 4 sites or are there site-specific variants?"
*Why: determines whether Week 1 of the pilot is "API integration" or "CSV import + cleanup." Drives the Phase 1 timeline and risk.*

**Q5. What ERP do they run?**
"Which ERP system is AP Tech on (SAP / NetSuite / Oracle / Microsoft Dynamics / local SG vendor)? Same instance across all sites, or different per site?"
*Why: ERP integration is in Phase 3, but knowing now informs whether the Phase 1 supplier DB connection is "we read from your ERP's vendor module" vs "we maintain a parallel cleaned vendor list." Different cost, different risk.*

### Tier 2 — Highly valuable if we get them

**Q6. Singapore EDG eligibility check.**
"What's AP Tech Singapore's current shareholding split (30% local minimum required)? Are you already on EDG / EDGE for any current initiative, or would this be a new application?"
*Why: EDG up to 50% offset + EIS 400% tax deduction = the difference between SGD 146K and SGD ~73K out-of-pocket. Plus another ~SGD 50K tax saving on top via EIS. Material for the "name your price" conversation.*

**Q7. Charles's actual priority.**
"When Charles looks at the broader KTG engagement (purchasing + intranet + 10-process automation), what's his current #1? Is it purchasing because Ken pushed it, or is there something higher up the priority list that we should be sequencing first?"
*Why: "name your price" might apply to a different thing than the proposal we're sending. Don't price for purchasing if the actual urgency is the Monday Morning Narrative or the QMS automation.*

**Q8. Existing supplier email handling.**
"Today, when Purchasing sends an email to a supplier, what mailbox is it from? Is there an existing shared inbox (`procurement@aptech.com`)? Who has access? Are emails CC'd to a fixed list for compliance?"
*Why: determines whether `purchasing-ai@aptech.com` is a new mailbox to provision, or a wrapping of an existing flow. Affects Phase 1 Week 1 timeline + supplier-side perception.*

**Q9. Singapore-billed Azure account status.**
"Does AP Tech's Azure subscription billing entity sit in Singapore, or elsewhere (HK, Cayman, US-Irvine entity)? Microsoft currently restricts Claude-in-Foundry for SG-billed enterprise accounts."
*Why: changes the model-routing architecture. If SG-billed, Claude has to come via Bedrock or Anthropic direct. If billed elsewhere, Claude in Foundry is open.*

### Tier 3 — Nice to know but not blocking

**Q10. Engineer cohort buy-in.**
"Who are 2–3 engineers most frustrated by the current PO process? Best pilot candidates are the most-annoyed, not necessarily the most senior."
*Why: pilot engineer selection affects adoption velocity. Save for the kickoff call rather than pre-Friday.*

**Q11. M365 license SKU at AP Tech.**
"What M365 SKU does AP Tech run — E3, E5, or M365 Frontier? Are M365 Copilot seats already provisioned for any users?"
*Why: M365 Frontier (new May 2026) includes Copilot agents and some Foundry features at the user level. Could change the build-vs-license calculus on a few components.*

**Q12. Existing Power Platform / n8n usage.**
"Is AP Tech already using Power Automate or n8n anywhere internally? Any existing workflows we should know about so we don't conflict?"
*Why: avoids stepping on existing automation. Mostly hygiene.*

---

## 7. What to Recommend on Friday — and on Price

### Architecture recommendation

**Modular asymmetric:**
- **Engineer / Purchasing UX**: Microsoft Teams + Microsoft Agent 365 (Entra-ID identity)
- **Singapore-side reasoning**: Claude Opus 4.6 (via Anthropic direct or Bedrock, given SG-billing caveat for Foundry-routed Claude) for spec parsing and draft generation. GPT-5.x available as fallback.
- **China-side reasoning**: Qwen 3.5 self-hosted in Xiamen (preferred — strictest sovereignty, AP Tech engineering can own) OR via SiliconFlow (faster Phase 2 deploy, PIPL-compliant)
- **Orchestration**: n8n self-hosted (your canonical position) + Power Automate for M365-native flows
- **Identity / RBAC**: Entra ID
- **Data layer**: Azure DB for PostgreSQL + pgvector, in `southeastasia` region
- **Logging / audit**: Azure DevOps Git for markdown PO logs, IRM-protected SharePoint mirror for compliance discovery

### Pricing posture for "name your price"

Charles told you to name your price. That's a tell that he's already decided you're doing the work. The temptation is to anchor low because you're flattered. **Don't.**

The Plexity-calibrated SGD 146.5K full programme is a defensible floor for the **purchasing module only**. But the broader engagement in your vault is S$195–295K (10 processes, 4 sites, intranet platform). Charles is asking the price for the **relationship**, not for one module.

Three pricing options to walk in with:

| Tier | Scope | Quote | Why |
|---|---|---|---|
| **A — Conservative** | Purchasing module only (Phases 1–3) | SGD 106.5K (Plexity calibration minus Phase 4) | Anchors to Ken's spec exactly. Lowest-risk to win the deal. Lowest ceiling on revenue. |
| **B — Recommended** | Purchasing module (Phase 1–4) + paid Discovery for the broader 10-process engagement | SGD 146.5K + SGD 35K Discovery = **SGD 181.5K** | Earns the right to scope the rest. Phase 4 stays in. Discovery is paid, structured, and converts into the bigger SOW with high probability. |
| **C — Aggressive** | Full broader engagement (10-process automation + intranet platform + purchasing) bundled, milestone-priced | **SGD 250K–295K** (matches your vault SOW) | If Charles is genuinely saying "name your price for the relationship," this is the right number. Higher risk Friday; bigger payoff. EDG + EIS bring his effective out-of-pocket to ~SGD 125–148K which is reasonable for a $50–66M revenue company. |

**My recommendation: Quote B as the headline, with C as the "and if you want the full picture, here's what's also on the table" option.** A is too small for the signal Charles sent.

### What to bring to the meeting

1. **The .docx proposal v2** — but updated to fix the stale GPT-4o references and the Suzhou error. I can do that revision pass in 20 minutes once you confirm the modular architecture call.
2. **A 1-page "before vs after" visual** — Mermaid diagram of current state vs proposed state. Existing in the markdown companion.
3. **The IP sensitivity classification (§4 above)** — printed or in the deck. Charles will appreciate that you've thought about what's actually sensitive vs what's just operational.
4. **A ROI sheet** — once Kev gets the answer to Q1 (PO volume), I can build a 1-page sensitivity table: hours saved × loaded cost × 3 PO-volume scenarios (low/mid/high) → annualised savings.
5. **The question list** — show Charles you're not pretending to know what you don't know. Senior operators value this. Counter-intuitively, it's how you earn the higher price.

---

## 8. Open decisions for Kev before we finalize

- [ ] Architecture call: modular asymmetric (my recommendation) vs strict-Microsoft (your prompt's frame) — confirm
- [ ] Pricing tier: A / B / C / something else
- [ ] Do we get answers to Tier-1 questions (Q1–Q5) before Friday, or do we walk in and ask them live?
- [ ] Do you want me to revise the v2 .docx with: stale-fact fixes (drop Suzhou, swap GPT-4o → GPT-5.x or Claude Opus 4.6), modular architecture, and updated EDG / EIS framing?
- [ ] Do you want a 1-page "Friday meeting one-sheeter" — the briefing distilled to a single page Kev can have in front of him during the call?

---

## Sources (independent research, May 12, 2026)

- [Microsoft Foundry — region availability for foundry models](https://learn.microsoft.com/en-us/azure/foundry/foundry-models/concepts/models-sold-directly-by-azure-region-availability)
- [What's new in Microsoft Foundry — March 2026](https://devblogs.microsoft.com/foundry/whats-new-in-microsoft-foundry-mar-2026/)
- [Claude now in Microsoft Foundry and M365 Copilot — Anthropic announcement](https://www.anthropic.com/news/claude-in-microsoft-foundry)
- [Microsoft + NVIDIA + Anthropic strategic partnership — NVIDIA blog](https://blogs.nvidia.com/blog/microsoft-nvidia-anthropic-announce-partnership/)
- [Deploy and use Claude models in Microsoft Foundry — Microsoft Learn](https://learn.microsoft.com/en-us/azure/foundry/foundry-models/how-to/use-foundry-models-claude)
- [Microsoft Agent 365 SDK overview](https://learn.microsoft.com/en-us/microsoft-agent-365/developer/agent-365-sdk)
- [Microsoft Agent Framework overview](https://learn.microsoft.com/en-us/agent-framework/overview/)
- [AP Technologies — About / Locations](https://www.ap-tech.com/about/)
- [AGIC Capital growth equity investment in AP Technologies — Business Wire Aug 2023](https://www.businesswire.com/news/home/20230809694705/en/AGIC-Capital-Completes-Growth-Equity-Investment-into-AP-Technologies)
- [Singapore Budget 2026 — AI grants for SMEs](https://terris.sg/blog/singapore-budget-2026-ai-grants-sme)
- [EDG, PSG, MRA, EDGE consolidation — 2026](https://rafflescorporateservices.com/edge-grant-singapore-2026-edg-psg-mra-guide/)
- [EDG eligibility 2026](https://sageshield.com/edg-grant-eligibility-singapore/)
- [Alibaba Qwen 3.5 release — CNBC Feb 2026](https://www.cnbc.com/2026/02/17/china-alibaba-qwen-ai-agent-latest-model.html)
- [China PIPL 2026 enforcement update — China Briefing](https://www.china-briefing.com/news/china-personal-information-protection-enforcement-2026/)
- [China data laws 2026 — Klea Legal](https://klealegal.com/newsroom/china-data-laws-2026-key-changes)
