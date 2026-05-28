# Portable automation station — start (Windows PowerShell, no WSL)
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Test-Path ".env")) {
  if (Test-Path ".env.example") {
    Copy-Item ".env.example" ".env"
    # Generate encryption key
    $bytes = New-Object byte[] 32
    [Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($bytes)
    $key = -join ($bytes | ForEach-Object { $_.ToString("x2") })
    (Get-Content ".env") -replace "REPLACE_ME_openssl_rand_hex_32", $key | Set-Content ".env"
    Write-Host "→ Generated N8N_ENCRYPTION_KEY in .env (back this up)"
  } else {
    Write-Host "✗ Missing .env and .env.example. Aborting." -ForegroundColor Red
    exit 1
  }
}

New-Item -ItemType Directory -Force -Path data, workflows | Out-Null

Write-Host "→ Starting n8n..."
docker compose up -d

$port = 5678
$env_content = Get-Content ".env" | Where-Object { $_ -match "^N8N_PORT=" }
if ($env_content) { $port = ($env_content -split "=")[1] }

Write-Host "→ Waiting for n8n to be healthy (up to 60s)..."
for ($i = 0; $i -lt 30; $i++) {
  try {
    $r = Invoke-WebRequest "http://localhost:$port/healthz" -UseBasicParsing -TimeoutSec 3
    if ($r.StatusCode -eq 200) {
      Write-Host "✓ n8n is up at http://localhost:$port" -ForegroundColor Green
      Write-Host ""
      Write-Host "Next steps:"
      Write-Host "  1. Open http://localhost:$port in browser"
      Write-Host "  2. Complete first-run setup"
      Write-Host "  3. Settings → API → Create API Key"
      Write-Host "  4. Paste into .env as N8N_API_KEY"
      Write-Host "  5. Add MCP block from claude-code-mcp.json to Claude Code config"
      exit 0
    }
  } catch { Start-Sleep -Seconds 2 }
}

Write-Host "⚠ n8n didn't pass healthcheck in 60s. Check: docker compose logs n8n" -ForegroundColor Yellow
