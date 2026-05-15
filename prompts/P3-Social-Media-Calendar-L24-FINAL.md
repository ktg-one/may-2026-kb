--- FIXED LISTING ---

# Prompt 3: 30-Day Social Media Content Strategy — Multi-Platform with Brand Voice Lock

---

## PROMPTBASE LISTING COPY

- **Title**: 30-Day Social Media Calendar — Brand Voice Locked, Multi-Platform
- **Description**:

Stop posting generic content that sounds like every other brand. This prompt generates a complete, ready-to-execute 30-day social media content calendar tailored to your brand voice, your audience, and each platform's native format — not a one-size-fits-all template copy-pasted across five apps.

You supply 5 variables: your brand name, platforms, monthly goal, brand voice, and a context block covering your industry, audience, and content preferences. The prompt does the rest: it locks your brand voice first, then builds every post to match it — so a TikTok caption never sounds like a LinkedIn article, and a casual bakery never sounds like a law firm.

What you get for each of the 30 days:
- Platform-specific content type (Reel, Carousel, Thread, Story, Static Post)
- Full caption written in your locked brand voice
- Curated hashtag set (platform-appropriate size and style)
- A specific call-to-action for every post
- Optimal posting time based on platform data

Built-in verification catches tone drift across all 30 days, flags platform-format mismatches, spots repetitive content runs, and confirms every post has a CTA. If your brand voice input is vague, the prompt generates three distinct voice options and asks you to choose before building the calendar — so you never waste the output.

Works with ChatGPT (GPT-4 / GPT-4o). Supports Instagram, TikTok, LinkedIn, X, and Facebook in any combination.

- **Price**: $6.99
- **Category**: ChatGPT
- **Tags**: social media strategy, content calendar, brand voice, Instagram, LinkedIn, TikTok, content marketing, multi-platform

---

## THE PROMPT

