# Conformance Model

The national conformance model is actor-based so that implementation partners can understand their obligations according to system role, rather than having to infer them from every artefact individually.

## Primary actors

| Actor | Role in the national model | Core FHIR artefacts |
| --- | --- | --- |
| HIS Order Placer | Creates or updates the radiology order and consumes downstream workflow state. | `ServiceRequest`, `Task`, `Appointment`, optional `DocumentReference`, optional `List` |
| RIS Workflow Manager | Receives, accepts, schedules, tracks, fulfils, and publishes the order outcome. It may also expose a direct retrieval API. | `Patient`, `ServiceRequest`, `Task`, `Appointment`, `Procedure`, `ImagingStudy`, `DiagnosticReport`, `Observation`, `DocumentReference`, `List`, `Endpoint`, optional `$impacs-ris-sync` |
| PACS or VNA Metadata Publisher | Exposes imaging study metadata and, where applicable, packaged documents to FHIR consumers. | `ImagingStudy`, `DocumentReference`, `Endpoint` |
| EHR or Clinician Viewer Consumer | Reads report content, follows study links, and presents results in care workflows. | `DiagnosticReport`, `ImagingStudy`, `DocumentReference`, `List`, `Endpoint` |
| MHD Document Source | Conditionally submits radiology documents into a national or regional document-sharing fabric. | `Bundle`, `DocumentReference`, `List`, `Binary` |
| MHD Document Recipient | Conditionally receives and serves document submissions and document queries. | `Bundle`, `DocumentReference`, `List`, `Binary`, `AuditEvent` |
| Direct-RIS Retrieval Consumer | Conditionally performs scheduled retrieval against a RIS using standard searches or the preserved RadioConnect-style optional operation. | `Patient`, `ServiceRequest`, `ImagingStudy`, `DiagnosticReport`, `Location`, optional `$impacs-ris-sync` |
| RadioConnect Local Node | Mediates between site PACS or RIS environments and the national exchange. Acts as a combined RIS Workflow Manager and PACS Metadata Publisher at the FHIR layer and includes a DICOM gateway for legacy PACS mediation. | `ServiceRequest`, `Task`, `ImagingStudy`, `DiagnosticReport`, `Endpoint`, `Procedure`, `Observation` |
| RadioConnect Central Node | National coordination and federation point managing cross-site discovery, routing, and controlled access. It may also act as an MHD Document Recipient. | `ImagingStudy`, `DiagnosticReport`, `DocumentReference`, `List`, `Binary`, `AuditEvent` |
| National Validation Consumer | Reads artefacts, instances, and behaviour claims for conformance verification. | CapabilityStatements, profiles, examples, test assets, negative payloads |

## Actor obligation matrix

| Actor | Profile or behaviour | Element or behaviour | Obligation |
| --- | --- | --- | --- |
| HIS Order Placer | `ServiceRequest` | `identifier:placerOrder`, `code`, `subject`, `authoredOn`, `requester` | SHALL produce |
| HIS Order Placer | `ServiceRequest` | `reasonCode`, `bodySite`, `locationReference`, `encounter`, `supportingInfo` | SHALL support and SHOULD produce when clinically relevant |
| RIS Workflow Manager | `Patient` | `read` and `search-type` by identifier, with optional name and birthdate search | SHALL support |
| RIS Workflow Manager | `Task` | `businessStatus`, `statusReason`, `output` | SHALL produce |
| RIS Workflow Manager | `DiagnosticReport` | `patient`, `identifier`, `status`, `category`, and `issued` search | SHALL support |
| RIS Workflow Manager | `ImagingStudy` | `identifier:studyInstanceUID`, accession linkage, `patient` search, and DICOMweb endpoint linkage | SHALL produce and SHALL support |
| RIS Workflow Manager | Optional `$impacs-ris-sync` | `from`, `to`, optional `patientId`, `_count`, `_page` parameters | MAY support as a preserved partner pattern |
| PACS or VNA Metadata Publisher | `ImagingStudy` | `identifier:studyInstanceUID`, `endpoint`, `series.uid`, `series.modality`, `series.numberOfInstances` | SHALL produce |
| MHD Document Source | `DocumentReference` | `masterIdentifier`, `category`, `content.format`, `context.facilityType`, `context.practiceSetting`, `securityLabel` | SHALL produce when document sharing is in scope |
| MHD Document Source | `List` | SubmissionSet `identifier`, `sourceId`, `subject`, `date`, `entry.item` | SHALL produce when document sharing is in scope |
| MHD Document Recipient | `DocumentReference` and `List` | ITI-65 transaction acceptance, ITI-66 or ITI-67 search, ITI-68 retrieval | SHALL support when document sharing is in scope |
| Direct-RIS Retrieval Consumer | Search or operation behaviour | Scheduled polling windows, patient-scoped retrieval, and reconciliation checks | SHALL support when the partner claims direct retrieval capability |
| National Validation Consumer | All core artefacts | instance validation, invariant checking, search-behaviour verification, and document-sharing metadata checks | SHALL support |

## Must Support interpretation

In this guide, `Must Support` has a specific national meaning for implementation partners and conformance testing.

- Sending systems SHALL populate a `Must Support` element when the data is known, clinically relevant, and within the actor's responsibility to produce.
- Receiving systems SHALL be able to receive, parse, store, and make the element available for downstream workflow, display, or validation.
- User-facing consuming systems SHALL display the element, or otherwise act on it, where it is relevant to the actor role and workflow context.
- Validation and procurement testing SHALL assess `Must Support` obligations in combination with the actor matrix on this page. A sender is not conformant if it systematically omits a `Must Support` element that the matrix says it SHALL produce.
- `Must Support` does not mean that every element is mandatory in every clinical circumstance. It means the implementation shall handle the element properly whenever the national workflow expects it.

## Conformance views

- `Core mandatory`: required for any implementation partner claiming alignment to the national radiology FHIR layer
- `Conditional mandatory`: required when the partner supports the relevant function, such as scheduling, document packaging, direct retrieval, or document sharing
- `Future or optional`: retained in the repository as design scaffolding for later phases, including selected cross-enterprise exchange functions

## Source of truth by layer

- order fulfilment and workflow state authority remains with the operational systems, especially the RIS
- imaging object authority remains with the archive and DICOM layer
- report state authority remains with the reporting system or RIS
- document registry and repository behaviour remains an infrastructure responsibility where MHD is deployed
- FHIR exposes and synchronises those states for integration, publication, and conformance testing

## Core expectations

- support the profiles relevant to the actor role
- honour the search and interaction behaviour declared in the applicable CapabilityStatement
- preserve identifier linkage between order, procedure, study, report, document package, and document submission set
- support patient-centric search across the applicable order, workflow, study, report, and document resources
- treat `Task.businessStatus`, `DiagnosticReport.category = RAD`, and the required MHD metadata bindings as computable national interoperability requirements rather than narrative guidance
- treat `PROVISIONAL` endpoint, terminology, and identifier content as configurable rather than fixed
- maintain consistency with the workflow and annex chapters in the repository
