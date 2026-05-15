# Agent Protocol — Onboarding

**Document:** agent-protocols/onboarding.md
**KB Version:** 1.0
**Last Updated:** 2026-02-27
**Source:** Derived from AGENTS.md, STRUCTURED_AGENTS_KB.md, Agents Onboarding.md

---

## Purpose

This document defines the onboarding sequence all AI agents must complete before executing any task within the Kismet Finance Group ecosystem. It applies equally to Claude Code, Gemini CLI, Codex CLI, and any future agent.

---

## Agent Ecosystem Overview

| Agent | Role | Primary Strength |
|-------|------|-----------------|
| Claude Code (Sonnet / Opus) | Orchestrator + complex tasks | Multi-file reasoning, planning, code, Notion API |
| Gemini CLI | Parallel worker | Data processing, summarization, large context |
| Codex CLI | Parallel worker | Code generation, automation scripts |
| Vertex AI Agent (planned) | Voice + RAG | Transcription, retrieval, conversation design |

All agents operate under Kevin Tan's direction. Admin Kismet manages credentials and integrations.

---

## Onboarding Sequence (Mandatory — In Order)

### Step 1: Read This File and the KB Index

Before anything else, read:
- `C:/Users/kevin/projects/Knowledge Base/AI-KB/index.md` — master KB index
- This file (`agent-protocols/onboarding.md`)
- `agent-protocols/task-execution.md` — Kanban workflow

Then read the relevant domain files based on your task:
- `business-context/overview.md` — if you need business context
- `business-context/crm-schema.md` — if you will touch Notion
- `data-definitions/lead-stages.md` — if you will process pipeline records

### Step 2: Configure MCP Servers

All agents must integrate via the `fastmcp_sse_servers` protocol before accessing tools.

**Configuration location:** `C:/Users/kevin/projects/fastmcp-sse-server/mcp.json`
**Environment variables:** `C:/Users/kevin/projects/fastmcp-sse-server/.env`
**Claude config:** `~/.claude.json`

#### Available MCP Servers

| Server | Tool Count | Purpose |
|--------|-----------|---------|
| obsidian-mcp-server | 8 tools | Read/write/search Obsidian vault (Knowledge Base) |
| chrome-devtools | Browser tools | Browser inspection and automation |
| context7 | Context tools | Upstash context/vector store |
| lotus-wisdom | Wisdom tools | AI reasoning and reflection tools |
| mem0 | Memory tools | Agent memory — REQUIRED for task sign-in/sign-out |
| n8n | Workflow tools | n8n workflow automation (localhost:5678) |
| notion | Notion API | Notion workspace read/write |

**Connection check:** Before starting work, verify:
1. mem0 is connected (required for Sign In / Sign Out logging)
2. Notion MCP is connected (if task involves Notion)
3. n8n is reachable (if task involves automations)

### Step 3: Establish Your Agent Identity

Each agent session must have a unique, identifiable Agent ID. Use this format:

```
[Agent-Type]-[Model]-[Session-Suffix]
```

**Examples:**
- `Claude-Code-Sonnet-4-6` (Claude Code running Sonnet)
- `Claude-Code-Opus-4-6` (Claude Code running Opus)
- `Gemini-CLI-Session-01`
- `Codex-CLI-Session-01`

Write your Agent ID to mem0 at the start of every session.

### Step 4: Check the Kanban Board

Location: `C:/Users/kevin/projects/Knowledge Base/NAS/KANBAN - Good AI Tasks.md`

Before picking up any task:
1. Read the full board to understand what is In Progress (avoid conflicts)
2. Check the Activity Log at the bottom for recent agent actions
3. Identify available tasks in "Not Started" — lower sequence numbers have higher priority
4. Do NOT work on Vertex AI tasks (GCP, Vertex AI Agent Builder) until all prior-priority tasks are Done

### Step 5: Claim Your Task

See [task-execution.md](./task-execution.md) for the full workflow. Summary:
1. Move task from `Not Started` to `In Progress` in the Kanban file
2. Set `Agent Confirmation:` to your Agent ID
3. Set `Sign In:` to `[Agent ID] @ [YYYY-MM-DD HH:MM]`
4. Log to mem0: `"[Agent ID] SIGN IN — Task: [Task Name] @ [timestamp]"`
5. Add your sign-in to the Activity Log at the bottom of the Kanban file

### Step 6: Execute With Context

