# Overview

This guide profiles the radiology-specific FHIR-facing layer for Malaysia while reusing MY Core v1.0.1 for generic resource patterns wherever possible.

## Core resources

- `ServiceRequest` for imaging orders
- `Task` for workflow state synchronisation
- `Appointment` for scheduling where used
- `Procedure` for the performed act
- `ImagingStudy` for study metadata
- `DiagnosticReport` for report exchange
- `Observation` for structured findings or measurements
- `DocumentReference` for packaging and sharing scenarios

## Scope reminder

This guide does not replace DICOM, DICOMweb, or IHE workflow. Those remain part of the national conformance stack and are documented in the repository narrative chapters.

