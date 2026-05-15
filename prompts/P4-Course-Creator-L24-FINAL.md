--- FIXED LISTING ---

# Prompt 4: Complete Online Course Creator

---

## PROMPTBASE LISTING COPY

- **Title**: Complete Online Course Creator with Bloom's Verification
- **Description**:

Most course prompts give you a generic outline and leave you to figure out the rest. This one builds a complete, pedagogically sound online course from scratch — curriculum architecture, detailed lesson plans, module-by-module quiz banks, assessment rubrics, and instructor notes — all in a single run.

The differentiator: a built-in Bloom's Taxonomy verification engine. Before finalizing any output, the prompt audits every learning outcome against Bloom's measurable-verb standard, checks that each module builds on prerequisites from the previous one, and confirms that every quiz question traces back to a stated learning objective. Vague outcomes like "understand marketing" are automatically rewritten into measurable form and flagged for your review.

Works for any domain: technical skills, creative fields, corporate training, academic subjects, or personal development. Handles video, text-based, or hybrid delivery formats. Outputs are structured for direct use in course platforms like Teachable, Thinkific, Kajabi, or Notion-based courses.

Built with Layer 24 verification-first controls — meaning the output is not generated and dumped. It is checked against pedagogical integrity rules, time estimate plausibility, content gap detection, and assessment-outcome alignment before it ever reaches you.

Input your topic, audience, length, outcomes, and delivery format. Get a complete, instructor-ready course package in return. No filler. No generic modules. Every lesson has a purpose.

- **Price**: $7.99
- **Category**: ChatGPT
- **Tags**: `online course creator`, `curriculum design`, `lesson plan generator`, `Bloom's taxonomy`, `course outline`, `quiz generator`, `instructional design`, `eLearning`

---

## THE PROMPT

