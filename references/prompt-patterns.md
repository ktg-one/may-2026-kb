# AI Agents — Proven Prompt Patterns

**Document:** ai-agents/prompt-patterns.md
**KB Version:** 2.0
**Last Updated:** 2026-02-27
**Source:** AGENTS.md, task-execution.md, crm-schema.md, n8n-workflows.md, real session history

---

## Purpose

This document catalogs proven prompt patterns and templates used within the Kismet Finance Group AI ecosystem. These patterns have been validated in real sessions. Use them verbatim or adapt them to reduce prompt engineering overhead and avoid known failure modes.

---

## 1. Kanban Task Dispatch Pattern

Use this pattern when delegating a Kanban task to a subagent.

### Pattern: Full Task Dispatch

```
You are a subagent of Claude-Code-Sonnet-4-6 orchestrator. Task from Kanban: **[Task Name]**.

[Context block: paste relevant context from the Kanban card and KB files]

Your job:
1. [Sub-task 1]
2. [Sub-task 2]
3. [Sub-task 3]

Return: [expected output format]
```

### Pattern: Quick Task Dispatch

```
Subagent task: [Task Name]

Read: [file paths needed]
Do: [specific action]
Return: [what to return]
```

### Example — Phase 2 KB dispatch (actual):
```
You are a subagent of Claude-Code-Sonnet-4-6 orchestrator. Task from Kanban: **AI Knowledge Base - Phase 2**.

Phase 1 is complete at C:/Users/kevin/projects/Knowledge Base/AI-KB/ with these files:
[file list]

Phase 2 should deepen the KB with operational and AI-specific content. Your job:
1. Read the existing Phase 1 files to understand what's already covered
2. Create these Phase 2 files:
   - AI-KB/integrations/n8n-workflows.md
   - AI-KB/integrations/mcp-servers.md
   [...]

Return: Files created with line counts and key content highlights.
```

---

## 2. mem0 Sign-In Pattern

Use this exact format when logging task start to mem0.

### add_memory call:
```
[Agent ID] SIGN IN — Task: [Task Name] — [YYYY-MM-DD HH:MM]
```

### Example:
```
Claude-Code-Sonnet-4-6 SIGN IN — Task: AI Knowledge Base - Phase 2 — 2026-02-27 07:30
```

### Kanban Activity Log append (matching format):
```
- Claude-Code-Sonnet-4-6 - 2026-02-27 07:30 - SIGN IN (Task: AI Knowledge Base - Phase 2)
```

---

## 3. mem0 Sign-Out Pattern

Use this exact format when logging task completion to mem0.

### add_memory call:
```
[Agent ID] SIGN OUT — Task: [Task Name] — COMPLETE — [YYYY-MM-DD HH:MM]
```

### Example:
```
Claude-Code-Sonnet-4-6 SIGN OUT — Task: AI Knowledge Base - Phase 2 — COMPLETE — 2026-02-27 09:15
```

### Kanban Activity Log append:
```
- Claude-Code-Sonnet-4-6 - 2026-02-27 09:15 - SIGN OUT (Task: AI Knowledge Base - Phase 2 — COMPLETE)
```

---

## 4. Notion Property Update Patterns

Use these patterns when updating Notion records via the MCP server.

### Pattern: Update a Select Property (e.g., Status)

```
API-patch-page:
  page_id: [notion-page-id]
  properties:
    Status:
      select:
        name: "PROSPECT"
```

**Known Status values:** LEAD, QUALIFIED LEAD, PROSPECT, ONBOARDING, CLIENT, FAKE NUMBER, NOT INTERESTED, DNC, INACTIVE, LOST

### Pattern: Update a Date Property (e.g., Discovery Booked)

```
API-patch-page:
  page_id: [notion-page-id]
  properties:
    "Discovery Booked":
      date:
        start: "2026-03-15T10:00:00+08:00"
```

Always include AWST timezone offset (`+08:00`) in date-time values.

### Pattern: Update a Text / Rich Text Property (e.g., Notes)

```
API-patch-page:
  page_id: [notion-page-id]
  properties:
    Notes:
      rich_text:
        - type: text
          text:
            content: "Discovery call completed. Client interested in housing pathway. Income ~$120k. No existing debts. Next step: prepare Authority to Act."
```

### Pattern: Add a Relation (Link to another database record)

```
API-patch-page:
  page_id: [pipeline-record-id]
  properties:
    "Assessment Form":
      relation:
        - id: [assessment-form-record-id]
```

### Pattern: Query Database for Records Matching Filter

```
API-query-data-source:
  database_id: [database-id]
  filter:
    and:
      - property: Status
        select:
          equals: "PROSPECT"
      - property: "Discovery Booked"
        date:
          is_not_empty: true
```

### Pattern: Search for a Record by Name

```
API-post-search:
  query: "[lead name]"
  filter:
    property: object
    value: page
```

---

## 5. n8n Workflow Creation Pattern

Use this pattern when creating or updating n8n workflows via the MCP server.

### Pattern: Get Workflow Before Modifying

Always read the current workflow before modifying it:

```
1. list_workflows_minimal → find workflow ID
2. get_workflow_summary [workflow-id] → understand current structure
3. export_workflow_to_file [workflow-id] → get full JSON
4. Modify the JSON
5. update_workflow_from_file [workflow-id] → apply changes
```

**Rule:** Never use `partial_update_workflow` — use `update_workflow_from_file` (full update). Partial update causes `additional properties` errors in this n8n instance.

### Pattern: n8n IF Node (v2.2 syntax)