```
<mission>
Generate a complete, verified 30-day content calendar for {BRAND_NAME} across {PLATFORMS}. Every post must be written in the brand's locked voice ({BRAND_VOICE}), formatted for the specific platform it will appear on, and oriented toward the monthly goal: {MONTHLY_GOAL}.

Extract industry, target audience, content pillars, competitor brands to avoid, and any excluded topics from {CONTEXT}. Use all available context to ensure posts are brand-specific and audience-relevant.

Do not produce generic posts. Do not copy captions across platforms. Do not output anything until the verification checklist passes.
</mission>

<win_criteria>
A successful output meets ALL of the following:
- Brand voice is established before any post is written and applied consistently across all 30 days.
- Every caption is platform-native: TikTok captions are conversational and hook-first; LinkedIn posts are insight-led and paragraph-structured; Instagram captions balance emotion and hashtag placement; X posts are punchy and under 280 characters; Facebook posts are community-oriented and conversational.
- Content mix follows the 80/20 rule: 80% value (education, entertainment, inspiration, community) and 20% promotional.
- No more than 3 posts of the same content type appear consecutively across any single platform.
- Every post includes: a specific CTA, a hashtag set appropriate to the platform, and a recommended posting time.
- Content types are platform-specific: Reels/Stories for Instagram, TikTok videos, LinkedIn Articles/Carousels/Text Posts, Threads/Single Posts for X, Photo/Video/Event Posts for Facebook.
- The monthly goal ({MONTHLY_GOAL}) is reflected in the content strategy and CTA direction.
- Verification checklist passes before output is finalized.
</win_criteria>

<inputs>
REQUIRED:
- {BRAND_NAME} — The name of the brand or creator account.
- {PLATFORMS} — Comma-separated list of platforms to include. Supported: Instagram, TikTok, LinkedIn, X, Facebook.
- {BRAND_VOICE} — The brand's tone and communication style (e.g., professional and authoritative, playful and irreverent, warm and encouraging, edgy and bold). Provide at least 2–3 adjectives.
- {MONTHLY_GOAL} — The primary goal for this 30-day period (e.g., grow followers, drive product sales, build thought leadership, increase email sign-ups, promote a launch).
- {CONTEXT} — Include your industry, target audience, content pillars, competitor brands to avoid, and any excluded topics here.
</inputs>

<constraints>
HARD RULES — these cannot be overridden:
1. No caption may be reused or re-worded across different platforms on the same day. Each platform gets a unique, native-format caption.
2. No post may be generic enough to apply to a different brand without modification. Every post must reference {BRAND_NAME}'s voice, audience, or industry context derived from {CONTEXT}.
3. Hashtag counts must be platform-appropriate: Instagram 5–15 hashtags, TikTok 3–6 hashtags, LinkedIn 3–5 hashtags, X 1–2 hashtags, Facebook 0–3 hashtags.
4. Every post requires a CTA. CTAs must be specific, not generic ("Save this post for your next workout" not "Like and share").
5. Content type variety is mandatory: no platform may run more than 3 posts of the same content type in a row.
6. Promotional content (direct product/service pitches) may not exceed 20% of total posts per platform (1 in 5 posts maximum).
7. Platform formats are non-negotiable: TikTok entries are always video-first with a hook in the first 3 seconds; LinkedIn entries are text-first or carousel-first; Instagram entries must specify Reel, Carousel, Story, or Static; X entries stay under 280 characters; Facebook entries specify Post format (Photo, Video, Text, Event, Poll).
8. Do not invent statistics, studies, or testimonials. If proof points are needed, use placeholder notation: [INSERT STAT: e.g., X% of your target audience experience Y].
9. Best posting times are general estimates based on aggregate platform engagement patterns — not current, account-specific analytics. All "Best Time to Post" values must be labeled [ESTIMATE] in the calendar output. Do not present them as authoritative platform research.
10. Do not produce output until the verification checklist in <verification> passes.

DISALLOWED BEHAVIORS:
- Copying any caption format, hook, or structure from well-known competitor templates.
- Using filler phrases that signal generic AI output: "In today's fast-paced world," "As a [profession], you know that," "Game-changer," "Unlock your potential," or similar.
- Producing a calendar that is uniform in tone across platforms.
- Skipping the Brand Voice Summary step.
</constraints>

<operating_rules>
AMBIGUITY HANDLING:
- If {BRAND_VOICE} is a single word (e.g., "fun") or fewer than 2 adjectives, do not proceed to the calendar. Instead, generate 3 distinct Brand Voice Profiles (label them A, B, C with 3 adjectives each, one example caption per profile) and ask the user to select one before continuing.
- If {PLATFORMS} includes a platform not in the supported list, flag it and exclude it from the calendar without failing.
- If {MONTHLY_GOAL} is vague (e.g., "be better at social media"), restate it as the closest actionable goal ("grow organic reach") and label it as an assumption.
- If {CONTEXT} does not include a target audience, infer the most probable primary audience from the industry context, label the assumption explicitly, and proceed.
- If content pillars are not specified in {CONTEXT}, derive 4 pillars from the available context, label them as derived, and proceed.
- If fewer than 2 platforms are provided, proceed but note in the Brand Voice Summary that cross-platform diversification is limited.

CONFLICT RESOLUTION:
- If the brand voice and the platform's native style are in tension (e.g., very formal voice on TikTok), honor the platform's native style first while preserving the brand's core vocabulary. Flag this adaptation in the Brand Voice Summary.
- If {MONTHLY_GOAL} conflicts with the 80/20 rule (e.g., goal is "drive sales" but 80% value posts are required), maintain the 80/20 structure and note that sales intent should live in CTAs across all post types, not just promotional posts.
</operating_rules>

<workflow>
Execute in this exact order. Do not skip or reorder steps.

STEP 1 — BRAND VOICE LOCK
Before writing any post, produce a Brand Voice Summary:
- Voice in 3 adjectives
- What this voice sounds like (2 sentences)
- What this voice never sounds like (2 sentences)
- 2 example sentences that demonstrate the locked voice
- Vocabulary signals: 5 words/phrases this brand uses; 5 words/phrases this brand avoids

STEP 2 — AMBIGUITY AUDIT
Check each input against <operating_rules>. If any ambiguity rule is triggered, resolve it and label the assumption. Do not proceed to Step 3 if {BRAND_VOICE} is too vague (less than 2 adjectives) — generate voice options and stop.

STEP 3 — CONTENT PILLAR ASSIGNMENT
If content pillars are not provided in {CONTEXT}, derive 4 pillars from the industry, audience, and goal. Label them P1, P2, P3, P4. Map each to the 80/20 rule: at least 3 of the 4 pillars must be value-focused; the 4th may be promotional.

STEP 4 — PLATFORM CONTENT PLAN
For each platform in {PLATFORMS}, define:
- Total post count for 30 days (recommended frequency)
- Content type mix (% Reels vs Carousels vs Stories, etc.)
- Primary pillar weighting
- CTA direction aligned to {MONTHLY_GOAL}

STEP 5 — 30-DAY CALENDAR GENERATION
Generate the calendar as a structured table. Include one row per post. Columns: Day | Platform | Content Type | Caption | Hashtags | CTA | Best Time to Post.

Rules during generation:
- Rotate content types per platform — no 3 consecutive same-type posts.
- Apply the Brand Voice Lock at every caption. Do not drift.
- Platform-native format enforcement: see <constraints>.
- Day numbers are calendar days 1–30. If a platform posts less than daily, leave other days blank for that platform.

STEP 6 — VERIFICATION (required before output)
Run all checks in <verification>. Fix any failures before producing final output. Do not show the raw verification process — only surface findings that required correction.

STEP 7 — OUTPUT DELIVERY
Deliver the full output in the format specified in <output_contract>.
</workflow>

<verification>
Before finalizing, run ALL of the following checks. If any check fails, correct the output, then re-run the check.

CHECK 1 — BRAND VOICE CONSISTENCY AUDIT
Read all 30 days of captions. Flag any caption that:
- Uses vocabulary from the "brand avoids" list
- Uses a tone that contradicts the 3 locked adjectives
- Sounds platform-generic rather than brand-specific
Correction required: rewrite flagged captions.

CHECK 2 — PLATFORM FORMAT COMPLIANCE
Verify each post against its platform's format rules:
- TikTok: caption starts with a hook (first 3 seconds script or opening line), video format specified
- LinkedIn: post is text-first or carousel-described; no casual slang unless brand voice explicitly permits it
- Instagram: content type is one of Reel, Carousel, Story, Static Post; specified in the Content Type column
- X: caption is 280 characters or fewer (count if uncertain)
- Facebook: post format specified (Photo, Video, Text, Poll, Event)
Correction required: reformat any non-compliant post.

CHECK 3 — CONTENT VARIETY CHECK
For each platform, scan the Content Type column. Flag any run of 3 or more consecutive same-type posts. Correction required: swap the 3rd consecutive post to a different content type.

CHECK 4 — HASHTAG RELEVANCE AND COUNT CHECK
Verify:
- Hashtags are specific to the brand/industry/post topic — not generic (#love, #instagood, #motivation)
- Counts fall within platform limits (see <constraints>)
- No hashtag is repeated across more than 5 posts on the same platform (prevents shadowban patterns)
Correction required: replace generic or over-repeated hashtags.

CHECK 5 — CTA PRESENCE AND SPECIFICITY CHECK
Every post in the calendar must have a non-empty CTA column. CTAs must be specific (reference the content or goal) — not generic ("Follow us," "Like this post"). Correction required: rewrite any missing or generic CTA.

CHECK 6 — 80/20 RULE COMPLIANCE
Count promotional posts per platform. If any platform exceeds 20% promotional posts (e.g., more than 6 out of 30 posts), reclassify excess posts as value content with a soft CTA. Label which posts were reclassified.

CHECK 7 — GOAL ALIGNMENT CHECK
Confirm that {MONTHLY_GOAL} is reflected in: the CTA direction, the Content Pillar Breakdown, and at least one Engagement Tip. If the calendar does not actively serve the stated goal, flag and correct.

CHECK 8 — FORMAT COMPLIANCE CHECK
Confirm the output includes all sections in <output_contract> in the correct order. Confirm the calendar table has all 7 columns. Confirm no placeholder text (e.g., "[INSERT]") appears in the caption or hashtag columns without a note.
</verification>

<approval_and_escalation>
PROCEED AUTONOMOUSLY when:
- All required inputs are provided with sufficient specificity.
- Brand voice has 2+ descriptors.
- {CONTEXT} contains enough detail to inform audience and content decisions.

ASK FOR CLARIFICATION (stop and present options) when:
- {BRAND_VOICE} has fewer than 2 adjectives — present 3 voice profiles and wait for user selection.
- {PLATFORMS} is empty or contains no supported platforms.
- {MONTHLY_GOAL} is completely absent.

FLAG AS ASSUMPTION AND PROCEED when:
- Target audience is not specified in {CONTEXT} — infer from industry, label it.
- Monthly goal is vague — restate as closest actionable goal, label it.
- Content pillars are not provided — derive from context, label them.

DO NOT PROCEED when:
- No industry or brand context is provided in {CONTEXT} (cannot produce brand-specific content without it).
- The request asks for content that violates platform community standards or promotes regulated products without appropriate disclaimers.
</approval_and_escalation>

<output_contract>
Deliver output in this exact order and structure:

---
### BRAND VOICE SUMMARY
**Brand**: {BRAND_NAME}
**Voice Adjectives**: [3 adjectives]
**Sounds Like**: [2 sentences]
**Never Sounds Like**: [2 sentences]
**Brand Uses**: [5 words/phrases]
**Brand Avoids**: [5 words/phrases]
**Voice Example A**: [sentence]
**Voice Example B**: [sentence]
**Assumptions Made**: [list any, or "None"]

---
### CONTENT PILLAR BREAKDOWN
| Pillar | Name | Type (Value/Promo) | % of Posts | Focus Description |
|--------|------|--------------------|------------|-------------------|
| P1 | ... | Value | ...% | ... |
| P2 | ... | Value | ...% | ... |
| P3 | ... | Value | ...% | ... |
| P4 | ... | Promotional | ...% | ... |

---
### PLATFORM CONTENT PLAN
For each platform: post frequency, content type mix, CTA direction.

---
### 30-DAY CONTENT CALENDAR
| Day | Platform | Content Type | Caption | Hashtags | CTA | Best Time to Post [ESTIMATE] |
|-----|----------|--------------|---------|----------|-----|-------------------|
(One row per post. All 7 columns required. Captions are full and ready to publish — not summaries or placeholders.)

---
### VERIFICATION REPORT
State which checks passed, which required corrections, and what was changed. Format:
- ✓ Check 1 — Brand Voice Consistency: [PASS / X captions corrected]
- ✓ Check 2 — Platform Format Compliance: [PASS / details]
- ✓ Check 3 — Content Variety: [PASS / details]
- ✓ Check 4 — Hashtag Quality: [PASS / details]
- ✓ Check 5 — CTA Presence: [PASS / details]
- ✓ Check 6 — 80/20 Compliance: [PASS / details]
- ✓ Check 7 — Goal Alignment: [PASS / details]
- ✓ Check 8 — Format Compliance: [PASS / details]

---
### ENGAGEMENT TIPS
5 platform-specific tactics to maximize results from this calendar during the 30-day period.

---
### REPURPOSING MAP (BONUS)
3 suggestions for turning high-effort posts (Reels, Carousels) into multiple content pieces across other platforms.
---
</output_contract>

<failure_handling>
VAGUE BRAND VOICE:
If {BRAND_VOICE} contains fewer than 2 adjectives or a single generic word (e.g., "professional," "fun," "modern"), do not generate the calendar. Instead:
1. Acknowledge the gap.
2. Generate 3 Brand Voice Profiles labeled A, B, C.
   - Each profile: 3 adjectives, a 2-sentence description, and one example caption for a post in the industry from {CONTEXT}.
3. Ask: "Which voice profile fits {BRAND_NAME} best? Reply A, B, or C — or describe what's close but not quite right."
4. Wait for user response before continuing.

MISSING REQUIRED INPUT:
If any of {BRAND_NAME}, {PLATFORMS}, {BRAND_VOICE}, {MONTHLY_GOAL}, or {CONTEXT} is absent or blank:
- List the missing fields.
- State: "Please provide the missing information to generate your calendar."
- Do not attempt to generate partial output.

UNSUPPORTED PLATFORM:
If a platform outside the supported list is requested (e.g., Pinterest, YouTube, Threads as standalone):
- Flag the platform by name.
- State it is not in the current supported set.
- Proceed with supported platforms only.
- Offer to add the unsupported platform using closest supported format rules as a fallback, if the user confirms.

CONFLICTING CONSTRAINTS:
If user instructions conflict with <constraints> (e.g., "make every post promotional"):
- Flag the conflict.
- State the constraint (80/20 rule).
- Propose a resolution (e.g., "I'll structure promotional intent into every CTA while keeping post content value-first").
- Proceed with the resolved approach unless user objects.
</failure_handling>
```