```
<mission>
Generate a complete, pedagogically sound online course package for the topic and audience provided. Every component — curriculum architecture, lesson plans, quiz questions, rubrics, and instructor notes — must be internally consistent, outcome-aligned, and verified against instructional design standards before output is finalized.
</mission>

<win_criteria>
- All learning outcomes use Bloom's Taxonomy measurable action verbs (e.g., "analyze," "construct," "evaluate") — no vague verbs like "understand" or "know"
- Each module explicitly builds on knowledge established in the previous module (prerequisite chain intact)
- Every quiz question maps to at least one stated learning outcome (assessment-outcome alignment confirmed)
- Time estimates are plausible given the delivery format and target audience
- No filler lessons: every lesson has a unique, specific learning objective that could not be merged with an adjacent lesson without loss
- The full course coherently addresses the stated {LEARNING_OUTCOMES}
</win_criteria>

<inputs>
- COURSE_TOPIC: {COURSE_TOPIC} — The subject matter of the course (e.g., "Python Programming," "Digital Marketing," "Watercolor Painting")
- TARGET_STUDENT: {TARGET_STUDENT} — Who this course is for (e.g., "absolute beginners with no coding experience," "intermediate marketing professionals," "college students aged 18–22")
- COURSE_LENGTH: {COURSE_LENGTH} — Duration or module count (e.g., "6 weeks," "8 modules," "12 hours of content")
- LEARNING_OUTCOMES: {LEARNING_OUTCOMES} — What students should be able to do after completing the course (e.g., "build and deploy a basic web scraper in Python," "create and manage a $500/month Facebook Ads campaign," "construct a monthly personal budget and identify areas for savings")
- DELIVERY_FORMAT: {DELIVERY_FORMAT} — How content is delivered (e.g., "video lectures + text summaries," "text-only written lessons," "hybrid: short videos + interactive exercises")
</inputs>

<constraints>
- Every learning outcome must contain a Bloom's Taxonomy measurable verb. If the user-supplied {LEARNING_OUTCOMES} contain vague verbs, rewrite them before proceeding and flag each rewrite with: [OUTCOME REWRITTEN — original: "..."; revised: "..."]
- No module may introduce concepts that require knowledge not yet established by a prior module. Flag any violation as: [PREREQUISITE CHAIN VIOLATION — Module X assumes knowledge from Module Y which appears later]
- Every quiz question must cite which learning outcome it assesses, using the format: [Tests Outcome: LO-#]
- Quiz questions must test application, analysis, or evaluation — not pure recall of definitions. At least 60% of quiz questions per module must be at Bloom's Level 3 (Apply) or higher
- Lesson time estimates must be realistic: a 10-minute video lesson cannot contain 45 minutes of content. Flag implausible estimates
- No lesson may be a rephrasing of an adjacent lesson. If content overlap is detected, merge or differentiate the lessons and note the change
- Do not reproduce copyrighted course structures, syllabi, or quiz banks verbatim
- Do not output placeholder text such as "add content here" or "[lesson TBD]"
</constraints>

<operating_rules>
- If {COURSE_TOPIC} is too broad to produce a coherent course (e.g., "marketing," "science," "business"), do not generate a full course. Instead, output: [SCOPE TOO BROAD] followed by exactly 3 narrower course scope suggestions with a one-sentence rationale for each. Then stop and ask the user to resubmit with a chosen scope
- If {LEARNING_OUTCOMES} are missing entirely, generate 4–6 draft outcomes based on the topic and audience, label them [DRAFT OUTCOMES — user-supplied outcomes were missing], and proceed using them
- If {COURSE_LENGTH} conflicts with the topic complexity (e.g., "advanced machine learning in 1 module"), flag the mismatch and propose a revised length
- If {TARGET_STUDENT} is ambiguous, state the assumption made and proceed
- Resolve all conflicts in favor of instructional integrity over length targets
</operating_rules>

<workflow>
Step 1 — INPUT AUDIT
- Restate all 5 inputs as received
- Run Bloom's Taxonomy check on all stated {LEARNING_OUTCOMES}. Rewrite any that fail and flag the change
- Check if {COURSE_TOPIC} is too broad. If yes, trigger scope-reduction protocol and stop
- Check if {COURSE_LENGTH} is plausible for the topic and audience. Flag conflicts

Step 2 — COURSE ARCHITECTURE
- Generate a Course Overview: title, target audience, total duration, delivery format, and a 3-sentence course description
- Generate a numbered Module List with: module title, learning focus (1 sentence), estimated duration, and prerequisite modules
- Run prerequisite chain check: confirm each module only requires knowledge from prior modules. Flag any violation

Step 3 — DETAILED LESSON PLANS (all modules)
For each lesson within each module, output:
  - Lesson Title
  - Bloom's Level (e.g., "Level 2 — Understand / Level 4 — Analyze")
  - Learning Objective (one measurable sentence beginning with a Bloom's verb)
  - Content Outline (3–6 bullet points of what is covered)
  - Student Activities (1–2 activities that require active engagement, not passive reading)
  - Recommended Resources (type and description — do not fabricate specific URLs or book ISBNs)
  - Estimated Duration

Step 4 — QUIZ BANK (per module)
For each module, generate 5–8 quiz questions:
  - Question text
  - Question type: Multiple Choice, Short Answer, or Scenario-Based
  - Bloom's Level of the question
  - [Tests Outcome: LO-#]
  - Answer key with brief rationale

Step 5 — FINAL ASSESSMENT RUBRIC
Generate a rubric for the end-of-course assessment covering:
  - Assessment task description
  - 4–5 grading criteria
  - Performance levels: Exemplary / Proficient / Developing / Beginning
  - Point values per criterion

Step 6 — INSTRUCTOR NOTES
For each module, include:
  - Common student misconceptions to address
  - Suggested discussion prompts or live Q&A topics
  - Pacing notes (where students typically fall behind)
  - Differentiation suggestions (how to support struggling students or challenge advanced ones)

Step 7 — VERIFICATION CHECKLIST (run before final output)
  □ Bloom's Taxonomy alignment: all outcomes use measurable verbs
  □ Prerequisite chain: each module only requires prior-module knowledge
  □ Assessment-outcome alignment: every quiz question cites its learning outcome
  □ Bloom's level distribution: at least 60% of quiz questions are Level 3+
  □ Time estimate plausibility: no lesson is under- or over-scoped
  □ Content gap detection: all stated {LEARNING_OUTCOMES} are addressed by at least one lesson
  □ No filler: every lesson has a unique objective distinguishable from adjacent lessons
  □ No placeholder text present in any section
Report results as: [VERIFICATION PASSED] or [VERIFICATION FLAG — item: description of issue]
</workflow>

<verification>
Before producing final output, the model must run and display the Step 7 Verification Checklist with a pass/flag result for each item. Any flagged item must be resolved before the course package is finalized. If a flag cannot be resolved within the current inputs, report it clearly with a recommended fix and continue outputting the best available version.
</verification>

<approval_and_escalation>
PROCEED AUTONOMOUSLY when:
- All 5 inputs are provided and the topic has an appropriate scope
- Learning outcomes contain vague verbs (auto-rewrite them and flag)
- Minor gaps exist (fill with reasonable instructional defaults and label assumptions)

ASK FOR CLARIFICATION when:
- {COURSE_TOPIC} is so broad that 3 scope suggestions are genuinely ambiguous (present options and stop)
- {TARGET_STUDENT} contains contradictory descriptors (e.g., "beginners who already have 5 years of experience")

REFUSE AND EXPLAIN when:
- The request is for copyrighted curriculum content to be reproduced verbatim
- The topic requires professional licensure to teach safely (e.g., medical diagnosis, legal advice) — flag the risk and suggest reframing as an awareness course only
</approval_and_escalation>

<output_contract>
Produce output in exactly this sequence, using these exact section headers:

---
## VERIFICATION CHECKLIST RESULTS
[checklist output]

---
## COURSE OVERVIEW
[title, audience, duration, format, 3-sentence description]

---
## MODULE LIST
[numbered table or list with title, focus, duration, prerequisites]

---
## DETAILED LESSON PLANS
### Module [N]: [Title]
#### Lesson [N.N]: [Title]
[structured lesson fields]

---
## QUIZ BANK
### Module [N] Quiz
[questions with answer key]

---
## FINAL ASSESSMENT RUBRIC
[rubric table]

---
## INSTRUCTOR NOTES
### Module [N] — Instructor Notes
[notes fields]

---
All text must be in English unless a different language is explicitly stated in {TARGET_STUDENT}.
No section may be omitted. No placeholder text permitted.
```

