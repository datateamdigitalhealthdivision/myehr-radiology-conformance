# 03 Actor Model

## Purpose

The national conformance model is actor-based so that implementation partners can understand their obligations according to system role rather than by reading every artefact in the repository.

## Core actors

### HIS Order Placer

The hospital information system or CPOE platform that creates or updates the radiology order, supplies patient and encounter context, and consumes downstream status updates.

### RIS Workflow Manager

The radiology information system that receives orders, manages acceptance and scheduling, tracks work status, coordinates reporting, and may also expose a direct retrieval API for partner synchronisation.

### Modality

The acquisition device or modality workstation that consumes worklist information, performs imaging, and produces DICOM output and performed procedure status.

### PACS or VNA

The image archive and retrieval platform that stores imaging content, supports DICOM or DICOMweb access, and may publish ImagingStudy metadata to FHIR consumers.

### Reporting System

The reporting application or RIS component that authors, verifies, amends, and publishes radiology reports and structured observations where used.

### MHD Document Source

The conditional actor that assembles and submits document-sharing payloads to an MHD recipient. In practice this may be the RIS, PACS, VNA, or another document-producing service.

### MHD Document Recipient

The conditional gateway, registry, or repository service that receives and serves document-sharing payloads and may bridge to backend XDS.b infrastructure.

### EHR or Clinician Viewer Consumer

The clinical application that retrieves report content, imaging metadata, packaged documents, and links to viewing endpoints for care delivery.

### National Validation Or Conformance Consumer

The future validation environment or test harness that checks payload conformance, search behaviour, and actor capability declarations.

## Relationship to FHIR artefacts

- `ServiceRequest` represents the imaging order request.
- `Task` represents workflow state visibility between systems.
- `Appointment` represents scheduled booking when the deployment uses a FHIR-facing scheduling flow.
- `Procedure` represents the performed imaging act.
- `ImagingStudy` represents FHIR-facing imaging metadata aligned to the DICOM study.
- `Endpoint` represents the DICOMweb retrieval endpoint referenced by `ImagingStudy`.
- `DiagnosticReport` represents the report communication layer.
- `Observation` represents structured findings or measurements when appropriate.
- `DocumentReference` represents packaged radiology documents and document-sharing metadata.
- `List` represents the MHD `SubmissionSet`.
- `AuditEvent` represents the FHIR-based audit record used for document submission, query, and retrieval.

## Minimum per-actor obligations

| Actor | Profile or behaviour | Required production or support expectation |
| --- | --- | --- |
| HIS Order Placer | `ServiceRequest` | SHALL produce order identifier, requested procedure code, patient, authored date, requester, and clinical indication where known. |
| HIS Order Placer | `Task` | SHALL support patient, status, and authored-date search for workflow visibility. |
| RIS Workflow Manager | `Patient` | SHALL support read and search by identifier, with optional name and birthdate search. |
| RIS Workflow Manager | `Task` | SHALL publish workflow `businessStatus` and SHALL include `output` when the task is completed. |
| RIS Workflow Manager | `Procedure` | SHALL produce the performed act linked back to the originating order. |
| RIS Workflow Manager | `DiagnosticReport` | SHALL support patient-centric and identifier-based retrieval. |
| PACS or VNA | `ImagingStudy` | SHALL publish `StudyInstanceUID`, retrieval `Endpoint`, and series metadata when study status is `available`. |
| MHD Document Source | `DocumentReference`, `List`, `Binary` | SHALL submit the required metadata and payload members when document sharing is claimed. |
| MHD Document Recipient | `DocumentReference`, `List`, `Binary`, `AuditEvent` | SHALL support document submission, query, retrieval, and audit publication where document sharing is in scope. |
| Viewer Consumer | `DiagnosticReport`, `ImagingStudy`, `DocumentReference`, `List`, `Endpoint` | SHALL support patient-based retrieval and SHALL follow study-to-endpoint linkage. |
| Validation Consumer | Core artefacts | SHALL validate invariants, terminology bindings, search behaviour, and document-sharing metadata. |

## Must Support interpretation

Within this repository, `Must Support` is not a decorative marker. The Ministry intends it to have practical conformance meaning.

- A producing system shall populate a `Must Support` element whenever the information is available and relevant to the workflow it supports.
- A consuming system shall be able to receive, parse, store, and make use of the element.
- A viewer or user-facing consumer shall present the element, or otherwise use it operationally, when that is relevant to the actor role.
- Conformance testing should assess `Must Support` together with the actor-specific obligations above rather than in isolation.

## Responsibility boundaries

The RIS remains the operational workflow authority for order fulfilment and status. The archive remains the authority for stored image objects. The reporting system or RIS remains the authority for report state. Document gateways remain infrastructure actors rather than clinical truth sources. FHIR exposes and synchronises these states but does not replace operational ownership.
