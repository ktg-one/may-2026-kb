---
title: "AP Tech — Phase 1 & 2 Brainstorm"
prepared_for: Kev (KTG)
prepared: 2026-05-08
status: PRE-SPEC (Charles has not provided written specs yet — assumptions explicit)
companion_docs: 02_phase1_supplier_chatbot_spec.md, 03_phase2_email_compliance_spec.md, 04_process_flows.md
---

# Phase 1 & 2 — Brainstorm

> Goal of this doc: surface real intent, lock down assumptions, and put alternative architectures on the table BEFORE Charles sends his version of the specs. When the specs land, they collide with this doc instead of a blank page.

## 0. Why these two first

Charles flagged "process automation" and "centralised intranet" on WhatsApp. The two phases he's now asking about — **Supplier Response Chatbot** + **Email Compliance / Leakage Scanner** — translate those into concrete starter wedges:

| Stated WhatsApp ask | Phase 1 (chatbot) | Phase 2 (compliance bot) |
|---|---|---|
| Process automation | Tier-1 supplier comms autoresponse → ops time reclaimed | Leakage scan reduces manual email review by QMS |
| Centralised intranet | Bot is the supplier-facing surface of unified data (ERP × QMS × portal) | Audit trail seeds the centralised compliance evidence base |

**Strategic read:** these are also the two safest pilots. Supplier-facing chatbot is **outside the regulated production loop** (low QMSR risk). Email DLP is **defensive, not generative** (low IP risk). Charles is doing the right thing — easing in with bounded scope before AI touches anything that ships into a catheter.

---

## 1. Real intent (what we think Charles is actually buying)

**Phase 1 — Supplier Chatbot**
- *Stated:* "respond to suppliers."
- *Likely real:* reduce procurement / supply-chain headcount drag. AP runs ~100 concurrent NPI projects across 4 sites — supplier touchpoints scale linearly. Status pings, COA forwarding, lead-time chasing are tier-1 noise eating 20-40% of buyer time.
- *Win condition:* a buyer in Singapore opens Outlook on Monday, sees 80% fewer threads they have to personally respond to, and the 20% they do touch are the ones that matter (price, NCR, escalation).

**Phase 2 — Email Compliance Scanner**
- *Stated:* "scan emails for leakages."
- *Likely real:* multi-layered. (a) protect customer IP — they have blue-chip MedTech OEMs whose drawings, tolerances, and program details are contractually confidential; (b) protect internal IP — extrusion parameters, PEBAX/PEEK rheology curves are the moat; (c) ITAR/export-control posture (Irvine site changes the calculus); (d) pre-empt a future audit finding under FDA QMSR records-control expectations.
- *Win condition:* an outbound email containing a customer's drawing pack to a non-customer domain gets held + reviewed within minutes, not discovered six months later.

---

## 2. Assumptions to validate with Charles (read these aloud on a follow-up)

If any of these are wrong, the architecture shifts. Flag them explicitly when responding to Charles.

