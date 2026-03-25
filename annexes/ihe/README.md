# IHE Annex

## Purpose

This annex explains how IHE profiles and patterns relate to the national radiology conformance repository.

## Scheduled Workflow

IHE Scheduled Workflow remains the main narrative choreography reference for:

- order placement
- scheduling
- modality worklist
- performed procedure progress
- reporting hand-off

The FHIR artefacts in this repository expose the computable exchange layer around those steps. They do not replace the underlying DICOM or IHE choreography.

## Mobile Access To Health Documents (MHD)

This repository now adopts IHE MHD as the preferred FHIR-native document-sharing mechanism where radiology reports or packaged documents need to move across organisational boundaries.

- `DocumentReference` carries document metadata
- `List` carries the SubmissionSet
- `Binary` carries the payload where required
- `AuditEvent` carries the audit trail for submission, query, and retrieval

MHD may operate standalone or as a bridge to backend XDS.b infrastructure.

## Optional direct-RIS retrieval pattern

The preserved RadioConnect direct-RIS retrieval pattern is documented as a partner pattern rather than as a new IHE profile.

- it may use standard search and read interactions
- it may also use the optional `$impacs-ris-sync` operation where both parties support it
- it should not be mistaken for the national baseline for all implementations

## Relationship to the FHIR layer

- `ServiceRequest`, `Task`, `Procedure`, `ImagingStudy`, and `DiagnosticReport` remain the primary workflow-facing resources
- `DocumentReference` and `List` become important when document sharing is in scope
- CapabilityStatements identify which actors are expected to support which interactions