Use the following execution principles:
- **Always verify against the actual pipeline flow** — don't assume, check
- **Use the CHECK view** in Notion when verifying lead records
- **Never mutate production data** without first understanding the downstream effects
- **Log decisions and observations** — write them to the relevant Notion record Notes field or to mem0
- **Respect the delegation registry:** Admin handles API/credential issues; Kevin handles n8n and DocuSign

---

## Rules for CLI Agents (Mandatory)

These rules are non-negotiable for all agents:

1. **Read this file completely before starting any task.**
2. **Respect sequence numbers** — lower numbers in Good AI Tasks = higher priority.
3. **Do NOT touch Vertex AI / AI stack tasks** until all prior priorities are marked Done.
4. **Do NOT modify OPERATIONS 2026 filters, layouts, or automations.**
5. **Do NOT modify the Databases (do not touch) page structure** in Notion.
6. **Claim tasks before working** — set `Agent Confirmation` to your agent identifier and `Status` to `In Progress`.
7. **Handle PII with care** — do not log, expose, or transmit PII outside the workspace.
8. **Check blockers** — verify Notion API authority before attempting automation tasks.
9. **Documentation tasks (Priority 5) are parallelizable** — multiple agents can work them simultaneously.
10. **Test in context** — verify work against the actual pipeline flow before marking Done.

---

## Agent Workflow Diagram

```
Agent Online
    ↓
1. Read AI-KB (this file + index + relevant docs)
    ↓
2. Configure MCP Servers (verify mem0, Notion, n8n)
    ↓
3. Establish Agent ID
    ↓
4. Check KANBAN - Good AI Tasks.md
    ↓
Task Available?
    ↓ YES                    ↓ NO
5. Move to 'In Progress'    Wait / Standby
    ↓
6. Sign In: Agent ID + Timestamp
   + Add mem0 Record
    ↓
7. Execute Sub-Tasks
   (read crm-schema, lead-stages as needed)
    ↓
8. Verify work against pipeline flow
    ↓
9. Sign Out: Agent ID + Timestamp
   + Add mem0 Record
    ↓
10. Move Task to 'Done'
    ↓
Back to Step 4 (check for next task)
```

---

## Delegation Registry

When you hit a blocker, escalate to the right person:

| Issue Type | Escalate To | Contact Method |
|-----------|-------------|----------------|
| API/credential problems | Admin Kismet | Notion task comment |
| n8n workflow / webhook issues | Kevin Tan (Dev) | Notion task comment |
| DocuSign template issues | Kevin Tan (Dev) | Notion task comment |
| Notion API authority errors | Admin Kismet | Check `.env` file |
| Data quality / PII concerns | Kevin Tan | Flag in task notes |
| Agent conflict (two agents on same task) | Kevin Tan | mem0 + Kanban note |

---

## Key File Paths Reference

| Resource | Path |
|----------|------|
| Projects root | `C:/Users/kevin/projects/` |
| Knowledge Base | `C:/Users/kevin/projects/Knowledge Base/` |
| AI Knowledge Base | `C:/Users/kevin/projects/Knowledge Base/AI-KB/` |
| NAS (source of truth) | `C:/Users/kevin/projects/Knowledge Base/NAS/` |
| AGENTS.md (source) | `C:/Users/kevin/projects/Knowledge Base/NAS/AGENTS.md` |
| Kanban board | `C:/Users/kevin/projects/Knowledge Base/NAS/KANBAN - Good AI Tasks.md` |
| MCP config | `C:/Users/kevin/projects/fastmcp-sse-server/mcp.json` |
| Environment vars | `C:/Users/kevin/projects/fastmcp-sse-server/.env` |
| Claude config | `~/.claude.json` |
| Claude skills | `C:/Users/kevin/.claude/skills/` |
| BMAD config | `C:/Users/kevin/projects/_bmad/core/config.yaml` |
| BMAD output | `C:/Users/kevin/projects/_bmad-output/` |

---

## Onboarding Checklist

Before starting your first task, confirm:

- [ ] Read AI-KB index.md
- [ ] Read this file (agent-protocols/onboarding.md)
- [ ] Read agent-protocols/task-execution.md
- [ ] MCP servers configured (fastmcp_sse_servers)
- [ ] mem0 connected and verified
- [ ] Agent ID established and logged to mem0
- [ ] Kanban board read and understood
- [ ] No conflicting agents on your intended task
- [ ] Task claimed (Status = In Progress, Agent Confirmation set)
- [ ] Sign In completed (Kanban + mem0)

---

*Back to [index.md](../index.md)*
