---
title: Operations Risk Register
type: register
tags: [operations, risk, register]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/entities/trillet-ai]], [[wiki/operations/capacity-plan]]
last_updated: 2026-05-28
status: draft
review_cadence: monthly
---

# Operations Risk Register

Tracked operational risks for Good AI Australia. Reviewed first Monday of every month per [[wiki/operations/weekly-cadence]]. Strategic / market risks live in the SEA plan §12; this register tracks the *operational* layer — what can break delivery, support, capacity, or compliance day-to-day.

## Scoring

- **Likelihood:** Low (<10% in next 12 months) / Medium (10–40%) / High (>40%)
- **Impact:** Low / Medium / High / Critical (existential to the business)
- **Status:** Open / Mitigated / Accepted / Closed

## Active risks

### OPS-001 — Founder dependency

- **Likelihood:** High (sole-founder model)
- **Impact:** Critical
- **Description:** All technical work, sales, and ops sit on Kev. Any extended absence (illness, family emergency, burnout) halts the business.
- **Mitigation:**
  - Personal commitments + carer responsibilities accommodated by home-based model [1, §8.3]
  - Operations docs (this cluster) being written so a stand-in could run delivery and support
  - VA hire at Month 6 (or earlier per capacity-plan triggers) reduces single-point-of-failure on admin and retention work
  - Health insurance + income protection [NEEDS KEV: confirm income protection insurance status — separate from BizCover SMB policy]
- **Status:** Open. Mitigation in progress.

### OPS-002 — Trillet platform dependency

- **Likelihood:** Low (Trillet is SOC 2 Type II / ISO 27001 / HIPAA / GDPR / TCPA certified, Australian Pty Ltd, 99.97% SLA) [2]
- **Impact:** Critical (whole product runs on Trillet)
- **Description:** Trillet raises prices, suffers prolonged outage, or ceases operations.
- **Mitigation:**
  - Platform-agnostic architecture — conversation logic and prompts portable
  - 2–4 week estimated migration window to an alternative (e.g. Bland.ai) [1, §12.1]
  - Trillet's certification posture and published pricing make sudden adverse change less likely than the previous plan assumed [1, §12.1]
  - Migration playbook to be drafted as part of `wiki/operations/vendor-management-sop.md` (Tier 3, queued)
- **Status:** Open, low priority.

### OPS-003 — Capacity overshoot (sales > delivery)

