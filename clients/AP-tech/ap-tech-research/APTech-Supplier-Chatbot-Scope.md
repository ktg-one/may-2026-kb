# Supplier Chatbot — Scope & Quote
## AP Technologies | May 2026
### Kev Tan

---

## What Charles Asked For

"A company chatbot that talks to our suppliers."

What that means in practice: your procurement, engineering, and QA people spend hours every week digging through email threads, WhatsApp messages, and individual inboxes to answer basic questions — where's this PO, what's the spec for that material, when did we last order from this supplier, who's been late on deliveries. That information exists, but it's scattered across four sites and a dozen people's inboxes. Nobody has a single view of any supplier relationship.

The chatbot fixes that. It sits in Teams — where your team already works — and acts as the single point of access to all supplier-related information. Ask it a question in plain English, get an answer backed by your actual data. No app-switching, no calling the Xiamen office to check on a PO.

---

## What I'd Build

### The Short Version

An AI-powered chatbot that lives inside Microsoft Teams as a first-class team member (via Microsoft Agent 365 + n8n). Your procurement, engineering, and QA teams @mention it like they would a colleague. It pulls answers from your ERP, SharePoint, Outlook, and QMS — order status, spec lookups, delivery tracking, quality history — and can draft supplier communications that a human reviews before sending.

### Architecture

```
Your Team (Teams / SharePoint)
       |
       | @mention or direct chat
       v
n8n AI Agent (registered via Microsoft Agent 365)
       |
       | understands the question, plans actions
       v
   +----------+-----------+----------+---------+
   |          |           |          |         |
   v          v           v          v         v
  ERP     SharePoint   Outlook     QMS     External
 (PO/      (supplier   (email    (quality   (supplier
 orders,    docs,       threads,  records,   websites,
 inventory) specs,      comms     NCRs,      lead times
            COAs)       history)  scores)    if needed)
   |          |           |          |         |
   +----------+-----------+----------+---------+
                      |
                      v
              AI Response back in Teams
                      |
                      v (optionally)
              Draft email to supplier
              (human approves before send)
```

The agent gets its own Entra ID identity and shows up in Teams like any other team member. People @mention it naturally. Under the hood, n8n handles the workflow orchestration — receiving the message, figuring out what data sources to query, calling the right APIs, assembling the response, and sending it back. The AI layer (Claude or GPT-4) handles natural language understanding and response generation. The ReAct pattern — reason about the question, take actions to gather data, synthesize the answer — is proven in enterprise chatbot deployments and is what I'd use here.

n8n is available on Azure Marketplace and runs natively in your Microsoft stack. No exotic infrastructure.

---

### What It Can Do (Phase 1 — MVP)

- **"What's the status of PO #12345?"** — queries ERP, returns status with expected delivery date and any notes
- **"Show me the COA for [material lot]"** — finds the Certificate of Analysis in SharePoint, returns a link or the key data points
- **"When did we last order PTFE resin from [supplier]?"** — searches PO history, returns date, quantity, unit price
- **"Draft a follow-up email to [supplier] about late delivery on PO #12345"** — drafts the email with the relevant details pre-filled, shows it to the user for review and approval before sending
- **"What's [supplier]'s quality score this quarter?"** — aggregates NCR data and incoming inspection records
- **"Find the spec sheet for [material]"** — searches SharePoint document libraries across sites
- **"Who are our approved suppliers for FEP pellets?"** — pulls from the approved supplier list

Phase 1 focuses on read operations and draft communications. The bot surfaces information and prepares messages — it doesn't take autonomous action.

### What It Can Do (Phase 2)

- **Proactive alerts**: "Supplier X has 3 late deliveries this month — flag for review"
- **Trend detection**: quality score degradation, price increases, lead time creep
- **Automated PO follow-ups**: scheduled check-ins on open POs approaching their delivery date
- **Power BI dashboard**: supplier performance scorecard fed by the same data layer the chatbot uses
- **Multi-language support**: critical for Xiamen and Bac Ninh supplier communications — the bot can draft emails in Mandarin or Vietnamese based on the supplier's preferred language
- **All-site rollout**: bot available to all four locations with site-specific data access controls

