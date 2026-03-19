# Conformance Model

The national conformance model is actor-based so that implementation partners can understand their obligations according to system role, rather than having to infer them from every artefact individually.

## Primary actors

| Actor | Role in the national model | Core FHIR artefacts |
| --- | --- | --- |
| HIS Order Placer | Creates or updates the radiology order and consumes downstream workflow state. | `ServiceRequest`, `Task`, `Appointment` |
| RIS Workflow Manager | Receives, accepts, schedules, tracks, and fulfils the order. | `ServiceRequest`, `Task`, `Appointment`, `Procedure`, `ImagingStudy`, `DiagnosticReport`, `Observation` |
| PACS or VNA Metadata Publisher | Exposes imaging study metadata and, where applicable, packaged documents to FHIR consumers. | `ImagingStudy`, `DocumentReference` |
| EHR or Clinician Viewer Consumer | Reads report content, follows study links, and presents results in care workflows. | `DiagnosticReport`, `ImagingStudy`, `DocumentReference` |
| National Validation Consumer | Reads artefacts, instances, and behaviour claims for conformance verification. | CapabilityStatements, profiles, examples, test assets |

## Conformance views

- `Core mandatory`: required for any implementation partner claiming alignment to the national radiology FHIR layer
- `Conditional mandatory`: required when the partner supports the relevant function, such as scheduling, document packaging, or viewer retrieval
- `Future or optional`: retained in the repository as design scaffolding for later phases, including selected cross-enterprise exchange functions

## Source of truth by layer

- order fulfilment and workflow state authority remains with the operational systems, especially the RIS
- imaging object authority remains with the archive and DICOM layer
- report state authority remains with the reporting system or RIS
- FHIR exposes and synchronises those states for integration, publication, and conformance testing

## Core expectations

- support the profiles relevant to the actor role
- honour the search and interaction behaviour declared in the applicable CapabilityStatement
- preserve identifier linkage between order, procedure, study, and report
- treat `PROVISIONAL` endpoint, terminology, and identifier content as configurable rather than fixed
- maintain consistency with the workflow and annex chapters in the repository
