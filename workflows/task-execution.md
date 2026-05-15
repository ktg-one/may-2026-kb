# Agent Protocol — Task Execution

**Document:** agent-protocols/task-execution.md
**KB Version:** 1.0
**Last Updated:** 2026-02-27
**Source:** AGENTS.md, STRUCTURED_AGENTS_KB.md, KANBAN - Good AI Tasks.md

---

## Purpose

This document defines the exact workflow all agents must follow when picking up, executing, and completing tasks from the Kanban board. Deviating from this workflow breaks accountability and may cause task conflicts between agents.

---

## The Kanban Board

**Location:** `C:/Users/kevin/projects/Knowledge Base/NAS/KANBAN - Good AI Tasks.md`

**Columns:**
- `## Not Started` — tasks available for pickup
- `## In Progress` — tasks being actively worked
- `## Done` — completed tasks

**Activity Log:** At the bottom of the file. All sign-in and sign-out events are appended here.

---

## Task Card Format

Each task card in the Kanban file follows this format:

```markdown
- [ ] **Task Name**
  - **Priority:** High / Medium / Low
  - **Status:** Not Started / In Progress / Done
  - **Assignee:** Person Name(s)
  - **Phase:** Phase 1: Foundation / Phase 2: Enforcement & Automations / etc.
  - **Agent Confirmation:** [Agent ID goes here when claimed]
  - **Sign In:** [Agent ID @ YYYY-MM-DD HH:MM]
  - **Sign Out:** [Agent ID @ YYYY-MM-DD HH:MM]
```

---

## Full Task Execution Lifecycle

### Phase 1: Task Selection

**Rule:** Respect sequence numbers. Lower sequence numbers (tasks listed earlier in the Not Started column) have higher priority and must be done first.

1. Read the entire Kanban board
2. Check the `## In Progress` column — avoid tasks already claimed by another agent
3. Select the highest-priority available task from `## Not Started`
4. If no tasks are available, enter standby mode and notify Kevin Tan

**Priority Rules:**
- Never work on Vertex AI / GCP tasks until all non-AI-platform tasks above them are Done
- Documentation tasks (Priority 5 tier) are parallelizable — multiple agents can work them simultaneously without conflict

---

### Phase 2: Task Claim

Update the Kanban file atomically — do not leave the card in a half-updated state.

**Actions to take:**
1. Move the task card from `## Not Started` to `## In Progress`
2. Set `**Status:**` to `In Progress`
3. Set `**Agent Confirmation:**` to your Agent ID
4. Set `**Sign In:**` to `[Agent ID] @ [YYYY-MM-DD HH:MM]`

**Example after claiming:**
```markdown
- [ ] **AI Knowledge Base - Phase 1**
  - **Priority:** Medium
  - **Status:** In Progress
  - **Assignee:** Kevin Tan, Admin Kismet
  - **Phase:** Phase 2: Enforcement & Automations
  - **Agent Confirmation:** Claude-Code-Sonnet-4-6
  - **Sign In:** Claude-Code-Sonnet-4-6 @ 2026-02-27 05:51
  - **Sign Out:**
```

---

### Phase 3: Sign In (mem0)

Immediately after claiming the task, log to mem0:

```
[Agent ID] SIGN IN — Task: [Task Name] — [YYYY-MM-DD HH:MM]
```

**Example mem0 record:**
```
Claude-Code-Sonnet-4-6 SIGN IN — Task: AI Knowledge Base - Phase 1 — 2026-02-27 05:51
```

Also append to the Activity Log at the bottom of the Kanban file:
```markdown
- [Agent ID] - [YYYY-MM-DD HH:MM] - SIGN IN (Task: [Task Name])
```

---

### Phase 4: Task Execution

Follow the sub-tasks defined in the task card. For complex tasks:

1. Break down into sub-tasks if not already defined
2. Execute sub-tasks sequentially unless parallelization is explicitly safe
3. Verify each sub-task against the pipeline flow before proceeding to the next
4. Log significant decisions or blockers to the Notion task record or mem0
5. If blocked: update the task card with a blocker note and notify Kevin Tan

**Execution Standards:**
- Do not mark a sub-task complete until it has been tested in context
- For Notion-related tasks: verify changes in the actual Notion workspace before marking done
- For automation tasks: test the trigger → action → outcome chain end-to-end
- For documentation tasks: ensure content is accurate against real system state