| # | Assumption | If wrong, impact |
|---|---|---|
| A1 | Email stack is **Microsoft 365** (Outlook + Teams), not Google Workspace | Re-platform from Purview/Graph to Google DLP/Apps Script |
| A2 | Suppliers contact AP via **email primarily**, with some Teams / WeChat (Xiamen) | If WeChat is dominant, need a separate ingest path |
| A3 | ERP = **SAP B1 / Microsoft Dynamics / NetSuite** (CDMOs at AP's scale typically use one of these) | API surface for status lookups changes |
| A4 | **No existing chatbot platform** in production (Copilot Studio, Intercom, Drift) | If Copilot Studio is licensed, Phase 1 build accelerates ~2 weeks |
| A5 | **Sean Tang owns QMS**; he's the reviewer for compliance escalations | Reviewer role moves elsewhere if not |
| A6 | **No US persons handling ITAR-controlled tech** at SG/Xiamen/BN sites; Irvine handles US-restricted programs only | Bigger blast radius if ITAR data moves between sites |
| A7 | **Singapore PDPA** is the binding privacy regime for employee email scanning; Vietnam, China, US handled per local rules | Need country-specific scanning posture (China especially restrictive) |
| A8 | **Procurement / supply chain has < 10 buyers globally** | Headcount changes ROI math materially |

---

## 3. Phase 1 — three architectural approaches (with trade-offs)

| | A. M365-Native (Copilot Studio + Power Automate) | B. Custom LLM + n8n | C. Hybrid (recommended) |
|---|---|---|---|
| **Build speed** | 2-3 weeks to pilot | 6-8 weeks to pilot | 4-5 weeks to pilot |
| **IP control** | Medium (Microsoft tenancy, but data crosses Copilot service) | High (closed-LLM on-prem or in your tenancy) | High (custom LLM for understanding, M365 for transport) |
| **Cost (build)** | S$15-25K | S$45-65K | S$30-45K |
| **Cost (run)** | M365 license uplift only (~S$10/seat/mo Copilot) | Compute: ~S$2-4K/mo for vLLM-hosted Qwen-72B equiv | Compute: ~S$1-2K/mo |
| **Audit trail** | Native M365 logs | Build it yourself | Custom logs + M365 envelope |
| **Risk if Charles hates it** | Easy to retire (it's just Power Automate flows) | Harder — sunk infra | Medium |
| **Best for** | Fastest "yes/no" on whether bot pattern works at AP | Long-term IP-heavy answer | Pilot + path to scale |

**Recommendation:** **C — Hybrid**, scaffolded as A first. Ship Copilot Studio MVP in 3 weeks. If retention metrics are real, swap the brain to a closed-LLM in weeks 5-8 without disturbing the supplier-facing surface. This is the "ship velocity that respects Charles's time, optionality that respects his IP" play.

---

## 4. Phase 2 — three architectural approaches

| | A. M365 Purview-only | B. Custom LLM Classifier | C. Layered (recommended) |
|---|---|---|---|
| **Coverage** | Good on regex/dictionary patterns (CC, SSN, doc IDs) | Excellent on context (customer-IP leak detection) | Both |
| **False-positive rate** | High on names/numbers; misses context | Lower on context, higher on novel patterns | Lowest in aggregate |
| **Latency** | Real-time block possible | 200-800ms classifier; usually post-send hold | Real-time deterministic block, async LLM hold |
| **Build speed** | 3-4 weeks (mostly policy tuning) | 6-10 weeks | 5-7 weeks |
| **Cost (build)** | S$15-25K | S$50-75K | S$35-55K |
| **Cost (run)** | Purview/E5 license | LLM compute ~S$1-3K/mo | Both |
| **QMSR audit posture** | Mature, well-documented | Needs governance wrapper | Strongest (you control the logs) |

**Recommendation:** **C — Layered**, where M365 Purview handles deterministic patterns (no LLM token spent on credit cards) and a custom classifier handles context-aware judgments ("Is this drawing pack going outside the customer's domain?"). This is also the cleanest QMSR story.

---

## 5. Open questions to send Charles after this call

Pack them into one short email — **don't drip them out**. Ten questions max.

**Phase 1 (Supplier Chatbot)**
1. What ERP / supply-chain system are buyers in today? (Dynamics? SAP B1? NetSuite?)
2. What's the volume — emails/day from suppliers, globally?
3. Do you want bot replies to go out **on a buyer's behalf** (signed as Jane), **as the bot** (signed as "AP Procurement Desk"), or **draft-only** (buyer hits Send)?
4. Languages — English only? Mandarin? Vietnamese?
5. Are there suppliers under exclusivity / NDA where the bot must NEVER respond automatically?

**Phase 2 (Email Compliance)**
6. Outbound only, or both directions?
7. Is M365 E5 / Purview already licensed, or do we need to plan around E3?
8. What's the most painful past leakage story — a real one we can use as a "did this happen" benchmark? (his story will tell us what severity bands matter)
9. Are there programs flagged as **ITAR / EAR-controlled** today, and which sites touch them?
10. Who reviews flagged emails — Sean's QMS team, IT, or a new role?

---

## 6. Success criteria — first draft (negotiate with Charles before locking)

**Phase 1 — exit at end of 90 days if all four hit:**
- ≥ 60% of inbound supplier emails handled tier-1 without buyer touch (auto-reply + close)
- Median response time for tier-1 < 5 minutes (was hours/days)
- Zero ISO 13485 §7.4 audit findings tied to supplier comms
- Net buyer time reclaimed ≥ 30 hours/week across the team

**Phase 2 — exit at end of 90 days if all four hit:**
- True-positive rate ≥ 90% on Sean's seeded test corpus (50 known-leak emails)
- False-positive rate ≤ 5% on randomly sampled production traffic
- 0 leak incidents reaching customer/regulator notification post-deploy
- Audit-ready evidence pack generated automatically every quarter (QMSR §820.180-aligned)

---

## 7. Risks Charles will (rightly) push on

| Risk | Phase | Mitigation we can name on the call |
|---|---|---|
| Hallucinated supplier reply (wrong lead time, wrong COA) | 1 | Bot **never invents** — every fact grounded in ERP/QMS lookup or it routes to human. Closed retrieval, not free generation. |
| Supplier confusion / brand damage | 1 | Phased rollout: tier-1 questions only (status, doc retrieval), human handoff for anything else. Bot signs as "AP Procurement Desk", not impersonating a buyer. |
| Over-blocking emails, productivity revolt | 2 | Start in **nudge mode** (warns sender) for 30 days before any block. Severity bands tuned weekly. |
| Employee perception of surveillance | 2 | Frame as **IP protection** (consistent with ITAR-aligned posture), policy reviewed by Sean + legal, scanning scope disclosed in employee handbook. PDPA-compliant by design. |
| Vendor lock-in to Microsoft | Both | Hybrid architecture means brain is portable; only the transport layer is M365. Six-week unwind plan if AP ever moves stack. |
| QMSR audit gap | 2 | Every classifier decision logged with model card, version, score, reviewer. This *is* the audit pack. |

---

## 8. What this brainstorm deliberately does NOT include

- Final pricing per phase (depends on volume answers Q1, Q2, Q6, Q7 above)
- Vendor selection for ERP integration (depends on Q1)
- Detailed prompt engineering (premature before grounding sources are confirmed)
- A roadmap beyond Phase 2 (don't crowd Charles's decision space)

---

*Companion docs: see `02_phase1_supplier_chatbot_spec.md`, `03_phase2_email_compliance_spec.md`, `04_process_flows.md`.*
