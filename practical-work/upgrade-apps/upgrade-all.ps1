# Windows app upgrade via winget
$ErrorActionPreference = 'Stop'
Write-Host "=== winget upgrade --all ==="
winget upgrade --all
Write-Host "Done."
