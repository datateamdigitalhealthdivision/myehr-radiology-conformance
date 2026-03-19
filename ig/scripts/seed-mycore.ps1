$RootDir = Split-Path -Parent $PSScriptRoot
$WorkspaceRoot = Split-Path -Parent $RootDir
$WorkspacePackageCache = Join-Path $WorkspaceRoot '.fhir/packages'
$VendoredPackageDir = Join-Path $RootDir 'vendor-packages/hl7.fhir.uv.mycore-1.0.0/package'

$HomeDir = if ($env:HOME) {
  $env:HOME
} elseif ($env:USERPROFILE) {
  $env:USERPROFILE
} else {
  [Environment]::GetFolderPath('UserProfile')
}

$TargetCacheRoot = Join-Path $HomeDir '.fhir/packages'
$TargetRoot = Join-Path $TargetCacheRoot 'hl7.fhir.uv.mycore#1.0.0'
$TargetPackageDir = Join-Path $TargetRoot 'package'

if (-not (Test-Path (Join-Path $VendoredPackageDir 'package.json'))) {
  throw 'Vendored MY Core package snapshot is missing.'
}

New-Item -ItemType Directory -Force -Path $TargetCacheRoot | Out-Null

if (Test-Path $WorkspacePackageCache) {
  Get-ChildItem -Path $WorkspacePackageCache -Directory | ForEach-Object {
    $WorkspacePackageDir = $_.FullName
    $TargetWorkspacePackageDir = Join-Path $TargetCacheRoot $_.Name
    if (-not (Test-Path $TargetWorkspacePackageDir)) {
      Copy-Item -Recurse -Force $WorkspacePackageDir $TargetWorkspacePackageDir
    }
  }
}

if (-not (Test-Path (Join-Path $TargetPackageDir 'package.json'))) {
  New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null
  if (Test-Path $TargetPackageDir) {
    Remove-Item -Recurse -Force $TargetPackageDir
  }
  Copy-Item -Recurse -Force $VendoredPackageDir $TargetPackageDir
  Write-Host 'Seeded MY Core package cache from vendored snapshot.'
} else {
  Write-Host 'MY Core package cache already present.'
}