### What It Can Do (Phase 3)

- **Supplier-facing portal**: suppliers can check their own PO status without emailing your team
- **Automated PO generation**: when inventory hits reorder points, the bot drafts a PO for approval
- **Supplier onboarding workflows**: new supplier document collection and qualification tracking
- **Contract renewal alerts**: upcoming contract expirations with spend history and performance summary

---

### What It Needs to Connect To

Being honest about complexity:

- **Teams** — easy. Native integration via Microsoft Agent 365. The bot registers as an Entra ID identity and shows up in Teams. This is the straightforward part.
- **SharePoint** — easy. n8n has native SharePoint connectors via Microsoft Graph API. Document search, metadata queries, file retrieval all well-supported.
- **Outlook / Exchange** — easy. Microsoft Graph API, mature and well-documented. Reading email threads, searching by supplier or PO number, drafting replies.
- **ERP** — medium to hard. This is the biggest variable. If you're running SAP, Oracle, or NetSuite, there are established connectors and APIs. If it's a legacy or niche system, I may need database-level access or a custom adapter. **This is the single biggest unknown and the first thing I need to assess in discovery.**
- **QMS** — medium. If it's a dedicated tool (MasterControl, ETQ, Qualio), most have APIs. If quality records live in spreadsheets or Access databases, it's easier to ingest but messier to maintain. Either way, workable.

### What It Won't Do

Honesty up front saves time later:

- **It won't replace your ERP.** It's a conversation layer on top of your existing systems. It reads from them, it doesn't manage them.
- **It won't make decisions.** It surfaces data and drafts communications. Humans decide which supplier to use, whether to approve a PO, or how to handle a quality issue.
- **It won't have real-time integration with external supplier systems on day one.** That requires supplier cooperation and is Phase 3+ territory.
- **If your ERP has no API and no database access, the chatbot's value is limited to document search and email parsing.** Still useful — but less transformative. Discovery week answers this question before any money is committed.

---

## Timeline

### Phase 1 — MVP (4-6 weeks)

| Week | What Happens |
|------|-------------|
| 1 | **Discovery** — map your supplier data landscape. What ERP, what QMS, where do specs live, how do POs flow. Interview your procurement lead, one engineer, and one QA person. Assess API availability for every system. |
| 2-3 | **Build** — n8n agent connected to SharePoint (docs/specs), Outlook (email history), and ERP queries (if API available). AI reasoning layer configured with your supplier context. Agent registered in Entra ID. |
| 4-5 | **Deploy + Test** — agent live in a Teams channel with an initial user group of 3-5 people from procurement and engineering. Real questions, real data, real feedback. |
| 6 | **Iterate** — fix what breaks, tune response accuracy based on actual usage patterns, adjust data source priorities. |

**Deliverable**: Working chatbot in Teams that handles document lookup, email search, and basic ERP queries. 3-5 active users providing feedback.

### Phase 2 — Full Integration (6-8 weeks after Phase 1)

- Deep ERP integration (full PO lifecycle visibility, inventory-triggered alerts)
- QMS integration (supplier quality scores, NCR history, incoming inspection trends)
- Proactive alerting engine (late deliveries, quality degradation, contract expirations)
- Power BI supplier performance dashboard
- Roll out to all four sites with appropriate access controls

**Deliverable**: Full-featured supplier intelligence bot plus dashboard, operational across Singapore, Xiamen, Bac Ninh, and Irvine.

### Phase 3 — Advanced (Optional, 4-6 weeks)

- Supplier-facing portal
- Multi-language communication drafting
- Automated PO generation with approval workflows
- Supplier onboarding automation

**Deliverable**: External-facing capabilities and workflow automation.

---

## Pricing

| Phase | Duration | What You Get | Price (S$) |
|-------|----------|-------------|------------|
| Phase 1 — MVP | 4-6 weeks | Working chatbot in Teams: document search, email lookup, basic ERP queries. 3-5 users. | 25,000 - 35,000 |
| Phase 2 — Full Integration | 6-8 weeks | Deep ERP + QMS integration, proactive alerts, Power BI dashboard, all-site rollout. | 40,000 - 55,000 |
| Phase 3 — Advanced | 4-6 weeks | Supplier portal, multi-language, automated POs, onboarding workflows. | 30,000 - 40,000 |

