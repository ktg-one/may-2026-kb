---
tags:
  - area
  - project
  - active
created: 2026-03-31
updated: 2026-03-31
---

# Google Workspace CLI

## Status
**In progress** — kicked off 2026-03-31

## What It Is
Rust-based CLI for Google Workspace API integration. Device-flow OAuth auth.

## Architecture (3 phases)
1. **Install & Auth** — Cargo install, device flow OAuth
2. **n8n Integration** — CLI as n8n tool node
3. **MCP Wrapper** — Expose as MCP server for agent access

## CLI Commands (planned)
- Gmail: send, read, search, label
- Calendar: list, create, update, delete events
- Drive: list, upload, download, share
- Sheets: read, write, append

## Key Dates
- Memory system initialized: 2026-03-30
- Project start: 2026-03-31

## Design Doc
- Full implementation roadmap: `docs/plans/2026-03-30-google-workspace-cli-design.md` (in projects root)

## Notes
- Kevin wants memory to persist across sessions for this project
- Docker integration strategy included in design
- Smoke test protocols defined