---

## VARIABLES

| Variable | Description | Example Value |
|---|---|---|
| `{COURSE_TOPIC}` | The specific subject matter of the course. Should be narrow enough to address in the specified course length. Too broad (e.g., "business") will trigger a scope-reduction prompt. | `"Introduction to Python Programming"` |
| `{TARGET_STUDENT}` | Who the course is designed for. Include skill level, context, and any relevant background. The more specific, the better the lesson calibration. | `"Complete beginners with no prior coding experience, aged 18–35, motivated by career change"` |
| `{COURSE_LENGTH}` | Total course duration or module count. Can be expressed as weeks, modules, or total hours. | `"6 weeks (1 module per week, 3 lessons per module)"` |
| `{LEARNING_OUTCOMES}` | What students will be able to do by course end. Use action verbs if possible — the prompt will rewrite vague ones and flag the change. | `"Write and run basic Python scripts; build a simple data analysis pipeline using pandas; debug common Python errors independently"` |
| `{DELIVERY_FORMAT}` | How lessons are delivered to students. Affects activity design, resource recommendations, and time estimates. | `"Hybrid: short video lectures (5–10 min each) + written lesson notes + hands-on coding exercises"` |

---

## EXAMPLE 1: "Introduction to Python Programming" (Beginners, 6 Weeks)

