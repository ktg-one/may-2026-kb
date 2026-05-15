---
tags:
  - log
created: 2026-03-31
---

# 2026-03-31 — Vault Initialization

## What Happened
Started knowledge2026 from scratch. Agent-optimized flat structure.

## Sources
- mem0 (kevinktg): 40+ memories searched across workflows, projects, integrations
- projects/memory/: glossary, company context, people, project files
- projects/n8n-backups/: 18 workflow JSONs inventoried
- projects/.mcp.json: MCP server definitions
- projects/CLAUDE.md: master protocol reference

## Structure Created
```
knowledge2026/
├── _index.md              # Vault home / MOC
├── _agent-protocol.md     # Agent interaction rules
├── areas/                 # Standing responsibilities
│   ├── good-ai.md
│   ├── kismet-finance.md
│   ├── leemonarc.md
│   └── google-workspace-cli.md
├── references/            # Durable knowledge
│   ├── glossary.md
│   ├── mcp-servers.md
│   ├── n8n-workflows.md
│   ├── tools-and-systems.md
│   └── people.md
├── workflows/             # How things get done
│   ├── deeptastel.md
│   ├── agent-onboarding.md
│   ├── bmad-framework.md
│   └── delegation-rules.md
├── tasks/
│   └── kanban.md
└── logs/
    └── 2026-03-31-vault-init.md
```

## Decisions
- Flat structure (max 1 folder deep) for agent readability
- Tags over folders for cross-cutting concerns
- mem0 remains the ephemeral bridge; vault holds durable knowledge
- Old G: drive vault content not accessible — migrated from projects/ memory system and mem0 instead

## What's NOT Migrated (needs manual review)
- Old NAS/KANBAN boards (on G: drive)
- AI-KB/index.md structured knowledge base
- AI-Training-Data/ materials
- integrations/ docs from old vault