For unary operators (isNotEmpty, isEmpty), the node JSON must include `singleValue: true`:

```json
{
  "type": "n8n-nodes-base.if",
  "typeVersion": 2.2,
  "parameters": {
    "conditions": {
      "options": {
        "leftValue": "",
        "caseSensitive": true,
        "typeValidation": "strict"
      },
      "conditions": [
        {
          "id": "condition-1",
          "leftValue": "={{ $json['Discovery Booked'] }}",
          "rightValue": "",
          "operator": {
            "type": "string",
            "operation": "notEmpty",
            "singleValue": true
          }
        }
      ]
    }
  }
}
```

### Pattern: Notion Trigger Node

```json
{
  "type": "n8n-nodes-base.notionTrigger",
  "typeVersion": 1,
  "parameters": {
    "event": "pageUpdated",
    "databaseId": "[database-id]",
    "pollTimes": {
      "item": [
        {
          "mode": "everyMinute"
        }
      ]
    }
  }
}
```

### Pattern: Google Calendar Upsert (prevent duplicates)

Use Notion Page ID (dashes stripped) as the Calendar Event ID:

```javascript
// Code node to strip dashes from Notion Page ID
const notionPageId = $input.item.json.id;
const calendarEventId = notionPageId.replace(/-/g, '');
return [{ json: { ...input.item.json, calendarEventId } }];
```

Then in the Calendar node, set:
- Operation: `update` (upsert)
- Event ID: `{{ $json.calendarEventId }}`

---

## 6. Agent Identity Pattern

Use this exact format for agent identification in all contexts.

### Format:
```
[Agent-Type]-[Model]-[Session-Suffix]
```

### Examples:
```
Claude-Code-Sonnet-4-6
Claude-Code-Opus-4-6
Gemini-CLI-Session-01
Codex-CLI-Session-01
```

### Usage in Kanban card (Agent Confirmation field):
```
Agent Confirmation: Claude-Code-Sonnet-4-6
```

---

## 7. Kanban Card Claim Pattern

Use this exact format when claiming a Kanban task.

### Before (Not Started):
```markdown
- [ ] **AI Knowledge Base - Phase 2**
  - **Priority:** Medium
  - **Status:** Not Started
  - **Assignee:** Kevin Tan, Admin Kismet
  - **Phase:** Phase 2: Enforcement & Automations
  - **Agent Confirmation:**
  - **Sign In:**
  - **Sign Out:**
```

### After Claiming (In Progress):
```markdown
- [ ] **AI Knowledge Base - Phase 2**
  - **Priority:** Medium
  - **Status:** In Progress
  - **Assignee:** Kevin Tan, Admin Kismet
  - **Phase:** Phase 2: Enforcement & Automations
  - **Agent Confirmation:** Claude-Code-Sonnet-4-6
  - **Sign In:** Claude-Code-Sonnet-4-6 @ 2026-02-27 07:30
  - **Sign Out:**
```

### After Completion (Done):
```markdown
- [x] **AI Knowledge Base - Phase 2**
  - **Priority:** Medium
  - **Status:** Done
  - **Assignee:** Kevin Tan, Admin Kismet
  - **Phase:** Phase 2: Enforcement & Automations
  - **Agent Confirmation:** Claude-Code-Sonnet-4-6
  - **Sign In:** Claude-Code-Sonnet-4-6 @ 2026-02-27 07:30
  - **Sign Out:** Claude-Code-Sonnet-4-6 @ 2026-02-27 09:15
```

---

## 8. Pipeline Stage Advancement Pattern

Use this when an agent needs to advance a lead through the pipeline.

### Verification before advancing:
```
Before advancing [Lead Name] from [Current Stage] to [Next Stage]:
1. Read lead record: API-query-data-source [MASTER DATABASE 2025] filter by name/phone
2. Confirm required fields are populated for [Current Stage]
3. Confirm trigger conditions are met for [Next Stage]
4. Check for any blockers in Notes field
5. Only then: API-patch-page → update Status to [Next Stage]
```

### Stage advancement trigger summary:
```
LEAD → QUALIFIED LEAD:      Verify phone valid, all DQ fields present, qualifier confirmed
QUALIFIED LEAD → PROSPECT:  Confirm Discovery Booked date set
PROSPECT → ONBOARDING:      Confirm Client Assessment Form linked, Pathway set
ONBOARDING → CLIENT:        Confirm welcome email sent, Drive folder created
Any → DNC:                  IMMEDIATE — do not delay this transition
```

---

## 9. Error Escalation Pattern

When blocked, use this format to escalate clearly.

### Blocker note in Kanban:
```
BLOCKER: [Description of what is blocked]
Blocked by: [API credential issue / unclear requirement / missing access]
Needs: [Kevin Tan / Admin Kismet / external action]
Workaround attempted: [what was tried]
```

### mem0 blocker log:
```
[Agent ID] BLOCKED — Task: [Task Name] — Blocker: [brief description] — [timestamp]
```

---

## 10. KB File Creation Pattern

Use this pattern when creating new KB files to maintain consistency.

### File header template:
```markdown
# [Section] — [Title]

**Document:** [relative path from AI-KB/]
**KB Version:** 2.0
**Last Updated:** [YYYY-MM-DD]
**Source:** [list source documents read]

---
```

### File footer template:
```markdown
---

*Back to [index.md](../index.md)*
```

### Index entry (add to AI-KB/index.md Quick Reference table):
```markdown
| [What does this document answer?] | [path/file.md](./path/file.md) | [2-3 key facts] |
```

---

*Back to [index.md](../index.md)*
