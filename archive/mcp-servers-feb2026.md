# Integrations — MCP Servers

**Document:** integrations/mcp-servers.md
**KB Version:** 2.0
**Last Updated:** 2026-02-27
**Source:** fastmcp-sse-server/mcp.json, CLAUDE.md, AGENTS.md

---

## Overview

All AI agents in this ecosystem communicate with external systems via the Model Context Protocol (MCP). MCP servers are configured in two locations:

| Config File | Used By |
|-------------|---------|
| `C:/Users/kevin/projects/fastmcp-sse-server/mcp.json` | FastMCP SSE server (shared, all agents) |
| `~/.claude.json` | Claude Code (local, per-user) |

**Environment variables:** `C:/Users/kevin/projects/fastmcp-sse-server/.env`

Agents must integrate via the `fastmcp_sse_servers` protocol before accessing any tools. Verify connection stability before starting any task.

---

## Server Reference

### 1. obsidian-mcp-server

| Field | Value |
|-------|-------|
| **Key in mcp.json** | `obsidian-mcp-server` |
| **Command** | `node C:\Users\kevin\fastmcp-sse-server\obsidian-mcp-server\dist\index.js` |
| **Purpose** | Read and write the Obsidian Knowledge Base vault |
| **Tool count** | 8 tools |
| **Connection** | Local HTTP — `https://127.0.0.1:27124` (SSL verify disabled) |

**Environment variables:**
- `OBSIDIAN_API_KEY` — local REST API key for Obsidian
- `OBSIDIAN_PROTOCOL` — `https`
- `OBSIDIAN_HOST` — `127.0.0.1`
- `OBSIDIAN_PORT` — `27124`
- `REQUEST_TIMEOUT` — `5000` ms
- `MAX_CONTENT_LENGTH` / `MAX_BODY_LENGTH` — `52428800` (50MB)
- `RATE_LIMIT_WINDOW_MS` — `900000` (15 min)
- `RATE_LIMIT_MAX_REQUESTS` — `200`
- `TOOL_TIMEOUT_MS` — `60000`

**Available tools (8):**
1. Read note — read a file from the vault by path
2. Write note — create or overwrite a file in the vault
3. Search notes — full-text search across the vault
4. Delete note — remove a file from the vault
5. List notes — list files in a directory
6. Get tags — retrieve tags on a note
7. Update frontmatter — modify YAML frontmatter properties
8. Append to note — append content to an existing note

**Key paths accessible:**
- `C:/Users/kevin/projects/Knowledge Base/` — primary vault (symlink to `G:/data/Knowledge Base`)
- `C:/Users/kevin/projects/Knowledge Base/NAS/` — NAS (source of truth)
- `C:/Users/kevin/projects/Knowledge Base/AI-KB/` — this KB

**Notes:**
- Requires Obsidian to be running with the Local REST API plugin active
- SSL verification is disabled — expected for local self-signed cert

---

### 2. chrome-devtools

| Field | Value |
|-------|-------|
| **Key in mcp.json** | `chrome-devtools` |
| **Command** | `npx chrome-devtools-mcp@latest` |
| **Purpose** | Browser inspection, automation, and debugging |
| **Tool count** | Multiple browser control tools |

**Available tools (representative):**
- `take_screenshot` — capture browser viewport
- `click`, `fill`, `type_text` — browser interaction
- `navigate_page` — URL navigation
- `evaluate_script` — run JavaScript in page context
- `get_console_message`, `list_console_messages` — browser console
- `get_network_request`, `list_network_requests` — network inspection
- `list_pages`, `new_page`, `close_page` — tab management
- `fill_form` — form automation
- `wait_for` — wait for element/condition

**Use cases in this ecosystem:**
- Testing Notion automations visually
- Verifying form submissions (Fillout)
- Debugging webhook responses in browser
- Screenshot-based verification of pipeline state

**Notes:**
- Requires Chrome/Chromium to be running with remote debugging enabled
- Not required for most agent tasks — use only for browser-specific verification

---

### 3. context7

