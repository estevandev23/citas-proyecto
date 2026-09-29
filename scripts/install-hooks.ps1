param(
  [string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)
$ErrorActionPreference = 'Stop'
foreach ($repo in @('citas-api','citas-web')) {
  $path = Join-Path $Root $repo
  git -C $path config core.hooksPath .githooks
  Write-Output "$repo hooks configurados en .githooks"
}
