---
title: "Kismet Strategic Meeting v2 — Shane + Josh Dynamic"
date: 2026-05-12 (night-before, revised after Kev clarified)
purpose: Tight brief for a politically loaded meeting. Shane has been rebuilding in Kev's absence. Josh is clueless. Different posture entirely.
status: replaces v1 — the unbilled-work-true-up framing was wrong
authored_by: Claude
tags: [kismet, strategic-meeting, prep, shane-dynamic, may2026]
---

# Kismet Meeting — Revised Brief (Shane + Josh in the Room)

## The dynamic, plainly

- **Shane** = co-founder, in the honeymoon phase with AI, has the same tool stack as Kev (Claude Max etc.), only uses Claude Chat, just started Claude Code, refuses to learn engineering. Says "deterministic talking is good enough."
- **Josh** = co-founder, clueless about tech, follows Shane on technical decisions but cares about the business.
- **Shane took down your n8n workflows and spent a month trying to rebuild Notion himself.** His defence when challenged: *"But I spent a whole month doing this."* Sunk-cost rationale.
- **What Shane actually built**: a hand-configured Notion database. **What he destroyed**: the entire integration layer — Fillout intake, Google Calendar sync, Google Drive folder creation, Notion-button-to-n8n webhooks, error logging, AI lead analysis, DocuSign onboarding, Obsidian agent bridge.
- He rebuilt the **database**. He destroyed the **system**. Notion without n8n is a Rolodex, not a CRM.
- **You are returning from a long Notion absence** and trying to re-establish position.

This is not a "true up the invoice" meeting. It's "renegotiate Kev's role at Kismet" — and you do it by honouring Shane's Notion work as foundation while making clear the plumbing has to come back.

---

## The sunk-cost wall — and how to dissolve it

Shane will reach for *"but I spent a whole month doing this"* the moment you suggest reintegrating the automation layer. Don't argue with the month. Reframe what the month built:

> "What you've built in Notion is the foundation — your month gave us the structure, the property design, the views. That work isn't lost. The piece we need to put back is the plumbing behind it, otherwise the structure sits as a database that can't be compliant on 1 July. Let me put the automation spine back so what you built actually runs."

He keeps the **win** of "I rebuilt our Notion." You bring back the **integration spine**. Both stories are true. Nobody loses face.

**The phrase to drill into your head before the meeting**: *foundation vs plumbing*. He built the foundation. You bring back the plumbing. Both are needed for a building. Repeat as needed.

---

## The historical precedent — your strongest card, used carefully

You have lived this loop with Shane before. **Phase 1 of the original engagement** was Apps Script automations. Shane kept piling features onto it until you were essentially building Notion-in-Apps-Script with no integration layer. You pulled them out of that hole and rebuilt on proper Notion + n8n. **That was Phase 2.**

What Shane has just done is **destroy Phase 2 and partially recreate Phase 1 on a different surface**. Same shape (database with no plumbing). Different floor (Notion native instead of Apps Script).

**You're not predicting Shane will hit the wall — he hit it once already, with you, six months ago.**

This is your strongest card. Use it carefully:

- **Don't open with it.** Sounds like "I told you so." Shane gets defensive and Josh tunes out.
- **Hold it for the moment Shane resists reintegration.** If he digs in on "I spent a month doing this, why do we need n8n back?" — that is the cue.
- **Deliver flat, no emotion:**

  > "Shane, we did this loop in Phase 1. You wanted Apps Script. I built Apps Script. We hit this exact wall at the moment we tried to integrate. That's why we moved to Notion + n8n. I'm not trying to take your build away. I'm trying to stop us from spending another month rediscovering the same wall."

- **Then pivot back to forward-looking:** "I want to put the plumbing back so your foundation can actually run. That's it."

Used once, calmly, this card lands. Used twice or with frustration, it becomes a relationship-ender. **One shot only.**

---

## Position to walk in with

