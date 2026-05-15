---
tags:
  - workflow
  - agents
created: 2026-03-31
updated: 2026-03-31
---

# Agent Onboarding

How agents get oriented and start working in the Good AI ecosystem.

## First Contact
1. Read `_agent-protocol.md` in this vault
2. Read `CLAUDE.md` in the projects root for full instructions
3. Check `tasks/kanban.md` for available work
4. Verify MCP connection stability and tool availability

## Task Execution (Kanban Protocol)
1. **Claim:** Move task from `Not Started` → `In Progress`
2. **Sign In:** Log to mem0: `{event: "SIGN_IN", task: "<name>", agent: "<id>", timestamp: "<ISO>"}`
3. **Execute:** Complete sub-tasks
4. **Sign Out:** Log to mem0: `{event: "SIGN_OUT", task: "<name>", status: "DONE|BLOCKED", timestamp: "<ISO>"}`
5. **Done:** Move task to `Done` column

## Autonomous Protocol
On task completion → immediately read kanban → claim next available task → sign in → execute → sign out → repeat.
Never stop between tasks unless blocked or no tasks remain.

## Source of Truth Files
- Task delegation: `_agent-protocol.md` (this vault) + `AGENTS.md` (projects root)
- Kanban: `tasks/kanban.md` (this vault) + Notion Good AI Tasks DB
- Agent sign-in/out: mem0 (user: kevinktg)

## Integration Points
- All agents integrate via `fastmcp_sse_servers` protocol
- Notion DB for task tracking: collection ID `726bf4c7-4ce9-49f1-9b84-adaffa3769e3`
