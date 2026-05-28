#!/usr/bin/env bash
# Portable automation station — start (Linux / macOS / WSL2)
set -euo pipefail
cd "$(dirname "$0")"

if [ ! -f .env ]; then
  if [ -f .env.example ]; then
    cp .env.example .env
    # Generate encryption key automatically if openssl is available
    if command -v openssl >/dev/null 2>&1; then
      KEY=$(openssl rand -hex 32)
      # Cross-platform sed (BSD on macOS, GNU on Linux)
      if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s|REPLACE_ME_openssl_rand_hex_32|$KEY|" .env
      else
        sed -i "s|REPLACE_ME_openssl_rand_hex_32|$KEY|" .env
      fi
      echo "→ Generated N8N_ENCRYPTION_KEY in .env (back this up)"
    else
      echo "⚠ Edit .env and set N8N_ENCRYPTION_KEY before running again."
      exit 1
    fi
  else
    echo "✗ Missing .env and .env.example. Aborting."
    exit 1
  fi
fi

# Use compose v2 if available, fall back to legacy
if docker compose version >/dev/null 2>&1; then
  COMPOSE="docker compose"
else
  COMPOSE="docker-compose"
fi

mkdir -p data workflows

echo "→ Starting n8n..."
$COMPOSE up -d

echo "→ Waiting for n8n to be healthy (up to 60s)..."
for i in {1..30}; do
  if curl -fsS http://localhost:"${N8N_PORT:-5678}"/healthz >/dev/null 2>&1; then
    echo "✓ n8n is up at http://localhost:${N8N_PORT:-5678}"
    echo ""
    echo "Next steps:"
    echo "  1. Open http://localhost:${N8N_PORT:-5678} in browser"
    echo "  2. Complete first-run setup (create owner account)"
    echo "  3. Settings → API → Create API Key"
    echo "  4. Paste the key into .env as N8N_API_KEY"
    echo "  5. Add the MCP block from claude-code-mcp.json to your Claude Code config"
    exit 0
  fi
  sleep 2
done

echo "⚠ n8n didn't pass healthcheck in 60s. Check logs:"
echo "    $COMPOSE logs n8n"