| Field | Value |
|-------|-------|
| **Key in mcp.json** | `context7` |
| **Command** | `npx -y @upstash/context7-mcp@latest` |
| **Purpose** | Upstash vector context store — retrieve relevant documentation and context chunks |

**Available tools:**
- `resolve-library-id` — map a library name to a Context7 library ID
- `query-docs` — retrieve documentation for a specific library and topic

**Use cases in this ecosystem:**
- Retrieving up-to-date documentation for n8n, Notion API, or other libraries
- Getting code examples during workflow development
- Resolving API schema questions without web search

**Notes:**
- Powered by Upstash — external service, requires internet
- Particularly useful when building n8n workflows that integrate with third-party APIs

---

### 4. lotus-wisdom

| Field | Value |
|-------|-------|
| **Key in mcp.json** | `lotus-wisdom` |
| **Command** | `npx -y lotus-wisdom-mcp` |
| **Purpose** | AI reasoning and reflection tools — structured thinking and wisdom patterns |

**Available tools:**
- `lotuswisdom` — structured multi-step reasoning
- `lotuswisdom_summary` — summarize complex contexts

**Use cases in this ecosystem:**
- Complex decision-making when task requirements are ambiguous
- Synthesizing information across multiple knowledge sources before acting
- Reflection before executing irreversible operations (Notion mutations, file writes)

**Notes:**
- Optional — use when task requires deep reasoning or synthesis
- Does not access external systems; reasoning only

---

### 5. mem0

| Field | Value |
|-------|-------|
| **Key in mcp.json** | `mem0` |
| **Command** | `uvx mem0-mcp-server` |
| **Purpose** | Agent memory system — persistent cross-session memory for task sign-in/out and state |
| **User ID** | `kevinktg` |

**Environment variables:**
- `MEM0_API_KEY` — API key for mem0 cloud service
- `MEM0_DEFAULT_USER_ID` — `kevinktg` (all memory stored under this user)

**Available tools:**
- `add_memory` — store a new memory record
- `search_memories` — semantic search across stored memories
- `get_memories` — retrieve recent memories
- `get_memory` — retrieve a specific memory by ID
- `update_memory` — update an existing memory
- `delete_memory` — remove a memory
- `delete_all_memories` — clear all memories (use with caution)
- `list_entities` — list memory entities

**Required usage — Task Sign-In:**
```
add_memory: "[Agent ID] SIGN IN — Task: [Task Name] — [YYYY-MM-DD HH:MM]"
```

**Required usage — Task Sign-Out:**
```
add_memory: "[Agent ID] SIGN OUT — Task: [Task Name] — COMPLETE — [YYYY-MM-DD HH:MM]"
```

**Notes:**
- REQUIRED for all agent tasks — failure to sign in/out breaks task accountability
- All memories are stored under user `kevinktg` — search with this context
- Use `search_memories` at session start to check for recent task state or blockers
- mem0 is a cloud service — requires internet connectivity

---

### 6. n8n (n8n-mcp-server)

| Field | Value |
|-------|-------|
| **Key in mcp.json** | `n8n` |
| **Command** | `uvx n8n-mcp-server` |
| **Purpose** | Interact with the n8n workflow automation instance |
| **n8n Host** | `http://localhost:5678` |

**Environment variables:**
- `N8N_HOST` — `http://localhost:5678`
- `N8N_API_KEY` — JWT token for n8n API authentication

**Available tools (representative):**
- `list_workflows_minimal` — list all workflows (ID, name, status)
- `get_workflow_summary` — get summary of a specific workflow
- `partial_update_workflow` — update part of a workflow (avoid — use full update)
- `update_workflow_from_file` — replace workflow from JSON file
- `create_workflow_from_file` — create new workflow from JSON
- `export_workflow_to_file` — export workflow JSON
- `Retrieve_an_execution` — check execution result
- `Retrieve_all_executions` — list recent executions
- `Activate_a_workflow` / `Deactivate_a_workflow` — toggle workflow active state
- `Create_a_credential` / `deleteCredential` — manage credentials
- `Retrieve_all_tags` — list workflow tags

