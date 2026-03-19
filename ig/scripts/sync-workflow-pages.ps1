$ErrorActionPreference = 'Stop'

$RootDir = Split-Path -Parent $PSScriptRoot
$WorkspaceRoot = Split-Path -Parent $RootDir
Set-Location $RootDir

$WorkflowPages = @(
  @{ Source = 'docs/04-workflows/01-ordering.md'; Dest = 'input/pagecontent/workflow-01-ordering.md' },
  @{ Source = 'docs/04-workflows/02-scheduling.md'; Dest = 'input/pagecontent/workflow-02-scheduling.md' },
  @{ Source = 'docs/04-workflows/03-modality-worklist.md'; Dest = 'input/pagecontent/workflow-03-modality-worklist.md' },
  @{ Source = 'docs/04-workflows/04-acquisition-and-mpps.md'; Dest = 'input/pagecontent/workflow-04-acquisition-and-mpps.md' },
  @{ Source = 'docs/04-workflows/05-storage-and-commitment.md'; Dest = 'input/pagecontent/workflow-05-storage-and-commitment.md' },
  @{ Source = 'docs/04-workflows/06-reporting.md'; Dest = 'input/pagecontent/workflow-06-reporting.md' },
  @{ Source = 'docs/04-workflows/07-viewing-and-retrieval.md'; Dest = 'input/pagecontent/workflow-07-viewing-and-retrieval.md' },
  @{ Source = 'docs/04-workflows/08-cross-enterprise-sharing.md'; Dest = 'input/pagecontent/workflow-08-cross-enterprise-sharing.md' },
  @{ Source = 'docs/04-workflows/09-external-priors.md'; Dest = 'input/pagecontent/workflow-09-external-priors.md' },
  @{ Source = 'docs/04-workflows/10-corrections-iocm.md'; Dest = 'input/pagecontent/workflow-10-corrections-iocm.md' },
  @{ Source = 'docs/04-workflows/11-encounter-based-imaging.md'; Dest = 'input/pagecontent/workflow-11-encounter-based-imaging.md' }
)

foreach ($WorkflowPage in $WorkflowPages) {
  $SourcePath = Join-Path $WorkspaceRoot ($WorkflowPage.Source -replace '/', '\')
  $DestinationPath = Join-Path $RootDir ($WorkflowPage.Dest -replace '/', '\')
  $SourceUrl = 'https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/' + $WorkflowPage.Source

  $Footer = @(
    '## Related Pages',
    '',
    '- [Workflow Summary](workflow-summary.html)',
    '- [FHIR Artefacts](fhir-artefacts.html)',
    '- [Technical Annexes](annexes.html)',
    "- Maintained source markdown: [$($WorkflowPage.Source)]($SourceUrl)"
  ) -join "`r`n"

  $Content = (Get-Content $SourcePath -Raw).TrimEnd()
  Set-Content -Path $DestinationPath -Value ($Content + "`r`n`r`n" + $Footer + "`r`n") -Encoding UTF8
}
