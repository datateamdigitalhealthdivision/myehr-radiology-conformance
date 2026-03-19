$ErrorActionPreference = 'Stop'

$RootDir = Split-Path -Parent $PSScriptRoot
$WorkspaceRoot = Split-Path -Parent $RootDir
$env:HOME = $WorkspaceRoot
$env:USERPROFILE = $WorkspaceRoot
Set-Location $RootDir

$ToolsDir = Join-Path $WorkspaceRoot 'tools'
$LocalRubyHome = Join-Path $ToolsDir 'ruby-home'
$LocalGemHome = Join-Path $LocalRubyHome 'gems'
$LocalGemBin = Join-Path $LocalGemHome 'bin'
$LocalDevkit = Get-ChildItem -Path $ToolsDir -Directory -Filter 'ruby-*-devkit' -ErrorAction SilentlyContinue |
  Sort-Object Name -Descending |
  Select-Object -First 1

if ($LocalDevkit) {
  $PathEntries = @(
    (Join-Path $LocalDevkit.FullName 'bin'),
    (Join-Path $LocalDevkit.FullName 'msys64/ucrt64/bin'),
    (Join-Path $LocalDevkit.FullName 'msys64/usr/bin'),
    $LocalGemBin
  ) | Where-Object { Test-Path $_ }

  if ($PathEntries.Count -gt 0) {
    $env:PATH = (($PathEntries -join ';') + ';' + $env:PATH)
  }

  if (Test-Path $LocalGemHome) {
    $env:GEM_HOME = $LocalGemHome
    $env:GEM_PATH = $LocalGemHome
  }

  if (Test-Path (Join-Path $LocalRubyHome '.cache')) {
    $env:XDG_CACHE_HOME = Join-Path $LocalRubyHome '.cache'
  }
}

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
& (Join-Path $PSScriptRoot 'seed-mycore.ps1')

Write-Host 'Running SUSHI...'
& $SushiCommand '.'
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}

$InputCacheDir = Join-Path $RootDir 'input-cache'
$PublisherJar = Join-Path $InputCacheDir 'publisher.jar'
New-Item -ItemType Directory -Force -Path $InputCacheDir | Out-Null

if (-not (Test-Path $PublisherJar)) {
  Write-Host 'Downloading HL7 IG Publisher...'
  Invoke-WebRequest -Uri 'https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar' -OutFile $PublisherJar
}

$JavaCommand = Get-Command java -ErrorAction SilentlyContinue
if (-not $JavaCommand) {
  throw 'Java is required but was not found on PATH.'
}

$JekyllCommand = Get-Command jekyll -ErrorAction SilentlyContinue
if (-not $JekyllCommand) {
  throw 'Jekyll is required to render the HTML guide. Install Ruby plus the jekyll gem locally, or use the GitHub Actions workflows.'
}

$PublisherHome = Join-Path $InputCacheDir ('publisher-home-' + [Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Force -Path $PublisherHome | Out-Null

$OriginalHome = $env:HOME
$OriginalUserProfile = $env:USERPROFILE
$env:HOME = $PublisherHome
$env:USERPROFILE = $PublisherHome
& (Join-Path $PSScriptRoot 'seed-mycore.ps1')

Write-Host 'Building implementation guide...'
$BuildExitCode = 0
try {
  & $JavaCommand.Source "-Duser.home=$PublisherHome" '-Xmx4g' '-jar' $PublisherJar '-no-sushi' '-ig' 'ig.ini'
  $BuildExitCode = $LASTEXITCODE
} finally {
  $env:HOME = $OriginalHome
  $env:USERPROFILE = $OriginalUserProfile
}

if ($BuildExitCode -ne 0) {
  exit $BuildExitCode
}
