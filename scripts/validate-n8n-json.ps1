param([string]$Root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path)
$ErrorActionPreference = 'Stop'
$files = Get-ChildItem (Join-Path $Root 'citas-api/automations/n8n') -Filter '*.json'
if ($files.Count -lt 2) { throw 'Faltan los JSON obligatorios WF-001 y WF-002.' }
foreach ($file in $files) {
  $workflow = Get-Content -Raw $file.FullName | ConvertFrom-Json
  if (-not $workflow.name -or -not $workflow.nodes -or -not $workflow.connections) { throw "Workflow inválido: $($file.Name)" }
  $raw = Get-Content -Raw $file.FullName
  if ($raw -match '(?i)(password|secret|oauth|api[_-]?key)\s*[:=]\s*"(?!\=\{\{)[^"]+"') { throw "Posible credencial incrustada: $($file.Name)" }
  Write-Output "PASS $($file.Name): $($workflow.nodes.Count) nodos"
}