> "I love that you've been hands-on, Shane. That's how I started. I want to see what you've built — and I want to talk about the 45 days between us and the July 1 compliance cliff, because that's the part I don't want either of you carrying alone."

Generosity first. Reality after. Don't open with what you delivered. Don't open with what's owed.

---

## Shane's actual North Star — THE single best hook

Shane has told you what he wants in plain language: **a CRM that does what Notion does AND calls numbers.** That is the requirement.

**Notion does not call numbers.** It has no native telephony API. This is a hard technical constraint, not an opinion. You can verify this in front of him in 30 seconds.

**The architecture that DID call numbers was JustCall + n8n + Notion** — workflow #3 in the deliverables map. JustCall webhook fires when a call completes → n8n validates the SHA256 signature → deduplicates and matches the phone number → waits for the AI summary webhook → pushes transcription into the Notion page. *That is "Notion that calls numbers."* It was Phase 2.

**Shane destroyed the exact thing he's now trying to recreate.** Not abstractly — concretely. The call-sync workflow was the bridge between Notion and telephony. Without n8n, Notion is mute.

### The opening speech to deliver (memorise this if nothing else)

> "Shane — let's start with what you want, plainly. You want a CRM that calls numbers and logs the conversation back to the record. That's right, isn't it? Good. Notion can't do that natively — no telephony API. The architecture that DID do it was JustCall webhook into n8n, SHA256-verified, payload into Notion with the transcription. That was the call-sync workflow in Phase 2. Let me put that bridge back. You keep your Notion build. The phone calls work again."

Concrete. Tied to *his* goal. Frames the integration layer as **the answer to his problem**, not Kev's preference.

**The bonus**: the SHA256-verified call-logging pipeline is precisely what AUSTRAC Tranche 2 requires for immutable lead capture (effective 1 July). One architecture, two problems solved. Mention this AFTER the telephony point lands, not before.

---

## The seam Shane doesn't see (your seat at the table)

"Deterministic talking" handles UX flows and conversation design. It does **not** handle:

- **WORM-compliant immutable audit logging** (SEC Rule 17a-4(f), required for ASIC referral disclosures)
- **SHA256 signature verification** on Twilio / JustCall webhooks (AUSTRAC immutable lineage)
- **Onshore data sovereignty** — AWS Australia / Sydney-Melbourne hosting (WA PRIS Act 2024)
- **Hash-based interaction logging** with timestamp + user ID + content hash (PRIS Act audit trail)
- **Mandatory breach notification** within statutory timeframes (Information Breach Scheme, effective 1 Jan 2027)
- **APRA CPS 230 operational resilience proof** — system stability events, vendor risk audits, BCP logs
- **Privacy Act AI Disclosure consent flows** with timestamped acknowledgement (effective 10 Dec 2026)

These are **engineering problems with regulatory deadlines**. They are invisible until 1 July 2026, and then they're a regulator-issued fine that **Kismet wears as a contracted service provider under supply-chain liability.**

Shane almost certainly hasn't thought about these. That's not his fault — he's been busy building. But it's the gap.

---

## The play, in order

### 1. Open generous — disarm the ownership defense
"Show me what you built." Mean it. Take notes. Find at least one thing you genuinely like and say so out loud. **Shane needs validation before he'll listen.** If you skip this step, everything else fails.

### 2. Ask, don't tell, on the compliance gap
Don't say "you missed compliance." Ask:
- "How does your build handle the PRIS Act audit trail when it goes live on 1 July?"
- "Where does the immutable interaction log live in your stack?"
- "How are you handling SHA256 signature verification on the JustCall webhooks?"

If he can answer — great, your job is smaller. If he can't (likely) — **don't pounce**. Just acknowledge: "Yeah, that's the part I want to own with you. It's not chat-prompt-able; it has to be engineered."

### 3. Speak to Josh in his language
At a natural moment, pivot to Josh:
> "Josh — here's what 1 July looks like in dollars if we're not compliant. PRIS Act breach as a service provider, AUSTRAC Tranche 2 KYC gaps, APRA CPS 230 audit failure. Kismet carries the cost. We have 45 days. I want to own the compliance layer so you and Shane don't carry that risk."

