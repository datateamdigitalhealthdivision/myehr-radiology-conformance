# 03 Actor Model

## Purpose

The national conformance model is actor-based so that implementation partners can understand their obligations according to system role rather than by reading every artefact in the repository.

## Core actors

### HIS Order Placer

The hospital information system or CPOE platform that creates or updates the radiology order, supplies patient and encounter context, and consumes downstream status updates.

### RIS Workflow Manager

The radiology information system that receives orders, manages acceptance and scheduling, tracks work status, and coordinates reporting.

### Modality

The acquisition device or modality workstation that consumes worklist information, performs imaging, and produces DICOM output and performed procedure status.

### PACS or VNA

The image archive and retrieval platform that stores imaging content, supports DICOM or DICOMweb access, and may publish ImagingStudy metadata to FHIR consumers.

### Reporting System

The reporting application or RIS component that authors, verifies, amends, and publishes radiology reports and structured observations where used.

### EHR or Clinician Viewer Consumer

The clinical application that retrieves report content, imaging metadata, and links to viewing endpoints for care delivery.

### National Validation Or Conformance Consumer

The future validation environment or test harness that checks payload conformance, search behaviour, and actor capability declarations.

## Relationship to FHIR artefacts

- `ServiceRequest` represents the imaging order request.
- `Task` represents workflow state visibility between systems.
- `Appointment` represents scheduled booking when the deployment uses a FHIR-facing scheduling flow.
- `Procedure` represents the performed imaging act.
- `ImagingStudy` represents FHIR-facing imaging metadata aligned to the DICOM study.
- `DiagnosticReport` represents the report communication layer.
- `Observation` represents structured findings or measurements when appropriate.
- `DocumentReference` is reserved for packaging or cross-enterprise document sharing scenarios.

## Responsibility boundaries

The RIS remains the operational workflow authority for order fulfilment and status. The archive remains the authority for stored image objects. The reporting system or RIS remains the authority for report state. FHIR exposes and synchronises these states but does not replace operational ownership.
