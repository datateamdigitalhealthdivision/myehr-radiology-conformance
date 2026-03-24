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

## Actor obligation matrix

| Actor | Profile | Element or behaviour | Obligation |
| --- | --- | --- | --- |
| HIS Order Placer | `ServiceRequest` | `identifier:placerOrder`, `code`, `subject`, `authoredOn`, `requester` | SHALL produce |
| HIS Order Placer | `ServiceRequest` | `reasonCode`, `bodySite`, `encounter`, `supportingInfo` | SHALL support and SHOULD produce when clinically relevant |
| HIS Order Placer | `Task` | `patient`, `status`, `authored-on` search | SHALL support |
| RIS Workflow Manager | `Task` | `businessStatus`, `statusReason`, `output` | SHALL produce |
| RIS Workflow Manager | `Appointment` | booking creation and update when scheduling is exposed | SHALL produce when scheduling is in scope |
| RIS Workflow Manager | `Procedure` | performed act publication linked to the originating order | SHALL produce |
| PACS or VNA Metadata Publisher | `ImagingStudy` | `identifier:studyInstanceUID`, `endpoint`, `series.uid`, `series.modality`, `series.numberOfInstances` | SHALL produce |
| PACS or VNA Metadata Publisher | `Endpoint` | `connectionType = dicom-wado-rs`, `address` | SHALL produce when `ImagingStudy.endpoint` is referenced |
| EHR or Clinician Viewer Consumer | `DiagnosticReport` | `patient`, `status`, `issued` search and `category = RAD` filtering | SHALL support |
| EHR or Clinician Viewer Consumer | `ImagingStudy` | follow `endpoint` and series metadata | SHALL support |
| National Validation Consumer | All core profiles | instance validation, invariant checking, and declared search behaviour | SHALL support |

## Must Support interpretation

In this guide, `Must Support` has a specific national meaning for implementation partners and conformance testing.

- Sending systems SHALL populate a `Must Support` element when the data is known, clinically relevant, and within the actor's responsibility to produce.
- Receiving systems SHALL be able to receive, parse, store, and make the element available for downstream workflow, display, or validation.
- User-facing consuming systems SHALL display the element, or otherwise act on it, where it is relevant to the actor role and workflow context.
- Validation and procurement testing SHALL assess `Must Support` obligations in combination with the actor matrix on this page. A sender is not conformant if it systematically omits a `Must Support` element that the matrix says it SHALL produce.
- `Must Support` does not mean that every element is mandatory in every clinical circumstance. It means the implementation shall handle the element properly whenever the national workflow expects it.

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
- support patient-centric search across the applicable order, workflow, study, and report resources
- treat `Task.businessStatus` and `DiagnosticReport.category = RAD` as computable national interoperability requirements rather than narrative guidance
- treat `PROVISIONAL` endpoint, terminology, and identifier content as configurable rather than fixed
- maintain consistency with the workflow and annex chapters in the repository