{COURSE_TOPIC}=Introduction to Python Programming
{TARGET_STUDENT}=Complete beginners with no coding experience, career-changers aged 22–40
{COURSE_LENGTH}=6 weeks, 1 module per week, 3 lessons per module
{LEARNING_OUTCOMES}=Students will write and execute Python scripts; use variables, loops, and functions; read and write files; build a simple command-line tool
{DELIVERY_FORMAT}=Hybrid — 8-minute video lectures + written lesson summaries + coding exercises in a browser-based editor

**Verification Checklist Results (Summary):**
All 8 checklist items PASSED. Outcomes rewritten to measurable verbs; prerequisite chain intact (variables → loops → functions); all quiz questions tagged to outcomes; 4 of 6 questions at Level 3+; time estimates consistent with format; all 4 outcomes addressed; no filler; no placeholder text.
**[VERIFICATION PASSED]**

---

## EXAMPLE 2: "Digital Marketing for Small Business" (Entrepreneurs, 4 Weeks)

{COURSE_TOPIC}=Digital Marketing for Small Business Owners
{TARGET_STUDENT}=Small business owners and solo entrepreneurs with no formal marketing background, currently running or launching a local or online business
{COURSE_LENGTH}=4 weeks, 1 module per week, 4 lessons per module
{LEARNING_OUTCOMES}=Students will build a social media content calendar; set up and launch a Google Business Profile; write and A/B test two email subject lines; measure campaign performance using free analytics tools
{DELIVERY_FORMAT}=Text-based lessons with embedded screenshots and step-by-step walkthroughs; optional short video demos for platform-specific tasks

**Verification Checklist Results (Summary):**
All 8 checklist items PASSED. Outcomes use measurable verbs; brand identity → content → paid/email → analytics prerequisite chain intact; all quiz questions tagged to outcomes; 5 of 7 questions at Level 3+; text lesson time estimates plausible; all 4 outcomes addressed; no filler; no placeholder text.
**[VERIFICATION PASSED]**

---

## EXAMPLE 3: "Personal Finance 101" (College Students, 8 Modules)

{COURSE_TOPIC}=Personal Finance 101
{TARGET_STUDENT}=College students aged 18–23, most with no financial education, many managing their own money for the first time
{COURSE_LENGTH}=8 modules, self-paced, approximately 90 minutes per module
{LEARNING_OUTCOMES}=Students will construct a monthly personal budget; differentiate between good debt and high-risk debt; open and configure a basic investment account; calculate compound interest over 10 and 30-year horizons; identify and avoid three common financial predators (payday loans, overdraft traps, credit card minimum payment cycles)
{DELIVERY_FORMAT}=Text-only lessons with embedded calculation exercises and scenario worksheets; no video required

**Verification Checklist Results (Summary):**
All 8 checklist items PASSED. Outcomes use measurable verbs (construct, differentiate, calculate, identify); budgeting → debt → investing → protection prerequisite chain intact; all quiz questions tagged to outcomes; Bloom's level distribution met; 90 min/module plausible for text + worksheet format; all 5 outcomes mapped to specific modules; no filler; no placeholder text.
**[VERIFICATION PASSED]**

---

## EXAMPLE 4: "Leadership Skills for New Managers" (Corporate, 4 Modules)

{COURSE_TOPIC}=Leadership Skills for New Managers
{TARGET_STUDENT}=Employees recently promoted to their first people-manager role, typically aged 25–40, managing teams of 2–8 people in corporate or startup environments
{COURSE_LENGTH}=4 modules, approximately 2 hours per module, designed for self-paced completion over 4 weeks
{LEARNING_OUTCOMES}=Students will conduct a structured 1-on-1 meeting using a documented agenda; deliver constructive feedback using the SBI (Situation-Behavior-Impact) framework; identify and respond to one team conflict scenario using a mediation protocol; delegate a task with a written brief that includes success criteria and a check-in schedule
{DELIVERY_FORMAT}=Hybrid — short video scenarios (5–8 min, showing real workplace situations) + written reflection prompts + role-play scripts for peer practice

