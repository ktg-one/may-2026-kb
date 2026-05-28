#!/usr/bin/env bash
# Portable automation station — stop
set -euo pipefail
cd "$(dirname "$0")"

if docker compose version >/dev/null 2>&1; then
  COMPOSE="docker compose"
else
  COMPOSE="docker-compose"
fi

$COMPOSE down
echo "✓ Stopped. State preserved in ./data and ./workflows."