- **Likelihood:** Medium
- **Impact:** High (brand damage from broken SLAs at the moment the business needs reputation most)
- **Description:** Channel partners or marketing surface more clients than the founder can deploy and support solo.
- **Mitigation:**
  - Stagger channel-partner activation (don't switch all on at once) [SEA plan §12]
  - Hold a waitlist if new-deployment requests exceed 6/week per [[wiki/operations/capacity-plan]]
  - Hire VA earlier than Month 6 if any two capacity triggers fire
- **Status:** Open, watch monthly.

### OPS-004 — Scope creep on template-priced clients

- **Likelihood:** Medium
- **Impact:** Medium (margin compression; founder time burned on non-recurring work)
- **Description:** Clients demand features beyond template scope; founder concedes for goodwill; template-economics break.
- **Mitigation:**
  - Hard rule: quote custom work separately at $1,500–$3,000 [1, §12.1]
  - If 10+ clients request the same feature, develop a new tier template — captures the demand as productisable [1, §12.1]
  - Communicate the rule in the Stage 6 activation call so it's not a surprise later
- **Status:** Open. Discipline-dependent; review monthly.

### OPS-005 — Inaccurate per-call COGS estimation

- **Likelihood:** Low (now resolved by Trillet's published pricing: $99/mo + $0.12/min overage + $5/number) [2]
- **Impact:** Low (mistake would be caught in monthly review before it compounds)
- **Description:** Per-minute or per-number costs misjudged; pricing becomes unprofitable.
- **Mitigation:**
  - COGS reconciled directly against Trillet's published rates [1, §11.4]
  - Monthly Trillet plan utilisation review per [[wiki/operations/capacity-plan]]
  - Customer-facing pricing tiers re-validated quarterly
- **Status:** Mitigated.

### OPS-006 — Client data handling / privacy compliance

- **Likelihood:** Low (Trillet holds GDPR/HIPAA/SOC 2 II/ISO 27001 platform-level + Kev holds ISO/IEC 42001 practitioner-level) [2, 3]
- **Impact:** Critical (regulatory exposure + reputation)
- **Description:** Mishandling of client or end-customer personal information triggers a Privacy Act / PRIS Act 2024 (WA) issue.
- **Mitigation:**
  - All client data in Trillet's certified infrastructure with configurable Australian data residency [2]
  - Onboarding intake via secure Google Forms in dedicated Google Workspace account [1, §7]
  - ISO 42001 governance posture applied [3]
  - Cyber liability cover included in BizCover SMB policy [1, §12.2]
  - PRIS Act IPP commencement 1 Jul 2026 + mandatory breach notification 1 Jan 2027 [NEEDS KEV: re-verify against current WA Government guidance pre-launch] [1, §12.3]
  - `wiki/operations/compliance-operations-sop.md` (Tier 3) to formalise breach-response procedure
- **Status:** Open until breach-response SOP is written.

### OPS-007 — Tax / BAS / GST lapse

- **Likelihood:** Low (with accountant engaged)
- **Impact:** Medium
- **Description:** Missed quarterly BAS lodgement, missed GST registration threshold ($75K), or income tax issue.
- **Mitigation:**
  - Local Perth accountant engaged for bookkeeping, BAS, income tax [1, §5] **[NEEDS KEV: confirm accountant engaged — name + firm — for the launch]**
  - GST registration triggered when annual income projects ≥$75K [1, §11.6]
  - Quarterly BAS slot in Friday admin block per [[wiki/operations/weekly-cadence]]
- **Status:** Open (pending accountant confirmation).

### OPS-008 — Insurance lapse / inadequate cover

- **Likelihood:** Low (BizCover SMB policy bound at $55–60/month)
- **Impact:** High (uncovered claim could be existential)
- **Description:** Policy lapses, or limits become inadequate as client scale grows.
- **Mitigation:**
  - Quarterly insurance review per [[wiki/operations/weekly-cadence]]
  - Upgrade cover at the Y2 transition to higher per-policy limits if larger clients require it [1, §12.2]
  - Direct debit on policy avoids lapse risk
- **Status:** Mitigated.

### OPS-009 — Founder skills obsolescence

- **Likelihood:** Medium (AI tooling landscape moves fast)
- **Impact:** Medium (loses competitive edge over 6–12 months if not invested in)
- **Description:** Without ongoing professional development, the technical and credibility moat erodes.
- **Mitigation:**
  - $150/month professional development budget [1, §5]
  - Monday + Wednesday evening blocks reserved for PD per [[wiki/operations/weekly-cadence]]
  - ISO/IEC 42001 currency maintenance [NEEDS KEV: confirm credential renewal cycle]
- **Status:** Mitigated.

### OPS-010 — Single-bucket marketing channel concentration

- **Likelihood:** Medium
- **Impact:** Medium (capacity exposure to one acquisition source)
- **Description:** If most clients come through one channel (e.g. Kismet referral), a partnership change could choke pipeline.
- **Mitigation:**
  - Five marketing channels in active rotation [1, §9]: networking, Google Ads, website/SEO, referrals, Facebook community groups
  - "Perth Pioneers" Month 1 free programme captures early direct-channel growth [1, §9]
  - White-label resale partners diversify acquisition further (second route to market)
- **Status:** Open, watch monthly.

## Closed risks

(None yet — register established 2026-05-28.)

## Review log

```
## [2026-05-28] register | Operations risk register established
10 active operational risks captured. OPS-005 and OPS-008 marked Mitigated.
```

## Sources

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]]
- [2] [[wiki/entities/trillet-ai]]
- [3] [[wiki/concepts/iso-42001-ai-management-systems]]

## [NEEDS KEV]

- Income protection insurance separate from BizCover SMB policy — held or not?
- Accountant engagement confirmed (firm + contact)
- PRIS Act commencement date re-verification against current WA Government guidance pre-launch
- ISO/IEC 42001 credential renewal cycle
