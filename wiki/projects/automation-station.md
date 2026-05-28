---
title: Automation Station — Portable n8n
type: project
tags: [project, n8n, infrastructure, portable, docker]
status: active
revenue_impact: medium
sources:
  - automation-station/README.md
  - automation-station/docker-compose.yml
last_updated: 2026-05-25
---

# Automation Station — Portable n8n

> Self-contained Docker Compose package that brings up an n8n instance with persistent state on any machine. The **portable form factor** of `[[wiki/projects/n8n-workflows]]` — copy a folder, run one command, station is live.

## Folder layout (at vault root)

```
automation-station/
├── docker-compose.yml         # n8n container, SQLite, named volumes
├── .env.example / .env        # config + secrets (.env gitignored)
├── start.sh / start.ps1       # one-command spin up
├── stop.sh / stop.ps1         # one-command shutdown
├── claude-code-mcp.json       # MCP snippet for Claude Code wiring
├── data/                      # persistent n8n state (DB, credentials)
├── workflows/                 # exported workflow JSON (portable)
└── README.md
```

**The portable unit is the folder.** Copy whole → `./start.sh` → same workflows, same credentials, same encryption key. `data/` and `.env` carry state.

## What it enables

- **Client deployment model** — hand a client a USB / git bundle. They get a working n8n with our workflows pre-loaded.
- **Disaster-recovery sibling to `n8n-railway/`** at the parent workspace (`C:\Users\kevin\projects\n8n-railway/`). Local n8n IS production for Kismet; Railway is the failover target.
- **Claude Code integration** via `claude-code-mcp.json` → n8n-mcp child process.

## Prerequisites

- Docker Desktop (Windows / macOS) or Docker Engine + Compose v2 (Linux)
- 1 GB free disk, port 5678 free (configurable in `.env`)

## Operational gotchas

- **WSL uses `docker-compose` v1** (Python, EOL) on the host stack — but this station ships its own Compose file expecting v2. Test on target environment.
- n8n inside Docker uses `host.docker.internal` to reach the host, not `127.0.0.1`. Ollama at `http://ollama:11434` if running inside the same network.
- Webhook nodes need `responseMode: responseNode` for any Respond node.

## Connections

- `[[wiki/projects/n8n-workflows]]` — the 18 workflows this station is built to host.
- `[[wiki/clients/kismet-finance]]` — primary consumer; local n8n IS production for Kismet.
- `[[wiki/projects/fastmcp-server]]` — sibling infrastructure (FastMCP SSE launcher on port 3000).
- `[[wiki/frameworks/business-process-discovery]]` — discovery → recommend "KTG Build: n8n Workflow" → deploy via Automation Station.

## Revenue path

- **Pull-through** — every discovery that lands on n8n as the solution can be packaged with Automation Station for delivery.
- **Productization candidate** — bundle as "Automation Station + Discovery + 3 workflows" starter package for SME clients.

## Status

Active. Self-contained sub-project; lives at vault root rather than under `wiki/projects/` because it has its own state (`data/`, `.env`) and lifecycle.

## Review items

- Validate workflow JSON exports are current vs the live n8n state on `ai-yah-old`.
- Document the encryption-key rotation procedure (currently implicit in `.env`).
