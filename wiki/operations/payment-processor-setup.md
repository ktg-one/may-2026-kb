---
title: Payment Processor Setup SOP
type: sop
tags: [operations, payments, billing, sop, launch-blocker]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/entities/trillet-ai]], [[wiki/operations/client-onboarding-sop]]
last_updated: 2026-05-28
status: draft
---

# Payment Processor Setup SOP

How money flows from a paying client into Good AI's bank account. Launch-blocking — no operation can ship until this is end-to-end working. Documented here so the choice and the integration are recorded canonically; whoever takes this over (VA at Month 6, accountant, future Claude) can pick it up cold.

## Decision pending

**[NEEDS KEV — gate item:** pick one of the three paths below before Week T-3 of the launch checklist.**]**

The decision affects the **[[wiki/legal/privacy-policy-draft|Privacy Policy]]** §6.1 sub-processor list and the **[[wiki/legal/terms-of-service-draft|Terms of Service]]** §3.1 payment language. Confirm here and update both.

| Path | What it is | Best for | Friction | Cost |
|---|---|---|---|---|
| **A — Stripe direct (Good AI account)** | Good AI holds a Stripe account; clients pay Stripe; Stripe deposits to Good AI's bank account | Maximum control over invoicing, payment-method choice, dispute handling | Highest setup effort; Good AI handles all PCI scope (mitigated by hosted Stripe Checkout) | ~1.75% + $0.30 per AU domestic card; ~2.9% + $0.30 international |
| **B — Stripe via Trillet** | Trillet handles billing for the voice subscription; Trillet pays out to Good AI | Lowest setup effort — Trillet already has Stripe integrated [2]; "Stripe billing" is a native Trillet integration | Less invoicing flexibility; harder to bill non-voice services (automation builds, assessments) through this rail; revenue split depends on Trillet's billing model | Trillet plan covers the integration; Stripe fees apply on top (passed through or absorbed depending on contract) **[NEEDS KEV: confirm Trillet's billing-on-behalf revenue split and Stripe fee responsibility]** |
| **C — Hybrid** | Subscriptions through Trillet's Stripe integration; non-subscription services (assessments, builds, custom work) through a Stripe direct account | Best fit if voice subs are the volume and other services are occasional | Two payment surfaces to reconcile in bookkeeping | Stripe fees on both surfaces |

**Default recommendation if Kev gives no signal:** Path A (Stripe direct). Reasons: (i) Good AI sells more than voice subscriptions per the broader [[wiki/good-ai|10-product / 3-tier catalogue]], so a Trillet-only rail under-serves the other revenue lines; (ii) direct Stripe gives clean invoicing and reconciliation for the SEA reporting that the program requires; (iii) the setup effort difference (Path A vs B) is hours, not weeks.

## Setup checklist (Path A — Stripe direct)

### Account & verification

- [ ] Stripe account created under Kev's identity, registered to the Good AI Australia ABN
- [ ] Bank account verified (instant via micro-deposit confirmation, ~2 business days)
- [ ] Identity verification submitted (ABN, government ID, business proof)
- [ ] AUD as primary settlement currency
- [ ] Tax settings: GST registration status set per current threshold position [NEEDS KEV]

### Products and pricing in Stripe

- [ ] Each of the seven voice-subscription tiers created as a Stripe Product with a recurring monthly Price (incl. setup fee where applicable)
  - Business Starter — $199 setup + $149/month [1, §11.3]
  - General Enquiries — $199 + $170/month
  - Meetings & Bookings — $249 + $199/month
  - Sales Lead Generation — $299 + $249/month
  - Property Management — $349 + $299/month
  - Food & Hospitality — $399 + $299/month
  - Complete Customised — $599 + $499/month