**Working with the Pipeline:**
- Always use the CHECK view to verify lead records before making status changes
- Never skip a pipeline stage — leads must progress through stages in order
- Any stage change that triggers an automation must be confirmed to have fired correctly

---

### Phase 5: Verification Before Completion

Before marking any task Done:

1. Re-read the task's original requirements
2. Confirm each sub-task is complete and tested
3. Verify no side effects on other parts of the system (especially OPERATIONS 2026)
4. If the task touched Notion automations: confirm the automation fires correctly with a test record
5. If the task produced documents: confirm they are saved in the correct Drive folder and linked in Notion

---

### Phase 6: Sign Out and Close

**Actions to take:**
1. Update the task card `**Sign Out:**` to `[Agent ID] @ [YYYY-MM-DD HH:MM]`
2. Change `**Status:**` to `Done`
3. Check the checkbox: `- [x] **Task Name**`
4. Move the task card from `## In Progress` to `## Done`

**Log to mem0:**
```
[Agent ID] SIGN OUT — Task: [Task Name] — COMPLETE — [YYYY-MM-DD HH:MM]
```

**Append to Activity Log:**
```markdown
- [Agent ID] - [YYYY-MM-DD HH:MM] - SIGN OUT (Task: [Task Name] — COMPLETE)
```

**Example of completed card:**
```markdown
- [x] **AI Knowledge Base - Phase 1**
  - **Priority:** Medium
  - **Status:** Done
  - **Assignee:** Kevin Tan, Admin Kismet
  - **Phase:** Phase 2: Enforcement & Automations
  - **Agent Confirmation:** Claude-Code-Sonnet-4-6
  - **Sign In:** Claude-Code-Sonnet-4-6 @ 2026-02-27 05:51
  - **Sign Out:** Claude-Code-Sonnet-4-6 @ 2026-02-27 06:30
```

---

## Priority Tier Reference

Tasks in the Kanban are implicitly tiered by phase and sequence:

| Tier | Scope | Parallelizable? |
|------|-------|----------------|
| 1 | Data integrity, pipeline integrity, critical fixes | No — sequential |
| 2 | Database structure, relational properties | No — sequential |
| 3 | Automation triggers, form connections | Limited |
| 4 | AI integrations, Vertex AI | No — requires prior tiers done |
| 5 | Documentation, training materials | Yes — fully parallelizable |

---

## Handling Blockers

If a task cannot be completed due to missing access, broken integration, or unclear requirements:

1. Document the blocker clearly in the task card Notes
2. Do NOT mark the task as Done
3. Keep it in `## In Progress` with your Agent Confirmation set
4. Log the blocker to mem0
5. If it's a credential/API issue: notify Admin Kismet via Notion comment
6. If it's a workflow/logic issue: notify Kevin Tan via Notion comment
7. Move on to another available task while the blocker is resolved

---

## Agent Conflict Protocol

If two agents attempt to claim the same task:

1. The first agent to set `Agent Confirmation` owns the task — do not override
2. If you discover a conflict (your Agent ID was replaced), stand down immediately
3. Log the conflict to mem0 and notify Kevin Tan
4. Pick up a different task

---

## Quick Reference Checklist

```
CLAIM:
  [ ] Move card to In Progress
  [ ] Set Agent Confirmation = [My Agent ID]
  [ ] Set Sign In = [My Agent ID @ timestamp]

SIGN IN:
  [ ] Log to mem0: "[Agent ID] SIGN IN — Task: [name] — [timestamp]"
  [ ] Append to Activity Log in Kanban file

EXECUTE:
  [ ] Work sub-tasks sequentially
  [ ] Verify each against real system state
  [ ] Log blockers if any

VERIFY:
  [ ] Re-check all requirements met
  [ ] Test in pipeline context
  [ ] Confirm no side effects

SIGN OUT:
  [ ] Set Sign Out = [My Agent ID @ timestamp]
  [ ] Set Status = Done
  [ ] Check the checkbox
  [ ] Move card to Done
  [ ] Log to mem0: "[Agent ID] SIGN OUT — Task: [name] — COMPLETE — [timestamp]"
  [ ] Append to Activity Log
```

---

*Back to [index.md](../index.md)*
