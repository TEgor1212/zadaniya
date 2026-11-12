param(
  [Parameter(Mandatory=$true)][string]$SourceRepo,
  [Parameter(Mandatory=$true)][string]$TargetRepo,
  [switch]$PushTarget
)

$ErrorActionPreference = 'Stop'

if (!(Test-Path $SourceRepo)) { throw "Source path not found: $SourceRepo" }
if (!(Test-Path (Join-Path $SourceRepo '.git'))) { throw "Source is not a git repo: $SourceRepo" }
if (!(Test-Path $TargetRepo)) { throw "Target path not found: $TargetRepo" }

Write-Host "[1/3] git pull in source: $SourceRepo"
git -C $SourceRepo pull --ff-only

Write-Host "[2/3] Copy source -> target (excluding .git)"
# Mirror contents excluding .git
$items = Get-ChildItem -Force -LiteralPath $SourceRepo | Where-Object { $_.Name -ne '.git' }
# Clean target except .git
Get-ChildItem -Force -LiteralPath $TargetRepo | Where-Object { $_.Name -ne '.git' } | Remove-Item -Recurse -Force
foreach ($item in $items) {
  Copy-Item -LiteralPath $item.FullName -Destination $TargetRepo -Recurse -Force
}

if ($PushTarget) {
  Write-Host "[3/3] Commit and push in target: $TargetRepo"
  git -C $TargetRepo add -A
  git -C $TargetRepo diff --cached --quiet
  if ($LASTEXITCODE -ne 0) {
    $msg = "Sync update $(Get-Date -Format o)"
    git -C $TargetRepo commit -m $msg
    git -C $TargetRepo push
  } else {
    Write-Host "No changes to commit in target."
  }
} else {
  Write-Host "[3/3] Push skipped."
}

Write-Host "Sync completed."
