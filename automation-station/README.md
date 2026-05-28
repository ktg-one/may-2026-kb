# Portable Automation Station

Single folder = the entire automation station. Copy it to any machine with Docker. Run one command. n8n is up with persistent state and ready to wire into Claude Code via `n8n-mcp`.

## What's in here

```
automation-station/
├── docker-compose.yml      # n8n container, SQLite, named volumes
├── .env.example            # config template (copy to .env)
├── .env                    # your actual secrets — gitignored, never commit
├── .gitignore              # excludes .env and data/
├── start.sh / start.ps1    # one-command spin up
├── stop.sh / stop.ps1      # one-command shutdown
├── claude-code-mcp.json    # MCP config snippet for Claude Code
├── data/                   # persistent n8n state (SQLite DB, credentials)
├── workflows/              # exported workflow JSON files (portable)
└── README.md               # this file
```

**The portable unit is the folder.** Copy it whole to a new machine, run `./start.sh`, and the station comes up identical — same workflows, same credentials, same encryption key. `data/` and `.env` carry the state; everything else is config.

## Prerequisites

- Docker Desktop (Windows / macOS) or Docker Engine (Linux) with Compose v2
- 1 GB free disk, port 5678 free (configurable in `.env`)

## Start (WSL2 / Linux / macOS)

```bash
cd automation-station
./start.sh
```

First run auto-generates `.env` from `.env.example` and creates an encryption key.

## Start (plain Windows PowerShell, no WSL)

```powershell
cd automation-station
.\start.ps1
```

## What happens on first start

1. `.env` is created from `.env.example` with a fresh `N8N_ENCRYPTION_KEY` (back this up — losing it = losing all stored credentials)
2. Docker pulls `n8nio/n8n:latest` (~250 MB)
3. Container starts on `http://localhost:5678`
4. Healthcheck polls until n8n is up
5. You open the URL, complete first-run setup (create owner account)

## Wire n8n-mcp into Claude Code

After n8n is running:

1. In n8n UI: **Settings → API → Create API Key**. Copy the key.
2. Paste it into `.env` as `N8N_API_KEY=...`
3. Open `claude-code-mcp.json`, copy the `mcpServers` block
4. Paste into your Claude Code MCP config (one of: `~/.claude/settings.json`, `~/.config/claude/mcp.json`, or `.mcp.json` in your project root)
5. Replace `PASTE_API_KEY_FROM_DOTENV_HERE` with the actual key
6. Restart Claude Code

Verify: in a Claude Code session, ask "list my n8n workflows" — it should query the running instance.

## n8n-mcp gives Claude Code

- **Read/search/get any n8n node** — 500+ node types documented with parameters, code examples, common gotchas
- **Search workflow templates** — community + official templates by use case
- **Validate workflow JSON before deployment** — catches structural and parameter errors
- **Live n8n API integration** — list, create, update, execute, delete workflows on the running instance
- **Execution telemetry** — read recent runs, error messages, payload data

## Stop

```bash
./stop.sh     # or .\stop.ps1 on Windows
```

State preserved in `./data` and `./workflows`. Restart with `./start.sh` to pick up exactly where you left off.

## Move the station to another machine

```bash
# On source machine:
./stop.sh
tar czf station.tar.gz automation-station/    # includes data/ + .env

# Transfer station.tar.gz to new machine

# On new machine (with Docker):
tar xzf station.tar.gz
cd automation-station
./start.sh
```

All workflows, credentials, and execution history come with you. The encryption key in `.env` is what makes credentials portable — keep it secret.

## Backup workflows separately (recommended weekly)

Export every workflow to disk for git-trackable portability:

```bash
docker exec automation-station-n8n n8n export:workflow --all --output=/workflows/
```

Workflows now in `./workflows/` as readable JSON. Commit to a private repo for version control.

## Restore workflows on a fresh station

```bash
docker exec automation-station-n8n n8n import:workflow --separate --input=/workflows/
```

## Common ports / config

| Variable | Default | When to change |
|---|---|---|
| `N8N_PORT` | 5678 | Port already in use |
| `N8N_HOST` | localhost | Exposing via tunnel (ngrok, Cloudflare Tunnel, etc.) |
| `N8N_BASIC_AUTH_ACTIVE` | false | Any non-localhost exposure → set to `true` |
| `TZ` | Asia/Singapore | Cron-based workflows in another timezone |

## When SQLite is no longer enough

Default is SQLite — fine up to dozens of workflows + thousands of executions/day. To upgrade to PostgreSQL:

1. Stop the station: `./stop.sh`
2. Edit `docker-compose.yml` — uncomment the postgres service (or add one)
3. Set `DB_TYPE=postgres` + postgres connection vars in `.env`
4. Export workflows first (see above) — DB migration is not automatic
5. Restart

## Troubleshooting

- **Port 5678 in use:** edit `.env`, set `N8N_PORT=5679` (or any free port). Restart.
- **Permission errors on `./data`:** WSL2 + Windows filesystem can fight on permissions. Move the folder into your WSL home (`~/automation-station`) for best performance.
- **MCP can't reach n8n:** confirm `N8N_API_URL` in MCP config matches your `N8N_PORT`. If running Claude Code in WSL but n8n in Docker Desktop, use `http://localhost:5678/api/v1` from both — Docker Desktop bridges the network.
- **First-run setup screen won't load:** Docker took longer than 60s. `docker compose logs n8n` to confirm it's actually running. Manually open `http://localhost:5678`.

## Security notes

- `.env` contains the encryption key and API key — never commit, never share
- For non-localhost exposure, set `N8N_BASIC_AUTH_ACTIVE=true` and use a strong password
- Consider Cloudflare Tunnel or Tailscale for remote access instead of opening ports
- For production / multi-user, switch SQLite → Postgres and add a reverse proxy with TLS
