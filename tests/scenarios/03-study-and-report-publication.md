# Scenario 03: Imaging Study And Report Publication

## Objective

Verify that performed imaging can be exposed through `Procedure`, `ImagingStudy`, and `DiagnosticReport` with consistent references.

## Preconditions

- acquisition is complete
- storage is successful
- report authoring is complete

## Action

Publish performed procedure, study metadata, and final report.

## Expected result

- `ImagingStudy` references the originating order
- `DiagnosticReport` references the imaging study
- optional structured findings are linked through `DiagnosticReport.result`
