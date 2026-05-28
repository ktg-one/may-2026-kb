---
title: Privacy Policy — Good AI Australia (DRAFT)
type: legal
tags: [legal, privacy, draft, lawyer-review]
sources: [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]], [[wiki/entities/trillet-ai]], [[wiki/concepts/iso-42001-ai-management-systems]]
last_updated: 2026-05-28
status: draft — REQUIRES LAWYER REVIEW BEFORE PUBLISHING
applies_to: goodai.au
---

# Privacy Policy (DRAFT — NOT YET PUBLISHED)

> ⚠️ This is a working draft for lawyer review. Do not publish to `goodai.au` until reviewed and approved by qualified Australian legal counsel. Wherever you see **[NEEDS LAWYER: ...]** the draft requires legal judgment that I cannot supply.

---

**Effective date:** [NEEDS LAWYER: date of publication]
**Last updated:** [NEEDS LAWYER: date of last revision]
**Operated by:** Good AI Australia, ABN [NEEDS KEV: ABN], a sole trader operating in Western Australia.

## 1. Overview

Good AI Australia ("Good AI", "we", "us") provides AI voice agent and related automation services to small and medium businesses. This Privacy Policy explains what personal information we collect, how we use and share it, how we keep it secure, and the rights you have under Australian privacy law.

We are committed to handling personal information in accordance with the **Privacy Act 1988 (Cth)** and the **Australian Privacy Principles (APPs)**, and to aligning our practices with the **Privacy and Responsible Information Sharing Act 2024 (Western Australia)** as its provisions commence.

## 2. Who this policy applies to

This policy applies to personal information collected from:

- **Visitors** to our website at `goodai.au`
- **Prospects** who use our Digital Health Check, ROI calculator, chat widget, or who call our demo line at +61 8 7741 4191
- **Clients** who engage Good AI for voice agent or automation services
- **Callers** to our clients' phone lines that are answered by a Good AI voice agent

Different rules apply to each of these groups. Read the relevant section.

## 3. Personal information we collect

### 3.1 From website visitors

When you visit `goodai.au` we collect:

- Standard technical information: IP address, browser type, device type, pages viewed, referrer, time of visit
- Cookies and similar identifiers — see Section 8

### 3.2 From prospects (Digital Health Check, ROI calculator, chat, demo calls)

When you use our self-serve tools or contact us, we collect:

- Contact details: name, email address, phone number, business name
- Business information: industry, staff count, current operational pain points, revenue band (general), any information you choose to share
- Call recordings and transcripts when you call our demo line (with notice at call start)

### 3.3 From clients

When you engage Good AI as a client, we collect:

- Identifying information: name, role, business name, ABN, billing address, payment details (processed via our payment processor — see Section 6)
- Operational information: business hours, departments, contact list, call-routing rules, knowledge base content (FAQs, services, pricing) that you supply to configure your voice agent
- Service usage: call logs, transcripts, performance metrics from the voice agent platform

### 3.4 From callers to our clients' phone lines

When someone calls a Good AI–powered phone number, we (and our platform partner — see Section 6) process:

- The caller's phone number, the call audio, and a transcript of the call
- Any information the caller volunteers to the AI agent (name, booking details, enquiry content)

These callers may not have a direct relationship with Good AI. **Our client (the business they are calling) is the primary controller of that information.** We act as their service provider. Each client is required by our [[wiki/legal/terms-of-service-draft|Terms of Service]] to disclose AI use and recording to their callers in accordance with applicable law. **[NEEDS LAWYER: confirm the controller / processor allocation under Australian Privacy Principles for this caller-data scenario; this is the highest-risk area of the policy.]**

## 4. How we use personal information

We use personal information to:

- **Operate the service:** configure and run voice agents, generate Digital Health Check reports, deliver ROI calculations, answer chat enquiries
- **Communicate with you:** respond to enquiries, send service updates, send invoices, deliver scheduled reports (e.g. monthly performance summaries)
- **Improve the service:** analyse call patterns, identify common failure modes, refine prompts and templates (with personal information de-identified wherever practicable)
- **Comply with law:** meet our obligations under Australian tax, consumer-protection, telecommunications, privacy and AI-governance frameworks
- **Protect against fraud and abuse:** monitor unusual activity, prevent unauthorised access

We will not use your personal information for purposes unrelated to the above without your consent.

## 5. AI processing — specific notice

Good AI uses AI models (large language models and voice models) to generate text and speech as a core part of the service. This means:

- Voice agent calls are processed by AI models in real time
- Health Check reports are generated by AI models from the information you supply
- Chat widget responses are generated by AI models trained on our public knowledge base content

**We do not use your personal or client information to train third-party AI models.** Our use of those models is via paid commercial APIs that contract not to train on customer data. **[NEEDS LAWYER: confirm exact contractual position with each LLM provider (Anthropic, OpenAI, Google) and align this language to those contracts.]**

We align our AI practices with **ISO/IEC 42001 (AI Management Systems)** [3].

## 6. Who we share information with

We share personal information only as set out below.

### 6.1 Our platform partners (sub-processors)

| Partner | Purpose | Where data is stored |
|---|---|---|
| **Trillet AI Pty Ltd** (Australian company) | Voice operating layer — call answering, transcription, telephony, action execution | Configurable data residency, with Australian region available; Trillet holds SOC 2 Type II, ISO 27001, HIPAA, GDPR and TCPA certifications [2] |
| **Twilio** (via Trillet) | Phone-number provisioning and PSTN connection | Global infrastructure; Trillet manages the contractual relationship |
| **[NEEDS KEV] Payment processor (Stripe or other)** | Payment processing | [NEEDS KEV] |
| **[NEEDS KEV] CRM (HubSpot / GoHighLevel / other)** | Lead capture and client relationship management | [NEEDS KEV] |
| **Google Workspace** | Email, document storage, calendar | Stored per Google Workspace's data terms |
| **n8n** (self-hosted + cloud) | Workflow automation | [NEEDS KEV: hosting region for the cloud component] |
| **LLM providers** (Anthropic / OpenAI / Google) | AI model inference | Processed via paid APIs with contractual no-training terms |

