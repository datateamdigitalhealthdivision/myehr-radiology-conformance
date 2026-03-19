# XDS-I And Cross-Community Imaging Annex

## Purpose

This annex describes how document and imaging sharing patterns may be applied when radiology content needs to move beyond local organisational boundaries.

## XDS-I.b

`XDS-I.b` is the main narrative pattern for discovery and sharing of imaging manifests and related report documents across enterprises. It is relevant when local FHIR and DICOMweb exchange alone does not provide the required cross-organisational discovery framework.

## XCA-I

`XCA-I` is considered a future option where cross-community exchange is needed. It is not treated as phase-1 mandatory in this first draft.

## Relationship to FHIR artefacts

- `DiagnosticReport` remains the primary clinical result resource
- `ImagingStudy` remains the FHIR-facing study metadata resource
- `DocumentReference` may be used for document packaging or cross-enterprise sharing contexts

## Current conformance stance

- local implementations should prioritise the core FHIR, DICOM, DICOMweb, and Scheduled Workflow baseline
- `XDS-I.b` is documented for planning and phased adoption
- `XCA-I` remains `FUTURE / TO BE CONFIRMED`

## Implementation note

This repository does not treat XDS-based exchange as a replacement for the local radiology workflow model. It is an additional sharing pattern where national policy requires it.
