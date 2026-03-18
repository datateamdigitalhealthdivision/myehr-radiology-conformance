# 07 Viewing And Retrieval

## Purpose

Define how clinical systems retrieve reports, study metadata, and images for care delivery.

## Actors

- EHR or clinician viewer consumer
- PACS or VNA
- FHIR metadata publisher

## Trigger

A clinician or authorised system needs to view a report, open imaging, or query study metadata.

## Preconditions

- the user or system is authorised
- the report and study have been published
- retrieval endpoints are reachable

## Postconditions

- report content can be read
- study metadata can be searched and retrieved
- image retrieval can be launched or consumed through DICOMweb or viewer mechanisms

## Source of truth

The reporting system is the source of truth for report content. The archive is the source of truth for image availability and retrieval.

## Sequence summary

1. Consumer searches or reads `DiagnosticReport` and `ImagingStudy`.
2. Consumer resolves study identifiers and linked imaging endpoints.
3. Consumer retrieves images or launches a viewer using the agreed endpoint pattern.

## FHIR artefacts involved

- `DiagnosticReport`
- `ImagingStudy`
- optional `DocumentReference`

## DICOM or DICOMweb transactions involved

- `QIDO-RS`
- `WADO-RS`
- rendered retrieval where supported

## IHE profile context

Supports local viewing and future cross-enterprise display patterns.

## Required data elements

- report identifier
- study identifier and `StudyInstanceUID`
- modality and series summary
- retrieval endpoint or viewer launch context where exposed

## Status transitions

There is no primary workflow status transition in this chapter beyond access logging and normal report lifecycle consumption.

## Acknowledgements or response expectations

Consumers should receive stable read and retrieval responses and clear errors when access is denied or content is unavailable.

## Errors or edge cases

- report available before images are retrievable
- study metadata published without complete series details
- temporary retrieval failure from the archive
- viewer launched without sufficient patient context

## Security and audit considerations

Viewer and retrieval access must enforce patient confidentiality, support audit logging, and avoid leaking direct archive endpoints without appropriate control.

## Test assertions

- a consumer can read a report and follow its imaging study linkage
- a valid study identifier can be used to retrieve study metadata
- retrieval failures return clear and safe error behaviour

## Implementation notes

The national pattern favours stable identifier-based retrieval rather than ad hoc URL conventions embedded in local applications.

## Open issues or local decisions pending

- the final national viewer launch pattern is `TO BE CONFIRMED`
- whether rendered retrieval is mandatory in sandbox is `TO BE CONFIRMED`
