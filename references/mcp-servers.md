---
tags:
  - ref
  - infrastructure
  - mcp
created: 2026-03-31
updated: 2026-03-31
---

# MCP Servers

All configured Model Context Protocol servers. Source of truth for agent integrations.

## Claude Code (~/.claude.json)

| Server | Command | Purpose |
|--------|---------|---------|
| obsidian-mcp-server | `node dist/index.js` | Obsidian vault access (8 tools: read/write/search/delete/tags/frontmatter) |
| chrome-devtools | `npx chrome-devtools-mcp@latest` | Browser inspection |
| context7 | `npx @upstash/context7-mcp@latest` | Upstash context |
| lotus-wisdom | `npx lotus-wisdom-mcp` | AI wisdom tools |
| mengram | `mengram.exe server --cloud` | Memory management |
| n8n | `uvx n8n-mcp-server` | Workflow automation (localhost:5678) |
| mem0 | `uvx mem0-mcp-server` | Memory system (user: kevinktg) |
| notion | `npx @notionhq/notion-mcp-server` | Notion workspace (API token) |

## FastMCP SSE Server (fastmcp-sse-server/mcp.json)
Launches same servers via SSE transport for remote agent access.

## Cloud MCP (claude.ai / Cowork)
| Server | Status |
|--------|--------|
| Notion | Connected (OAuth) |
| Canva | Connected |
| Figma | Connected |
| Vercel | Connected |
| Hugging Face | Connected |
| n8n | Connected |
| mem0 | Connected |
| Google Drive | Connected |

## Key Config Files
- `~/.claude.json` — Claude Code MCP definitions
- `fastmcp-sse-server/mcp.json` — SSE launcher config
- `fastmcp-sse-server/.env` — Environment variables (API keys, tokens)
- `.mcp.json` (projects root) — Project-level MCP overrides

## Notes
- n8n-mcp-server duplicate was removed from claude.json (March 2026)
- n8n-nodes-mcp-client v0.2.12 is the community node for SSE MCP in n8n
- Obsidian MCP connects to local vault at https://127.0.0.1:27124