**Notes:**
- n8n instance runs at `localhost:5678` locally; also accessible via Tailscale at `https://ai-yah-old.taile6f11d.ts.net`
- Use `n8n_update_full_workflow` (not partial) for workflow modifications — partial update causes errors
- A second server entry `n8n-mcp-server` also exists in mcp.json (without env vars) — use the `n8n` entry which has credentials configured
- Notify Kevin Tan if workflow changes are required — n8n is Kevin's responsibility per the Delegation Registry

---

### 7. notion

| Field | Value |
|-------|-------|
| **Key in mcp.json** | `notion` |
| **Command** | `npx -y @notionhq/notion-mcp-server` |
| **Purpose** | Full read/write access to the Notion workspace (Kismet Finance Group CRM) |

**Environment variables:**
- `NOTION_TOKEN` — Integration token for Kismet Notion workspace

**Available tools (representative):**
- `API-retrieve-a-page` — read a Notion page by ID
- `API-patch-page` — update page properties
- `API-post-page` — create a new page
- `API-delete-a-block` — remove a block
- `API-get-block-children` — read page content blocks
- `API-patch-block-children` — add or update blocks
- `API-retrieve-a-database` — read database schema
- `API-query-data-source` — query a database with filters
- `API-post-search` — search across workspace
- `API-get-user` / `API-get-users` — list workspace members
- `API-create-a-comment` — add comment to a page
- `API-retrieve-a-comment` — read comments

**Key database IDs (from crm-schema.md):**
- MASTER DATABASE 2025 — primary pipeline
- DQ Form Responses — intake database
- Client Assessment Form — post-discovery data
- People Database — contacts
- Household Database — client units
- Entities Database — corporate structures

**Critical rules when using this server:**
- Do NOT modify OPERATIONS 2026 view filters, layouts, or automations
- Do NOT modify the Databases (do not touch) page structure
- Do NOT expose PII (phone, email, DOB, income) in logs or outputs
- Always verify changes in the actual workspace before marking a task done

**Notes:**
- A separate `claude.ai` Notion integration (OAuth) is also available for cloud MCP sessions
- The local `notion` MCP server uses a direct integration token — verify it is current in `.env`

---

### 8. mengram

| Field | Value |
|-------|-------|
| **Key in mcp.json** | `mengram` |
| **Command** | `C:\Users\kevin\AppData\Roaming\Python\Python313\Scripts\mengram.exe server --cloud` |
| **Purpose** | Cloud-based memory management (alternative/supplement to mem0) |

**Environment variables:**
- `MENGRAM_API_KEY` — API key for Mengram cloud service

**Notes:**
- Mengram is an alternative memory system to mem0
- For task sign-in/sign-out, use **mem0** (the primary and required system)
- Mengram may be used for supplementary memory or cross-session knowledge retrieval

---

## Cloud MCP Servers (claude.ai)

These servers are available in Claude.ai web sessions (not local CLI):

| Server | Status | Purpose |
|--------|--------|---------|
| Notion | Connected (OAuth) | Kismet Notion workspace |
| Vercel | Connected | Vercel deployment management |
| Hugging Face | Connected | HF models, spaces, datasets |
| MCP_DOCKER | Connected | Docker-based MCP tools |
| Gmail | Needs auth | Email access |
| Google Calendar | Needs auth | Calendar management |
| Make | Needs auth | Make.com automation |
| Figma | Needs auth | Design assets |

---

## Connection Verification Checklist

Before starting any task, verify:

```
[ ] mem0 — connected and responsive (REQUIRED for all tasks)
[ ] notion — connected (REQUIRED for any Notion task)
[ ] n8n — reachable at localhost:5678 (REQUIRED for automation tasks)
[ ] obsidian-mcp-server — Obsidian running with REST API plugin active
[ ] context7 — internet connectivity available (for doc retrieval)
```

If mem0 is not connected, do not proceed — task accountability requires sign-in/out logging.

---

*Back to [index.md](../index.md)*