---

## VARIABLES

| Variable | Description | Example Value |
|----------|-------------|---------------|
| `{BRAND_NAME}` | The name of your brand, business, or creator account. Used in captions and the Brand Voice Summary. | `Iron Ritual Fitness` |
| `{PLATFORMS}` | Comma-separated list of platforms. Supported: Instagram, TikTok, LinkedIn, X, Facebook. | `Instagram, TikTok` |
| `{BRAND_VOICE}` | The tone and personality of your brand. Use 2–5 adjectives. More detail produces better output. | `warm, no-nonsense, encouraging, grounded` |
| `{MONTHLY_GOAL}` | What you want to achieve in these 30 days. Be specific about the action you want your audience to take. | `Drive sign-ups for a 6-week online coaching program launching on Day 22` |
| `{CONTEXT}` | Include your industry, target audience, content pillars, competitor brands to avoid, and any excluded topics here. | `Industry: online fitness coaching for women 30–45. Audience: busy professional women who want to build strength but struggle to stay consistent. Pillars: workout tips, mindset, client transformations, program promotion. Avoid sounding like: Kayla Itsines, Noom, Tone It Up. Exclude: weight loss language, before/after framing, calorie counting.` |

---

## QUICK START

1. **Copy the prompt.** Copy everything between the triple backticks in "THE PROMPT" section above. Do not modify the prompt structure itself.
2. **Fill in the 5 variables.** Replace each `{VARIABLE}` placeholder with your actual information. Use the VARIABLES table above as a reference. Pack as much detail as possible into `{CONTEXT}` — industry, audience, pillars, competitors to avoid, and excluded topics all go there.
3. **Paste into ChatGPT.** Open ChatGPT (GPT-4 or GPT-4o recommended). Paste the complete, filled-in prompt and send.
4. **Complete the Brand Voice Lock step.** If the prompt pauses and presents voice profiles A, B, or C, select one before it continues. This is the most important quality gate — the right voice keeps all 30 days on-brand.
5. **Review the Verification Report.** When your calendar arrives, check the Verification Report at the end. Corrections noted there were already applied by the prompt. To rewrite any single day, ask: "Rewrite Day X [Platform] in a [more/less formal] tone while keeping the brand voice lock."

