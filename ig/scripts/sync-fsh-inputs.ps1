$ErrorActionPreference = 'Stop'

$RootDir = Split-Path -Parent $PSScriptRoot
Set-Location $RootDir

$ExampleDest = Join-Path $RootDir 'input/fsh/examples-generated'
$VocabDest = Join-Path $RootDir 'input/fsh/vocab-generated'

New-Item -ItemType Directory -Force -Path $VocabDest | Out-Null
Get-ChildItem -Path $ExampleDest -Filter *.fsh -ErrorAction SilentlyContinue | Remove-Item -Force
Get-ChildItem -Path $VocabDest -Filter *.fsh -ErrorAction SilentlyContinue | Remove-Item -Force

$VocabSource = Join-Path $RootDir 'input/vocab'
if (Test-Path $VocabSource) {
  Get-ChildItem -Path $VocabSource -Filter *.fsh -ErrorAction SilentlyContinue |
    ForEach-Object { Copy-Item $_.FullName -Destination $VocabDest -Force }
}
