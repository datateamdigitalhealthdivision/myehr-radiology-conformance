# 06 Reporting

## Purpose

Define how radiology results are authored, verified, amended, and distributed back to clinical systems.

## Actors

- radiologist or reporting system
- RIS
- HIS or EHR consumer
- PACS or viewer platform for image access

## Trigger

Images and clinical context are available for interpretation.

## Preconditions

- study metadata and images can be accessed
- order and patient linkage is intact
- authoring and verification roles are known

## Postconditions

- a `DiagnosticReport` is published with the appropriate status
- optional structured `Observation` resources are linked where used
- report recipients can retrieve both report and imaging context

## Source of truth

The reporting system or RIS is the source of truth for report content and report status.

## Sequence summary

1. Reporting system retrieves study context and images.
2. Radiologist drafts and verifies the report.
3. `DiagnosticReport` is published as preliminary, final, amended, or addendum according to policy.
4. Downstream consumers retrieve the result and linked study metadata.

## FHIR artefacts involved

- `DiagnosticReport`
- `Observation`
- `ImagingStudy`
- `Procedure`
- `ServiceRequest`

## DICOM or DICOMweb transactions involved

- image retrieval through DICOM or DICOMweb
- optional DICOM structured report usage where locally implemented

## IHE profile context

Fits the reporting and result communication expectations surrounding Scheduled Workflow.

## Required data elements

- report identifier
- report status
- issued date and time
- conclusion or narrative findings
- coded conclusion where available
- author, verifier, and performer details
- links to one or more imaging studies

## Status transitions

- `DiagnosticReport.status`: `preliminary`, `final`, `amended`, `appended`, or `entered-in-error`

## Acknowledgements or response expectations

Report publication should be durable and discoverable. Consumers should be able to distinguish preliminary from final and amended reports.

## Errors or edge cases

- study available but report delayed
- amended report after prior clinical consumption
- one report covering multiple studies
- structured findings omitted where narrative remains primary

## Security and audit considerations

Authoring and verification actions must be attributable. Access to report content should follow the same confidentiality controls as other clinical data.

## Test assertions

- final reports link to the relevant `ImagingStudy`
- amended reports preserve traceability to the earlier state
- structured observations, when present, are reachable from `DiagnosticReport.result`

## Implementation notes

Narrative reporting remains the primary pattern in this first draft. Structured observations should be used where they add clear value, especially for quantitative imaging.

## Open issues or local decisions pending

- national rules for addendum versus amendment semantics are `TO BE CONFIRMED`
- the role of DICOM SR in the national baseline remains `TO BE CONFIRMED`