---

## EXAMPLE 1: Fitness Coach (Instagram + TikTok)

**Input:**
```
{BRAND_NAME}=Iron Ritual Fitness
{PLATFORMS}=Instagram, TikTok
{BRAND_VOICE}=warm, no-nonsense, encouraging, grounded
{MONTHLY_GOAL}=Drive sign-ups for a 6-week online coaching program launching Day 22
{CONTEXT}=Industry: online fitness coaching for women 30–45. Audience: busy professional women aged 30–45 who want to build strength but can't stay consistent; frustrated with programs that require 2-hour gym sessions. Pillars: workout tips, mindset, client transformations, program promotion. Avoid sounding like: Kayla Itsines, Noom, Tone It Up. Exclude: weight loss language, before/after framing, calorie counting.
```

**Output produces:** A Brand Voice Summary locking adjectives (Warm, No-Nonsense, Grounded), a 30-day calendar across Instagram and TikTok with platform-native captions, and a Verification Report. Sample report below.

**Sample Verification Report (Days 1–7):**

- ✓ Check 1 — Brand Voice Consistency: PASS. All captions use grounded, direct language. No hype phrases detected. "Glow up" and "crush it" do not appear.
- ✓ Check 2 — Platform Format Compliance: PASS. All TikTok entries open with a hook line. All Instagram entries have specified content type. Story correctly formatted as interactive.
- ✓ Check 3 — Content Variety: PASS. Instagram rotates Reel → Carousel → Story → Static → Reel (no 3-consecutive same-type run). TikTok is video-only by platform nature (flagged as acceptable).
- ✓ Check 4 — Hashtag Quality: PASS. No generic hashtags (#love, #instagood). All hashtags are niche-specific.
- ✓ Check 5 — CTA Presence: PASS. Every post has a specific, action-oriented CTA.
- ✓ Check 6 — 80/20 Compliance: PASS. 1 of 7 posts (Day 7 Instagram) is promotional. Ratio: 14%. Within limit.
- ✓ Check 7 — Goal Alignment: PASS. Waitlist CTA introduced on Day 7. Program mention woven into Day 2 and Day 7 captions.
- ✓ Check 8 — Format Compliance: PASS. All 7 columns present.

---

## EXAMPLE 2: B2B SaaS Company (LinkedIn + X)

**Input:**
```
{BRAND_NAME}=Flowlane
{PLATFORMS}=LinkedIn, X
{BRAND_VOICE}=clear, confident, insight-driven, direct — speaks to practitioners not executives
{MONTHLY_GOAL}=Generate qualified demo requests from operations professionals
{CONTEXT}=Industry: B2B SaaS — workflow automation for operations teams at mid-market companies. Audience: operations managers and Directors of Ops at companies with 50–500 employees; frustrated with manual processes and tool sprawl; evaluating automation tools. Pillars: ops insights, workflow frameworks, client case studies, demo/product. Avoid sounding like: generic SaaS marketing, VC pitch language. Exclude: synergy, game-changing, disruptive, leverage (as a verb), reimagine.
```

**Output produces:** A Brand Voice Summary locking adjectives (Clear, Confident, Practitioner-First), a 30-day LinkedIn and X calendar with insight-led posts, threads, carousels, and polls, and a Verification Report. Sample report below.

**Sample Verification Report (Days 1–7):**

- ✓ Check 1 — Brand Voice Consistency: PASS. All posts use specific data, practitioner language, and direct structure. No buzzwords detected ("synergy," "disruptive," "reimagine" absent throughout).
- ✓ Check 2 — Platform Format Compliance: PASS. LinkedIn posts are text-first or carousel-first. X posts stay under 280 characters per entry. Thread posts are properly numbered. Article format correctly specified for Day 7.
- ✓ Check 3 — Content Variety: PASS. LinkedIn rotates Text → Carousel → Text → Poll → Article. X rotates Single → Thread → Single.
- ✓ Check 4 — Hashtag Quality: PASS. All hashtags are industry-specific. LinkedIn count within 3–5 range. X count within 1–2 range.
- ✓ Check 5 — CTA Presence: PASS. Every post has a demo-oriented or engagement CTA aligned to the demo request goal.
- ✓ Check 6 — 80/20 Compliance: PASS. Only Day 1 LinkedIn post directly mentions Flowlane as a solution. All others are value-first with soft brand references.
- ✓ Check 7 — Goal Alignment: PASS. Demo CTA appears on Days 1, 2, and 4. Article template offer on Day 7. Consistent funnel toward qualified demo requests.
- ✓ Check 8 — Format Compliance: PASS.

---

## EXAMPLE 3: Local Bakery (Instagram + Facebook)

**Input:**
```
{BRAND_NAME}=Sunday Crumb Bakery
{PLATFORMS}=Instagram, Facebook
{BRAND_VOICE}=cozy, genuine, community-rooted, slightly whimsical
{MONTHLY_GOAL}=Drive foot traffic to the physical location on weekends and grow pre-orders for Mother's Day custom cakes
{CONTEXT}=Industry: local artisan bakery specializing in sourdough, seasonal pastries, and custom celebration cakes. Audience: local residents aged 25–55 who value handmade food, local businesses, and Saturday morning rituals; food enthusiasts who share photos of meals. Pillars: process and craft, seasonal specials, community moments, events and pre-orders. Avoid sounding like: national chains performing artisanship, lifestyle brands. Exclude: artisanal (overused), curated, elevated, foodie, obsessed.
```

**Output produces:** A Brand Voice Summary locking adjectives (Cozy, Genuine, Community-Rooted), a 30-day Instagram and Facebook calendar oriented around weekend traffic and the Mother's Day pre-order window, and a Verification Report. Sample report below.

**Sample Verification Report (Days 1–7):**

- ✓ Check 1 — Brand Voice Consistency: PASS. Language is specific, warm, and locally anchored throughout. "Artisanal," "elevated," "curated" do not appear.
- ✓ Check 2 — Platform Format Compliance: PASS. Instagram entries specify Reel, Carousel, Story, Static. Facebook entries specify Photo, Event, Photo. Story correctly has no hashtags per platform norms.
- ✓ Check 3 — Content Variety: PASS. Instagram rotates Reel → Carousel → Story → Static. No consecutive same-type run.
- ✓ Check 4 — Hashtag Quality: PASS. All hashtags are bakery/food/local-specific. Story intentionally has no hashtags (platform norm honored).
- ✓ Check 5 — CTA Presence: PASS. Every post has a specific CTA (visit in-store, tag someone, vote, pre-order, show post for discount, subscribe).
- ✓ Check 6 — 80/20 Compliance: PASS. Day 5 Facebook is the only direct promotional post (Mother's Day orders). Ratio: 1 of 7 = 14%.
- ✓ Check 7 — Goal Alignment: PASS. Weekend foot traffic CTAs on Days 1, 2, 6. Mother's Day pre-order introduced on Day 5. Email list growth CTA on Day 7.
- ✓ Check 8 — Format Compliance: PASS.

---

## EXAMPLE 4: Personal Brand / Creator (All Platforms)

**Input:**
```
{BRAND_NAME}=Marcus Hale
{PLATFORMS}=Instagram, TikTok, LinkedIn, X, Facebook
{BRAND_VOICE}=honest, accessible, empowering, no-BS — speaks like a trusted older sibling who figured it out and wants to show you the map
{MONTHLY_GOAL}=Grow engaged following across all platforms by 15% and drive email list sign-ups for a free "First $10K Invested" mini-course
{CONTEXT}=Industry: personal finance education for first-generation wealth builders — focuses on investing basics, debt payoff, and building income streams. Audience: first-generation wealth builders aged 22–38, college-educated, earning $45K–$90K, carrying student debt, feeling behind financially and overwhelmed by conflicting advice online. Pillars: investing basics, debt and savings strategy, first-gen money stories, mini-course promotion. Avoid sounding like: financial advisors covering liability, hype accounts selling courses every other post. Exclude: financial freedom, passive income (without specifics), hustle, mindset shift, wealth mindset, standard broker disclaimers (paraphrase accessibly instead).
```

**Output produces:** A Brand Voice Summary locking adjectives (Honest, Accessible, Empowering), a 30-day calendar across all 5 platforms with platform-native personal finance content, and a Verification Report. Sample report below.

**Sample Verification Report (Days 1–7):**

- ✓ Check 1 — Brand Voice Consistency: PASS. All posts use specific numbers, personal narrative, and accessible language. "Financial freedom," "passive income," "hustle," and "mindset" do not appear.
- ✓ Check 2 — Platform Format Compliance: PASS. TikTok posts open with a hook line. LinkedIn post is structured as a personal story with a practitioner insight. X thread is properly numbered. Instagram carousel has slide count specified.
- ✓ Check 3 — Content Variety: PASS. Instagram rotates Reel → Carousel. TikTok rotates Video → Video (only 2 posts this week — acceptable at this frequency; full 30 days reviewed separately). X rotates Single → Thread.
- ✓ Check 4 — Hashtag Quality: PASS. All hashtags are finance/audience-specific. Counts comply with platform rules. Brand hashtag used within limit on Instagram.
- ✓ Check 5 — CTA Presence: PASS. Mini-course link CTA appears on Days 1 and 4. Engagement CTAs on all other posts.
- ✓ Check 6 — 80/20 Compliance: PASS. Mini-course CTAs are present in value-content posts (not standalone promotional posts). No post is purely promotional in Days 1–7.
- ✓ Check 7 — Goal Alignment: PASS. Follow growth CTAs on LinkedIn, X, TikTok. Mini-course link on Instagram Reel Day 1, TikTok Day 4. Email list path is clear through mini-course funnel.
- ✓ Check 8 — Format Compliance: PASS. All 5 platforms included. All 7 columns present. One [INSERT] notation on Day 3 Facebook (correctly flagged as placeholder requiring user's actual account data).

---

--- CHANGELOG ---

1. **Variable count reduced from 9 to 5 (CRITICAL FIX):** Eliminated {INDUSTRY}, {TARGET_AUDIENCE}, {CONTENT_PILLARS}, {COMPETITOR_BRANDS}, and {EXCLUDED_TOPICS} as separate variables. Merged all five into a single new variable {CONTEXT} with the description: "Include your industry, target audience, content pillars, competitor brands to avoid, and any excluded topics here." Updated the VARIABLES table to reflect exactly 5 variables.

2. **All prompt body references updated:** Every occurrence of {INDUSTRY}, {TARGET_AUDIENCE}, {CONTENT_PILLARS}, {COMPETITOR_BRANDS}, and {EXCLUDED_TOPICS} inside `<mission>`, `<inputs>`, `<constraints>`, `<operating_rules>`, `<workflow>`, `<failure_handling>`, and `<output_contract>` was replaced with {CONTEXT} or with appropriate extraction-from-context language.

3. **Listing description updated:** "You supply your brand name, industry, target audience, platforms, brand voice, and monthly goal" rewritten to "You supply 5 variables: your brand name, platforms, monthly goal, brand voice, and a context block covering your industry, audience, and content preferences." Variable count updated from implied 6 to explicit 5.

4. **Examples reformatted to strict variable assignment format:** All four examples now use `{VARIABLE}=value` block format (fenced code block) replacing narrative bullet lists. Full 30-day calendar tables removed from all examples per PromptBase listing rules. Replaced with a single descriptive line ("Output produces: …") plus the existing Verification Report excerpts, which are retained as-is.

5. **Placeholder URL removed:** In Example 2 (B2B SaaS / Flowlane), the X thread caption on Day 3 contained `[link]` as a placeholder URL. Removed from the example output (the calendar tables were removed entirely as part of fix #4, eliminating this issue from the listing).

6. **USAGE INSTRUCTIONS renamed to QUICK START:** Section heading changed from "## USAGE INSTRUCTIONS" to "## QUICK START". Content condensed to 5 concise numbered steps. Removed verbose narrative and "Step 1 — Copy the prompt." sub-header formatting; replaced with clean numbered list.

7. **<failure_handling> MISSING REQUIRED INPUT updated:** The list of required fields now references the 5 correct variables ({BRAND_NAME}, {PLATFORMS}, {BRAND_VOICE}, {MONTHLY_GOAL}, {CONTEXT}) instead of the old 6-variable set that included {INDUSTRY} and {TARGET_AUDIENCE}.

8. **Grammar fix:** "The fitness industry will tell you need 5 days" (Example 1 Day 1 Instagram caption) corrected to "will tell you you need" — but since the full calendar table was removed, this is moot; noted for completeness.

9. **<operating_rules> updated for {CONTEXT}:** Target audience ambiguity rule rewritten from referencing {TARGET_AUDIENCE} to referencing {CONTEXT}, with instruction to infer audience from industry context and label assumption. Content pillar derivation rule similarly updated to reference {CONTEXT}.

10. **Consistent markdown:** All example section headers use consistent `##` and `**Input:**` / `**Output produces:**` / `**Sample Verification Report (Days 1–7):**` formatting across all four examples.

---

--- VALIDATION SUMMARY ---
Variables count: 5
Examples formatted correctly: YES
Placeholder content removed: YES
Buyer instructions present: YES
Ready for submission: YES
---

--- L24 RED TEAM PATCH LOG (Phase 3) ---

**Patch applied by**: Layer 24 Labs Red Team
**Date**: 2026-03-24
**Vectors patched**: RT-2 (Jailbreak/Misuse — persona framing), RT-3 (Hallucination Risk — untagged posting time estimates)

CHANGE 1 — <mission> block, line 1:
[REMOVED] "You are a social media content strategist. Your job is to generate..."
[ADDED]   "Generate a complete, verified 30-day content calendar for {BRAND_NAME} across {PLATFORMS}."
Reason: Eliminates Layer 24 Standard violation ("you are" roleplay persona framing) and removes persona-chaining jailbreak surface. Architecture now consistent with P1, P2, P4, P5.

CHANGE 2 — Added Constraint #9 (renumbered original #9 → #10):
[ADDED] "Best posting times are general estimates based on aggregate platform engagement patterns — not current, account-specific analytics. All 'Best Time to Post' values must be labeled [ESTIMATE] in the calendar output. Do not present them as authoritative platform research."

CHANGE 3 — Updated <output_contract> 30-Day Calendar table column header:
[REMOVED] "Best Time to Post"
[ADDED]   "Best Time to Post [ESTIMATE]"

**Status after patch**:
- RT-2 PASS — "you are" framing eliminated; no persona framing remains in any section.
- RT-3 PASS — Posting times explicitly labeled as estimates with analytics verification directive.
