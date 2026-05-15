--- FIXED LISTING ---

# Prompt Engineer Pro — PromptBase Listing

---

## PROMPTBASE LISTING COPY

**Title**: Prompt Engineer Pro: Build Verified, Production-Ready Prompts

**Description**:

Most "prompt engineer" prompts on PromptBase give you one thing: a reworded version of whatever you typed in. They dress it up with "You are an expert..." and call it done. That's not prompt engineering. That's autocomplete.

Prompt Engineer Pro is different — structurally.

This prompt uses a verification-first architecture that transforms your rough task idea into a complete, production-grade prompt artifact. Every output includes: a precise mission statement, measurable win criteria, explicit constraints and disallowed behaviors, a pre-output verification checklist, approval and escalation logic for edge cases, a concrete output contract (so you always know exactly what format you'll get), a success example, a failure example, and a set of acceptance tests you can use to evaluate any response.

That's not just a prompt. That's a prompt system.

Whether you're building prompts for cold email, legal document summarization, content creation, data analysis, customer support, meal planning, or product copy — this generator produces a structured artifact you can paste directly into ChatGPT and run repeatedly with consistent results.

You describe your task in plain English. Prompt Engineer Pro handles the engineering.

No templates. No guesswork. No "be creative and detailed." Just a structured, testable, reusable prompt that works the first time and keeps working.

**Price**: $9.99

**Category**: ChatGPT

**Tags**: prompt engineer, prompt generator, ChatGPT prompts, prompt writing, AI workflow, productivity, prompt builder, meta-prompt

---

## THE PROMPT

```
# PROMPT ENGINEER PRO — Verification-First Prompt Builder

<mission>
Transform the buyer's task description into a complete, production-grade prompt artifact that is specific, testable, and immediately usable in ChatGPT.

Your job is NOT to reword the request or add "You are an expert" framing.
Your job is to engineer a structured prompt with a clear mission, measurable win criteria, explicit constraints, a pre-output verification layer, escalation logic, a concrete output contract, and built-in acceptance tests.

The final output must be a prompt the buyer can copy and paste directly into ChatGPT and get reliable, consistent results from — on the first run and every run after.
</mission>

<your_task_inputs>
TASK_DESCRIPTION: {TASK_DESCRIPTION}
DOMAIN (optional): {DOMAIN}
RISK_LEVEL (optional — low / medium / high): {RISK_LEVEL}
</your_task_inputs>

<what_these_inputs_mean>
- TASK_DESCRIPTION: Plain English description of what you want a prompt to do. Example: "I need a prompt that writes cold outreach emails for B2B SaaS companies."
- DOMAIN: The field, industry, or subject area (e.g., marketing, legal, healthcare, e-commerce). Leave blank if not applicable.
- RISK_LEVEL: How much damage a bad output could cause. Low = cosmetic/editorial. Medium = business-facing content. High = legal, financial, medical, compliance-sensitive. Leave blank and the generator will infer.
</what_these_inputs_mean>

<operating_rules>
- Prioritize structure and testability over style and flair.
- Do not use vague roleplay framing ("Imagine you are...") as a substitute for a real mission statement.
- Do not produce a prompt that relies on "be smart" or "be creative" as primary instructions.
- Convert every ambiguous request into bounded, measurable prompt logic.
- Label every assumption you make explicitly — do not hide them.
- If RISK_LEVEL is high or domain is sensitive (legal, medical, financial), include escalation/refusal logic.
- Keep the final prompt copy-pasteable and free of internal commentary.
- If critical information is missing, state the minimum safe assumptions and proceed — do not stall.
</operating_rules>

<generator_workflow>
Step 1 — PRE-FLIGHT AUDIT
Before generating, briefly state:
- The actual objective in one sentence
- The prompt type (choose from: generation, extraction, analysis, transformation, grading, planning, workflow, research, or mixed)
- Any missing fields that would significantly affect quality
- The minimum safe assumptions you are making (label each one clearly)

Step 2 — BUILD THE PROMPT ARTIFACT
Generate the complete prompt artifact using the exact structure in <required_output_structure> below.
Do not output planning, brainstorming, or visible reasoning — go directly to the artifact.

Step 3 — VALIDATION SUITE
After the prompt artifact, generate:
- One success example (realistic input → what good output looks like)
- One failure example (bad input or misuse → what breaks and why)
- One acceptance test checklist (5–8 checks a reviewer can use to grade the prompt's outputs)
</generator_workflow>

<required_output_structure>
Generate the prompt artifact using EXACTLY these sections in this order:

---
PROMPT TITLE: [A precise, descriptive name for the prompt]

PROMPT PURPOSE:
[2–3 sentences explaining what this prompt does, when to use it, and what type of task it handles.]

MISSION:
[One clear imperative sentence stating what the model must accomplish.]

WIN CRITERIA:
[Bullet list of what counts as a successful output — measurable, specific, not vague.]

INPUTS:
[Required inputs with short descriptions. Optional inputs labeled as such.]

CONSTRAINTS:
[Non-negotiable rules, exclusions, format requirements, and explicitly disallowed behaviors.]

OPERATING RULES:
[How to handle ambiguity, missing information, conflicting instructions, unsupported claims, and edge cases.]

WORKFLOW:
[Ordered numbered steps the model must follow to produce the output.]

VERIFICATION (run before finalizing output):
[Checklist the model must complete before delivering the final answer. Must include:
- Assumption check: Are all assumptions labeled?
- Contradiction check: Does the output conflict with any constraint?
- Coverage check: Have all required output sections been produced?
- Format check: Does the output match the output contract?
- Risk check (if RISK_LEVEL is medium or high): Does any claim require evidence that isn't available?]

APPROVAL AND ESCALATION LOGIC:
[Define when the model should: (a) proceed automatically, (b) ask a clarifying question, (c) refuse, (d) add a disclaimer.]

OUTPUT CONTRACT:
[Exact list of output sections, formatting rules, and length guidance. The buyer should know precisely what they will receive every time they run this prompt.]

FAILURE HANDLING:
[What the model must do when inputs are incomplete, ambiguous, conflicting, or when the task cannot be completed safely.]
---
</required_output_structure>

<quality_bar>
The generated prompt must be:
- Specific enough to execute repeatedly without drift
- Structured enough that different users get consistent output shapes
- Strict enough to catch common failure modes before they reach the buyer
- Readable enough that a non-technical buyer can understand and customize it
- Complete enough to paste into ChatGPT and get a usable result immediately
</quality_bar>

<final_output_format>
Return your output in this order — no exceptions:

## PRE-FLIGHT AUDIT
[Objective | Prompt Type | Missing Fields | Assumptions]

## THE PROMPT ARTIFACT
[Full prompt using the required structure above — formatted cleanly for copy-paste]

## VALIDATION SUITE
[Success Example | Failure Example | Acceptance Tests]
</final_output_format>
```

---

## VARIABLES

| Variable | Description | Example |
|---|---|---|
| `{TASK_DESCRIPTION}` | Plain English description of what you want a ChatGPT prompt to do. This is the core input — be as specific or as rough as you like; the generator will handle the engineering. | `I need a prompt that writes cold outreach emails for B2B SaaS companies targeting mid-market HR teams.` |
| `{DOMAIN}` | Optional. The field, industry, or subject area the prompt will operate in. Helps the generator apply domain-appropriate constraints and risk calibration. Leave blank if general-purpose. | `B2B SaaS marketing` / `legal` / `healthcare` / `e-commerce` |
| `{RISK_LEVEL}` | Optional. How much harm a bad output could cause. `low` = cosmetic/creative. `medium` = business-facing, reputational. `high` = legal, medical, financial, compliance-sensitive. If omitted, the generator infers from context. | `low` / `medium` / `high` |

---

## EXAMPLE 1: Cold Outreach Emails for B2B SaaS

{TASK_DESCRIPTION}=I need a prompt that writes cold outreach emails for B2B SaaS companies targeting mid-market HR teams
{DOMAIN}=B2B SaaS sales
{RISK_LEVEL}=medium

The generator produces a structured cold outreach email prompt for targeting HR decision-makers at mid-market companies. The output artifact enforces a 100–180 word email with a problem-first opening, a single value proposition, and a low-friction CTA — and includes explicit constraints against fabricated statistics or generic openers.

**Acceptance Tests:**
- [ ] Subject line is under 50 characters and contains no all-caps words
- [ ] Opening sentence does not use a generic filler opener
- [ ] Email body is between 100–180 words
- [ ] No statistics or customer names appear that were not in the inputs
- [ ] CTA is a single ask requiring 20 minutes or less of the prospect's time
- [ ] No feature list appears — only outcome/problem language
- [ ] Assumptions are labeled if any input was missing or inferred

---

## EXAMPLE 2: Legal Contract Summarizer (Plain English)

{TASK_DESCRIPTION}=I need a prompt that summarizes legal contracts into plain English so non-lawyers can understand the key terms, risks, and obligations
{DOMAIN}=Legal
{RISK_LEVEL}=high

The generator produces a high-risk-calibrated contract summarization prompt with a mandatory 10-section output structure (including red flags, questions to ask a lawyer, and a legal disclaimer). All ambiguous or one-sided clauses are flagged explicitly, and the prompt refuses to offer a signing recommendation.

**Acceptance Tests:**
- [ ] Output contains all 10 required sections
- [ ] No legal jargon appears without a plain-English translation
- [ ] Every financial obligation in the contract appears in the FINANCIAL TERMS section
- [ ] Legal disclaimer is present and clearly states this is not legal advice
- [ ] Every ambiguous or unusual clause is flagged — not silently paraphrased
- [ ] Output does not contain a recommendation to sign or not sign
- [ ] Questions to Ask Your Lawyer section contains at least 3 items

---

## EXAMPLE 3: Weekly Meal Plan Generator (Dietary Restrictions)

{TASK_DESCRIPTION}=I need a prompt that creates weekly meal plans based on a person's dietary restrictions and preferences
{DOMAIN}=Health and nutrition / consumer lifestyle
{RISK_LEVEL}=low

The generator produces a meal planning prompt that covers all 7 days (3 meals each), enforces zero-exception compliance with dietary restrictions, varies protein sources across the week, and includes a consolidated shopping list organized by grocery section. No medical claims are permitted.

**Acceptance Tests:**
- [ ] Every meal is verified against the dietary restrictions before inclusion
- [ ] No protein source appears more than 3 times in the weekly plan
- [ ] No meal requires more than 60 minutes active prep unless labeled [WEEKEND MEAL]
- [ ] Shopping list is organized by grocery section and de-duplicated
- [ ] Conflicts between preferences and restrictions are noted — not silently resolved
- [ ] No medical claims appear anywhere in the output
- [ ] All 7 days × 3 meals = 21 meal entries are present

---

## EXAMPLE 4: E-Commerce Product Description Generator

{TASK_DESCRIPTION}=I need a prompt that generates product descriptions for an e-commerce store — optimized for conversions, not just SEO
{DOMAIN}=E-commerce / copywriting
{RISK_LEVEL}=medium

The generator produces a conversion-focused product description prompt that outputs a short hook (under 50 words), a long description, 5–7 feature/benefit bullets, and a CTA line. All claims must be derived from the provided product details — no invented specs, no unsubstantiated superlatives — with FTC-risk flagging built in.

**Acceptance Tests:**
- [ ] Hook is under 50 words and does not open with the product name
- [ ] Every bullet contains both a feature AND a stated benefit
- [ ] No claim appears in the description that was not in PRODUCT_DETAILS
- [ ] No superlative ("best," "world's finest") appears without substantiation or a [CLAIM REQUIRES SUBSTANTIATION] flag
- [ ] Tone matches BRAND_TONE if provided — or is labeled as inferred
- [ ] Output contains all 4 required sections: hook, long description, bullets, CTA
- [ ] Passive voice does not appear in the hook or bullets

---

## QUICK START

1. **Copy the prompt.** Copy the full prompt text from the "THE PROMPT" section above and paste it into a new ChatGPT conversation (GPT-4 or GPT-4o recommended).

2. **Fill in your variables.** Replace the three placeholders in the `<your_task_inputs>` block:
   - `{TASK_DESCRIPTION}` — describe in plain English what you want a prompt to do (e.g., "I need a prompt that summarizes YouTube transcripts into newsletter content")
   - `{DOMAIN}` — optional; enter your industry or subject area, or leave it blank
   - `{RISK_LEVEL}` — optional; enter `low`, `medium`, or `high`, or leave it blank and the generator will infer

3. **Receive your prompt artifact.** ChatGPT will return a complete, structured prompt artifact — including a mission, win criteria, constraints, verification checklist, output contract, and acceptance tests. This is your production-ready prompt.

4. **Use your new prompt immediately.** Open a new ChatGPT conversation, paste the generated artifact, and fill in its inputs with your actual content. The prompt is engineered to produce consistent, structured results across repeated runs.

5. **Iterate if needed.** To adjust the output format, tighten constraints, or add domain-specific rules, paste the generated prompt back into Prompt Engineer Pro and describe the change. It will re-engineer accordingly.

---

--- CHANGELOG ---

1. **Examples 1–4 rewritten to variable assignment format.** Removed all bullet/narrative "Input Variables" blocks. Each example now opens with `{VARIABLE}=value` assignments on their own lines, per PromptBase structured format.

2. **Verbose "Full Generated Prompt Artifact Output" sections removed from all 4 examples.** These sections (PRE-FLIGHT AUDIT, THE PROMPT ARTIFACT, VALIDATION SUITE) totaled ~400+ lines and are not appropriate for a PromptBase listing. Replaced with a 2–3 sentence output description per example.

3. **Acceptance Tests retained and trimmed.** The Acceptance Tests checklist from each example's VALIDATION SUITE was preserved as the only list element per example, providing verifiable quality signals without the full artifact.

4. **"USAGE INSTRUCTIONS" renamed to "QUICK START."** Section header updated per repair rule 4.

5. **QUICK START text tightened.** Removed redundant phrasing ("Send and receive your prompt artifact" step merged into step 3 wording). Compressed wordy clauses across all 5 steps while preserving all instructional content.

6. **Consistent markdown formatting applied.** Removed stray `---` horizontal rules inside example sections that created visual noise. Ensured uniform `##` heading hierarchy throughout.

7. **Minor grammar and phrasing cleanup.** "Send and receive" step reworded for clarity. Passive constructions in QUICK START steps tightened to active voice.

8. **No variable merges required.** Variable count was already compliant at 3 (`{TASK_DESCRIPTION}`, `{DOMAIN}`, `{RISK_LEVEL}`).

9. **No placeholder URLs found.** Clean pass — no repair needed.

10. **No instruction conflicts detected.** The operating rules, constraints, and output contract are internally consistent across the prompt and all examples.

---

--- VALIDATION SUMMARY ---
Variables count: 3
Examples formatted correctly: YES
Placeholder content removed: YES
Buyer instructions present: YES
Ready for submission: YES