**Verification Checklist Results (Summary):**
All 8 checklist items PASSED. Outcomes use Level 3+ verbs (conduct, deliver, identify, delegate); self-awareness → communication → conflict/feedback → delegation prerequisite chain intact; all quiz scenarios mapped to stated outcomes; all 5 questions at Level 3 or Level 4; 2 hrs/module with video + reflection + role-play is appropriate; all 4 outcomes fully addressed; no filler; no placeholder text.
**[VERIFICATION PASSED]**

---

## QUICK START

1. **Copy the full prompt** from the section above (everything between the triple backticks) and paste it into a new ChatGPT conversation (GPT-4o recommended).

2. **Replace all five variables** with your specific details:
   - `{COURSE_TOPIC}` → your course subject
   - `{TARGET_STUDENT}` → your audience's skill level and context
   - `{COURSE_LENGTH}` → number of weeks, modules, or total hours
   - `{LEARNING_OUTCOMES}` → what students should be able to do when they finish
   - `{DELIVERY_FORMAT}` → how content reaches students (video, text, hybrid)

3. **Send the prompt and review the Verification Checklist first.** The prompt outputs its quality-control results before the course content. If any item is flagged, read the note — it tells you exactly what needs to be adjusted. In most cases, the prompt auto-corrects and continues.

4. **If your topic is flagged as "too broad,"** the prompt will give you 3 narrower alternatives. Choose one, update `{COURSE_TOPIC}`, and resubmit. This is a feature, not a failure — broad topics produce incoherent courses.

5. **Use the output directly.** The lesson plans, quizzes, rubric, and instructor notes are structured for immediate use in Teachable, Thinkific, Kajabi, Notion, or any course platform. Copy individual sections as needed — each is self-contained and labeled.

**Pro tip:** For long courses (8+ modules), run the prompt twice: once to generate Modules 1–4, then resubmit with a note specifying "continue from Module 5, maintaining the prerequisite chain established in Modules 1–4" to keep context intact within ChatGPT's context window.

---

--- CHANGELOG ---

1. **Examples reformatted (all 4):** Converted input variable sections from bullet/narrative format (`- \`{VARIABLE}\`: value`) to strict `{VARIABLE}=value` assignment format, one variable per line, no backticks, no leading dashes.

2. **Verbose example output removed:** Removed full sample output excerpts from all 4 examples (module lists, detailed lesson plans, quiz banks, instructor notes). Replaced with a concise "Verification Checklist Results (Summary)" paragraph per example, retaining the pass/fail status and key evidence from each checklist.

3. **Section renamed — USAGE INSTRUCTIONS → QUICK START:** Heading renamed for PromptBase convention compliance. Body text preserved and lightly tightened for concision; numbered structure (1–5) retained.

4. **Link audit — no action required:** All referenced URLs/resources confirmed real: `python.org/downloads` (official Python download page), `Replit.com` (browser-based IDE), W3Schools (referenced by name only), Investopedia (referenced by name only), `investor.gov` (U.S. SEC calculator), HBR (referenced by name only), Center for Creative Leadership (referenced by name only). No placeholder or broken URLs present.

5. **Formatting consistency:** Ensured consistent heading levels across all 4 example sections. Removed inconsistent triple-dash separators that appeared inside example content blocks. Standardized bold labels in Verification Checklist summaries.

6. **Grammar/copy fix — Example 4 inputs:** Changed "typically 25–40" to "typically aged 25–40" for grammatical completeness.

7. **No instruction conflicts detected:** All prompt sections (`<constraints>`, `<operating_rules>`, `<workflow>`, `<approval_and_escalation>`, `<output_contract>`) are internally consistent. No contradictions found.

8. **Variable count confirmed compliant:** 5 variables total — `{COURSE_TOPIC}`, `{TARGET_STUDENT}`, `{COURSE_LENGTH}`, `{LEARNING_OUTCOMES}`, `{DELIVERY_FORMAT}`. No merge required.

---

--- VALIDATION SUMMARY ---

Variables count: 5
Examples formatted correctly: YES
Placeholder content removed: YES
Buyer instructions present: YES
Ready for submission: YES
