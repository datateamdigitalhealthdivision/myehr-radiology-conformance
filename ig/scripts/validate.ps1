$ErrorActionPreference = 'Stop'

$RootDir = Split-Path -Parent $PSScriptRoot
$WorkspaceRoot = Split-Path -Parent $RootDir
$env:HOME = $WorkspaceRoot
$env:USERPROFILE = $WorkspaceRoot
Set-Location $RootDir

$LocalSushi = Join-Path $RootDir 'node_modules/.bin/sushi.cmd'
$SushiCommand = if (Test-Path $LocalSushi) {
  $LocalSushi
} else {
  $GlobalSushi = Get-Command sushi -ErrorAction SilentlyContinue
  if (-not $GlobalSushi) {
    throw 'fsh-sushi is required but was not found on PATH.'
  }
  $GlobalSushi.Source
}

& (Join-Path $PSScriptRoot 'sync-fsh-inputs.ps1')
& (Join-Path $PSScriptRoot 'sync-workflow-pages.ps1')
& (Join-Path $PSScriptRoot 'seed-mycore.ps1')

Write-Host 'Validating FSH syntax with SUSHI...'
& $SushiCommand '.'
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}

if (-not (Test-Path 'fsh-generated/resources')) {
  throw 'Expected generated resources were not created.'
}

Write-Host 'SUSHI validation completed.'
