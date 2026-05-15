---
title: Agent Protocol
tags: [protocol, agent, system]
last_updated: 2026-05-06
---

# Agent Protocol

How AI agents interact with this vault. All agents read this on first contact.

## Access
- **MCP Server:** obsidian-mcp-server (https://127.0.0.1:27124)
- **Tools:** read, write, search, delete, tags, frontmatter
- **mem0 user:** kevinktg

## Vault Architecture (Karpathy LLM Wiki Pattern)

Three layers. Respect the boundaries.

| Layer | Path | Agent Access | Purpose |
|-------|------|-------------|---------|
| **Sources** | sources/ | READ ONLY | Raw immutable inputs (pitches, client docs, research) |
| **Wiki** | wiki/ | READ + WRITE | Compiled revenue-focused knowledge. Cross-referenced. |
| **Index** | _index.md | READ + WRITE | Navigation schema, decision tree |

## Reading Priority

1. `_index.md` — vault orientation and decision tree
2. `wiki/REVENUE-MAP.md` — what makes money
3. `wiki/PIPELINE.md` — who to sell to, active deals
4. `wiki/good-ai.md` — company context
5. `wiki/clients/` and `wiki/projects/` — as needed for specific work
6. `tasks/kanban.md` — current work queue

## Writing Rules

1. Use frontmatter: `tags`, `status`, `revenue_impact`, `last_updated`
2. Status values: `active`, `paused`, `completed`
3. Revenue impact: `high`, `medium`, `low`, `critical`
4. Use [[wikilinks]] for cross-references
5. Trace revenue paths: client → project → deliverable → invoice status
6. Keep wiki/ lean — if it doesn't help make money, it doesn't belong
7. Never modify sources/ — those are immutable
8. Log significant actions to `logs/YYYY-MM-DD-<description>.md`

## Task Execution

1. **Claim:** Move task to In Progress in kanban, add agent ID + timestamp
2. **Sign In:** Log to mem0 with `{event: "SIGN_IN", task: "<name>", agent: "<id>"}`
3. **Execute:** Complete work, update relevant wiki/ articles if deliverable created
4. **Sign Out:** Log to mem0 with `{event: "SIGN_OUT", task: "<name>", status: "DONE|BLOCKED"}`
5. **Done:** Move task to Done in kanban

## Memory Flow

```
Session context → mem0 (ephemeral bridge)
Revenue knowledge → wiki/ (permanent, compiled)
Raw inputs → sources/ (permanent, immutable)
Task state → tasks/kanban.md + mem0 sign-in/out
```

## What Goes Where

| Content | Destination |
|---------|-------------|
| Client intelligence, deal status | wiki/clients/ |
| Project status, tech specs | wiki/projects/ |
| Revenue data, pipeline updates | wiki/REVENUE-MAP.md, wiki/PIPELINE.md |
| Raw client documents | sources/clients/ |
| Process documentation | workflows/ |
| Active tasks | tasks/kanban.md |
| Session logs | logs/ |
| Ephemeral session state | mem0 only |

*Last updated: 2026-05-06*