Each of these sub-processors is bound by their own privacy and security obligations. **[NEEDS LAWYER: confirm Data Processing Agreements (DPAs) are in place with each, and align this section to the actual contractual position.]**

### 6.2 Otherwise

We share personal information when we are legally required to (e.g. lawful warrant, court order, regulator request) or where you have explicitly consented (e.g. case studies, testimonials).

We do not sell personal information.

## 7. International transfer

Some of our sub-processors process information outside Australia. Where this happens we ensure the recipient is bound by privacy protections substantially similar to the APPs. **[NEEDS LAWYER: list each sub-processor's processing location and confirm the cross-border disclosure standard (APP 8) is met.]**

You can request Australian-only data residency for your voice-agent service — Trillet supports configurable Australian residency and we will activate it for any client who requests it.

## 8. Cookies and analytics

Our website uses cookies and similar technologies to operate the site, remember your preferences, and measure performance. We use:

- **Strictly necessary cookies** — required for the site to function (session, security)
- **Analytics cookies** — to understand how the site is used [NEEDS KEV: specific analytics tool — Google Analytics? Plausible? Other?]
- **Marketing cookies** — only with your consent [NEEDS KEV: Google Ads / Meta pixel — yes/no?]

You can control non-essential cookies through your browser settings or our cookie banner. **[NEEDS LAWYER: confirm cookie banner consent model required — opt-in vs opt-out under current Australian guidance.]**

## 9. How long we keep information

| Category | Retention period |
|---|---|
| Website analytics | [NEEDS LAWYER] |
| Health Check submissions (not converted to clients) | 12 months, then deleted |
| Demo-call recordings (not converted to clients) | 30 days, then deleted |
| Client business and operational data | Duration of the engagement + 7 years (Australian tax-record requirement) |
| Caller information processed via client voice agents | Per the client's instructions and applicable law; default retention 90 days on Trillet audit log [2] |
| Payment records | 7 years (Australian tax-record requirement) |

## 10. Security

We protect personal information through:

- Encryption in transit and at rest (Trillet platform; payment processor; cloud services)
- Multi-factor authentication on all administrative accounts
- Role-based access control
- The certified posture of our sub-processors (SOC 2 Type II, ISO 27001, HIPAA, GDPR) [2]
- ISO/IEC 42001 (AI Management Systems) alignment [3]
- Cyber liability insurance cover

No system is perfectly secure. If we become aware of a notifiable data breach we will notify affected individuals and the Office of the Australian Information Commissioner (OAIC) as required by the Privacy Act 1988 (Cth) and, once it commences, the breach notification provisions of the PRIS Act 2024 (WA). **[NEEDS LAWYER: confirm overlapping notification obligations and timeline alignment.]**

## 11. Your rights

You have the right to:

- **Access** the personal information we hold about you
- **Correct** information that is inaccurate or out of date
- **Withdraw consent** for non-essential processing (e.g. marketing communications)
- **Request deletion** of your information, subject to legal retention obligations
- **Complain** to us, and if unresolved, to the OAIC

To exercise any of these rights, contact us at the address in Section 13.

## 12. Children

Our services are not directed to individuals under 16 years of age. We do not knowingly collect information from anyone under 16. If you believe we have collected such information, please contact us and we will delete it.

## 13. Contact

For privacy questions, complaints, or to exercise any of the rights above:

- Email: [NEEDS KEV: privacy contact email — e.g. privacy@goodai.au]
- Postal: [NEEDS KEV: business postal address]
- Office of the Australian Information Commissioner: https://www.oaic.gov.au

## 14. Changes to this policy

We will update this policy as our practices evolve or as the law requires. Material changes will be notified to clients via email and posted prominently on `goodai.au` at least 30 days before they take effect.

---

## Sources used to compose this draft

- [1] [[wiki/sources/goodai-sea-businessplan-redraft-2026-05-25]] — operational scope and sub-processor landscape
- [2] [[wiki/entities/trillet-ai]] — platform certifications, data residency, retention
- [3] [[wiki/concepts/iso-42001-ai-management-systems]] — AI governance posture

## [NEEDS LAWYER] (collated for the lawyer's review)

- Section 3.4 — Controller/processor allocation for caller-to-client data under APP
- Section 5 — Exact LLM-provider contractual positions on training/no-training
- Section 6 — DPAs with each sub-processor
- Section 7 — APP 8 cross-border disclosure standard per sub-processor
- Section 8 — Cookie consent model (opt-in vs opt-out)
- Section 9 — Retention periods per category (especially website analytics)
- Section 10 — Overlap between Privacy Act 1988 (Cth) notifiable breach + PRIS Act 2024 (WA) breach notification
- Section 13 — Final contact details and complaint pathway language
- Effective date language and revision history
- Plain-English summary at top (recommended by OAIC guidance) — to be drafted by lawyer in agreed form

## [NEEDS KEV]

- ABN
- Privacy contact email
- Business postal address
- Payment processor identity (Stripe direct vs via Trillet vs other)
- CRM committed (HubSpot vs GoHighLevel vs other)
- n8n cloud hosting region
- Analytics tool selection
- Marketing pixel decisions (Google Ads / Meta)