### How I Price This

Fixed price per phase, not hourly. You know what you're paying before I start.

Phase 1 has a range because the ERP is the wildcard. If there's a clean REST API, it's closer to S$25K. If I need to build a custom adapter against a legacy database, it's closer to S$35K. Discovery week — which is included in Phase 1 — answers this before any real build work begins.

Phase 2 price depends on what I find during Phase 1. I'll requote with specifics once the data landscape is clear and the MVP is running.

No lock-in between phases. Each phase is independent. If Phase 1 doesn't deliver clear value, don't do Phase 2. I'd rather build something useful in Phase 1 and earn Phase 2 than lock you into a contract.

### Ongoing Costs (Monthly)

| Item | Monthly Cost (S$) | Notes |
|------|-------------------|-------|
| My maintenance retainer | 2,000 - 3,000 | Monitoring, fixes, updates, minor feature additions |
| n8n hosting | 100 - 200 | Self-hosted on Azure (recommended for your compliance requirements) or ~S$70-150 on n8n cloud |
| Microsoft Agent 365 | 15/user/month | For users who interact with the bot. May already be included if you move to E7 licensing. |
| AI API costs (Claude/GPT) | 50 - 200 | Depends on query volume. 100+ concurrent NPI projects will generate meaningful query load. |

### Total First-Year Cost (All 3 Phases)

| | Low End (S$) | High End (S$) |
|---|---|---|
| Build (Phases 1-3) | 95,000 | 130,000 |
| Ongoing (12 months) | ~30,000 | ~42,000 |
| **Total Year 1** | **~125,000** | **~172,000** |

For context: agency pricing for an enterprise chatbot of this scope runs S$110K-340K+ for the build alone, before ongoing costs. I'm faster because I'm one person making all the decisions, and I'm building on platforms (n8n, Agent 365) that eliminate most of the custom infrastructure work.

---

## What I Need From You

Before I can start:

1. **Tell me what ERP you run** — and ideally, get me read-only access or at least a conversation with whoever manages it. This is the single biggest factor in scoping Phase 1.
2. **A SharePoint admin** who can grant app-level permissions for the bot to search document libraries.
3. **2-3 hours during Week 1** from your procurement lead and one engineer. I need to understand how they actually work with suppliers day-to-day — not the org chart version, the real version.
4. **A Teams channel** I can deploy the bot to for testing.

That's it for Phase 1 kickoff.

---

## Risk — Honest Assessment

**Biggest risk: ERP integration.** Everything else in this build is well-trodden ground. SharePoint, Outlook, Teams — Microsoft's Graph API is mature and I've built on it before. The ERP is the unknown. If it's a modern system with a documented API, Phase 1 delivers the full vision. If it's a legacy system with no API, I can still build database-level adapters, but it takes longer and costs more. If it's completely locked down with no programmatic access at all, Phase 1 scope shrinks to document search and email parsing — still useful, but less transformative. Discovery week exists specifically to answer this before you're committed.

**Data quality risk.** The chatbot is only as good as the data it can access. If supplier specs live in someone's personal inbox and nowhere else, we have a data migration task before the bot is useful. If PO data in the ERP is incomplete or inconsistent, the bot will surface those gaps. This is actually a feature — it forces data hygiene — but it's worth knowing upfront.

**Adoption risk.** This is actually where the architecture helps. Bots that live inside Teams — where people already work — have dramatically higher adoption than standalone tools or separate portals. The Microsoft Agent 365 integration means the bot shows up as a team member, not a separate app to learn. People @mention it like they would a colleague. That's a low friction path to adoption.

**Regulatory consideration.** You're FDA-regulated and ISO 13485 certified. The chatbot reads from your systems — it doesn't modify records or make quality decisions. But we'll need to document it appropriately in your QMS as a software tool, and make sure audit trails are maintained for any supplier communications it drafts. This is manageable but needs to be on the compliance team's radar from Week 1.

---

*Kev Tan — May 2026*
*Questions: let's talk through it. I'd rather spend an hour on the phone getting the ERP question answered than write another ten pages of assumptions.*
