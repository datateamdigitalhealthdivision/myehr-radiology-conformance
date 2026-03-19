# FHIR To DICOM Mapping

## Purpose

This note summarises how the national FHIR-facing radiology model aligns to operational DICOM and DICOMweb workflows.

## Ordering and worklist context

- `ServiceRequest.code` aligns to requested procedure information later surfaced through RIS-managed worklist flows
- `ServiceRequest.bodySite` and laterality support downstream modality worklist context where relevant
- `ServiceRequest.requester`, patient, encounter, and accession context provide the business inputs needed before DICOM Modality Worklist distribution
- `Task` expresses acceptance and readiness state around, but not instead of, DICOM worklist choreography

## Performed study alignment

- `ImagingStudy.basedOn` references the originating `ServiceRequest`
- `Procedure.basedOn` also references the originating `ServiceRequest`
- `ImagingStudy.identifier` carries DICOM-aligned identifiers such as `StudyInstanceUID`
- one requested order may yield one or more studies in split, repeat, or exceptional workflows

## Report linkage

- `DiagnosticReport.basedOn` references the order
- `DiagnosticReport.imagingStudy` references one or more performed studies
- `DiagnosticReport.result` references `Observation` resources when structured findings or measurements are published
- `DocumentReference` is reserved for document-centric packaging or cross-enterprise sharing use cases

## Boundary statement

FHIR does not replace DICOM Modality Worklist, MPPS, Storage, Storage Commitment, QIDO-RS, WADO-RS, or STOW-RS. It provides the national interoperable business and metadata layer around those workflows.