- [ ] Annual prepay (12+1) prices created with the 8.3% effective discount [1, §9]
- [ ] One-time products for: Custom Voice Design ($49), Digital Health Check ($149 / $800), Custom Development ($1,500–$3,000 per scope), Hourly Consulting ($100/hr) [1, §11.3]
- [ ] Add-on minute pricing configured ($0.20/min or $0.25/min over allocation per tier) [1, §11.3] **[NEEDS KEV: reconcile against the included-minutes ambiguity flagged in the SEA plan; pick one definition before pricing is published]**

### Customer & checkout

- [ ] Stripe Customer Portal enabled (clients can update payment method, view invoices, cancel)
- [ ] Hosted Checkout pages branded with Good AI logo and colour (depends on the brand kit doc — separate launch-blocker)
- [ ] Tax behaviour: Stripe Tax enabled if available in AU **[NEEDS KEV: confirm Stripe Tax AU availability and whether to use it vs manual GST handling via accountant]**
- [ ] Email receipts enabled, branded
- [ ] Failed-payment retry schedule configured (3 attempts over 7 days is standard)

### Integration

- [ ] Webhook endpoint configured for: `checkout.session.completed`, `customer.subscription.created`, `customer.subscription.updated`, `customer.subscription.deleted`, `invoice.payment_succeeded`, `invoice.payment_failed`, `customer.created`
- [ ] Webhook handler in n8n: receives event → updates CRM record → triggers the Stage 4 intake email per [[wiki/operations/client-onboarding-sop]] when a new subscription starts
- [ ] Test mode end-to-end before production: create a test customer, run through checkout, verify webhook hits n8n, verify CRM updates, verify intake email triggers

### Reconciliation

- [ ] Monthly Stripe payout schedule confirmed (default: 7-day rolling AU)
- [ ] Stripe → accountant export configured (CSV or direct integration with the bookkeeping software the accountant uses) **[NEEDS KEV: which bookkeeping software does the accountant use?]**
- [ ] Reconciliation slot in the Friday admin block per [[wiki/operations/weekly-cadence]]

### Refunds

- [ ] Refund policy in [[wiki/legal/terms-of-service-draft|ToS]] aligned with the policy reflected in Stripe (no automatic refunds; case-by-case on customer support ticket)
- [ ] Refund authorisation flow: founder approves all refunds during Phase 1 (pre-VA); after VA hire, VA can approve refunds ≤$200 per case, founder approves larger

## Setup checklist (Path B — Stripe via Trillet)

If Path B is chosen instead, the work is materially lighter:

- [ ] Activate the **Stripe billing** integration in the Trillet Studio plan dashboard [2]
- [ ] Configure the seven subscription tiers in Trillet's billing module
- [ ] Confirm Trillet's payout model — direct to Good AI bank vs Trillet account
- [ ] **[NEEDS KEV: confirm Trillet's billing-on-behalf revenue split, Stripe fee allocation, and how custom one-off charges (e.g. Custom Development $1,500–$3,000) are handled — Trillet's billing module may not cover non-subscription invoices, in which case a parallel direct Stripe account is required anyway, defaulting back toward Path C]**

## Once live — operational rules

- **Never quote a price by email then take payment via a different rate.** Every paying client buys via the published Stripe checkout to keep books clean.
- **Always issue an invoice through Stripe** even for cash-equivalent edge cases — accountant needs the audit trail.
- **Subscription state of truth = Stripe.** The CRM is downstream. If they disagree, Stripe wins; investigate the divergence.
- **Webhook failures = S2 incident.** A missed `subscription.created` event means a paying client never gets the intake email; treat as service-degraded per [[wiki/operations/support-incident-runbook]].

## Sources

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]] — pricing tier definitions
- [2] [[wiki/entities/trillet-ai]] — Trillet's native Stripe billing integration

## [NEEDS KEV]

- Path choice (A / B / C) — gate item
- GST registration status at launch
- Trillet billing-on-behalf revenue split (if Path B / C)
- Stripe Tax AU availability and use
- Accountant's bookkeeping software (for reconciliation export)
- Reconciliation of the included-minutes per tier ambiguity (so Stripe products match the published pricing)
