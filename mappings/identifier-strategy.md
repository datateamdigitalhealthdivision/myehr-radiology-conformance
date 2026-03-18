# Identifier Strategy Mapping Note

This mapping note complements the main identifier chapter.

## Resource-specific expectations

- `ServiceRequest.identifier`: business order identifiers and the provisional accession identifier slice
- `Appointment.identifier`: booking identifier where scheduling is used
- `Procedure.identifier`: performed procedure identifier if issued locally
- `ImagingStudy.identifier`: DICOM `StudyInstanceUID` and optional local study business identifiers
- `DiagnosticReport.identifier`: report business identifier if separate from the order

## DICOM alignment

Where DICOM identifiers are surfaced in FHIR, the identifier system URI should remain stable and the actual UID or accession value should remain unchanged by format decoration.