**Josh doesn't need to understand any of the regulations.** He needs to understand it's a regulator-issued fine. Risk language, not technology language. He will then make the call you want without Shane losing face.

### 4. Offer a specific, narrow scope
Not a retainer. Not "let me come back in fully." A *specific* deliverable:
> "Through 1 July, I own the compliance layer — audit trail, immutable logging, signature verification, data sovereignty, breach protocols. You keep building the front end and the operational flow. We sync once a week. After 1 July, we look at what's next."

Defined. Deferential to Shane's build. Real engineering ownership. **Not threatening to his territory.**

### 5. Defer the unbilled work conversation
**Do not raise it tomorrow.** It is the wrong meeting for it. Schedule a separate session next week framed as "let's true up what's been delivered so we both have a clear picture going into Q3." Raising it in the same meeting where you're asking for re-engagement makes you look greedy — Shane will reach for that read instinctively.

---

## Things to NOT do

- **Don't compare your build to Shane's.** He'll defend, and you'll lose the relationship before you've made the safety case.
- **Don't say "deterministic talking isn't enough."** That insults him. Show, don't tell — let the compliance questions surface the gap.
- **Don't pitch the AI-Readiness channel model tomorrow.** Wrong meeting, wrong audience. That's a quarterly-planning conversation.
- **Don't show the deliverables map.** It looks like a bill, and Shane will see it as proof you came to extract money.
- **Don't relitigate what Shane took down.** It is gone. Mourn privately. Build forward.
- **Don't surface the irony** that he's building the first thing he told you not to build. He'll either notice it himself or he won't — not your job tonight.

---

## The Shane archetype — read carefully

You said it: "He reminds me of me when I first got into AI." That's exactly right. He's in the phase where every new tool feels like superpowers and every existing system feels like over-engineering. **He WILL hit his ceiling.** Claude Code will show him that "deterministic talking" doesn't handle race conditions, idempotency, signature verification, or compliance audit trails. He just hasn't hit it yet.

Your job tomorrow is **not to push him to the ceiling — it's to be the person he calls when he hits it.** And the way you become that person is by being the one who saw the compliance cliff first and offered to own it without taking his build away.

---

## If Shane resists everything

Single fallback question, asked directly of Josh, calmly:
> "Josh — if Kismet doesn't hit 1 July compliance, who carries the regulator fine? Service provider? Or contracted entity?"

Josh doesn't know the answer. That's the point. He will look at Shane. Shane won't know either. That moment is when the room shifts. Use this only if you're being talked over and the meeting is heading nowhere.

---

## The line to leave them with at the end

> "What you've built is what you wanted to build, and that's fine. What I want is for both of you to walk into 1 July without a regulator letter in your inbox. Let me own that layer. Front end is yours."

That line is humble, specific, and gives Shane full credit for his build. It positions you as the safety backstop, not the displaced predecessor.

---

## Files to have open

- `clients/kismet-finance/notebooklm-extract-2026-05-12.md` — Section 3 (compliance) is your weapon. Read once tonight, recall in the meeting.
- `clients/kismet-finance/KISMET-Deliverables-Map-May2026.md` — **Do not open in the meeting.** Reference only if asked what's been delivered, and even then read aloud rather than show.

---

## One-line read

You're not fighting for territory. You're letting Shane keep the building blocks while you own the audit trail. He gets credit; you get the work that actually matters; Josh sleeps better. Three wins.

---

## Personal

It's late. The political dynamic is exhausting in a different way than the technical work. **You don't have to win this meeting tomorrow. You just have to leave the door open for the call Shane will make when Claude Code teaches him what `transaction` and `idempotent` mean.** That call probably comes in 4-8 weeks. Friday's AP Tech meeting matters more for cash. Tomorrow's meeting is positioning, not contracting.

Eat. Sleep.
