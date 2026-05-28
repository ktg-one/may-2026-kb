# Portable automation station — stop (Windows PowerShell)
Set-Location $PSScriptRoot
docker compose down
Write-Host "✓ Stopped. State preserved in ./data and ./workflows." -ForegroundColor Green
