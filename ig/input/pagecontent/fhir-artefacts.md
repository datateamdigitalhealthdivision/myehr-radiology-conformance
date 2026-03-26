# FHIR Artefacts

This page brings together the key computable artefacts published by the guide and explains how implementation partners should use them.

## What each artefact page provides

The generated artefact pages are not only file downloads. Each published resource page gives structured implementation detail, including:

- a narrative summary and canonical metadata
- the differential view showing what this guide constrains from base FHIR or MY Core
- the snapshot view showing the full expected payload shape
- terminology bindings, invariants, and cardinality rules
- JSON and XML serialisations suitable for implementation and validation
- linked examples where the guide publishes them

The complete published index is available at [Artefact Index](artifacts.html).

## Profiles

| Profile | Purpose | Key Must Support focus | Example |
| --- | --- | --- | --- |
| [MYRadiologyServiceRequest](StructureDefinition-my-radiology-service-request.html) | Imaging order profile. | Placer order identifier, provisional accession identifier, requested procedure, patient, encounter, requester, clinical indication, body site, location, supporting information. | [Example](ServiceRequest-my-radiology-service-request-example.html) |
| [MYRadiologyTask](StructureDefinition-my-radiology-task.html) | Workflow state synchronisation profile. | Task status, focus, patient, authored and modified timestamps, owner, business status, status reason, output. | [Example](Task-my-radiology-task-example.html) |
| [MYRadiologyAppointment](StructureDefinition-my-radiology-appointment.html) | Optional scheduling profile. | Based-on order linkage, scheduled times, participants, supporting information, booking comments. | [Example](Appointment-my-radiology-appointment-example.html) |
| [MYRadiologyProcedure](StructureDefinition-my-radiology-procedure.html) | Performed imaging act. | Based-on order, performed time, performer, location, body site, downstream report linkage. | [Example](Procedure-my-radiology-procedure-example.html) |
| [MYRadiologyImagingStudy](StructureDefinition-my-radiology-imaging-study.html) | FHIR-facing study metadata aligned to DICOM. | `StudyInstanceUID`, accession linkage, subject, procedure linkage, WADO-RS `endpoint`, modality, started time, and series detail. | [Example](ImagingStudy-my-radiology-imaging-study-example.html) |
| [MYRadiologyDicomWebEndpoint](StructureDefinition-my-radiology-dicomweb-endpoint.html) | DICOMweb retrieval endpoint profile. | `connectionType = dicom-wado-rs`, endpoint name, organisation, base WADO-RS address, payload MIME type. | [Example](Endpoint-my-radiology-dicomweb-endpoint-example.html) |
| [MYRadiologyDiagnosticReport](StructureDefinition-my-radiology-diagnostic-report.html) | Radiology report publication. | Based-on order, report code, subject, issued time, performer, interpreter, imaging study links, result links, conclusion, and PDF rendered form. | [Example](DiagnosticReport-my-radiology-diagnostic-report-example.html) |
| [MYRadiologyObservation](StructureDefinition-my-radiology-observation.html) | Structured findings or quantitative measurements. | Imaging category, finding code, subject, encounter, value, body site, derived-from study linkage. | [Example](Observation-my-radiology-observation-example.html) |
| [MYRadiologyDocumentReference](StructureDefinition-my-radiology-document-reference.html) | Packaged report document and document-sharing profile. | Document unique identifier, class code, confidentiality label, format code, facility type, practice setting, and related workflow links. | [Example](DocumentReference-my-radiology-mhd-document-reference-example.html) |
| [MYRadiologyMHDSubmissionSet](StructureDefinition-my-radiology-mhd-submission-set.html) | MHD SubmissionSet profile. | OID-style submission identifier, `sourceId`, content type, patient, submission time, author, and member documents. | [Example](List-my-radiology-mhd-submission-set-example.html) |
| [MYRadiologyMHDAuditEvent](StructureDefinition-my-radiology-mhd-audit-event.html) | MHD audit profile. | ITI transaction event type, action, outcome, source and destination agents, patient, submission set, and document entities. | [Example](AuditEvent-my-radiology-mhd-audit-event-example.html) |
| [MYRadiologyProvenance](StructureDefinition-my-radiology-provenance.html) | Audit-grade provenance for authored, amended, and published radiology content. | Target resource linkage, recorded timestamp, responsible agent, activity, and reason. | [Example](Provenance-my-radiology-provenance-example.html) |

## Capability statements

| Capability statement | Intended actor | Main interactions |
| --- | --- | --- |
| [HIS Order Placer](CapabilityStatement-my-radiology-his-order-placer.html) | HIS or CPOE partner placing orders. | `create`, `read`, and `search-type` on `ServiceRequest`; `read` and `search-type` on `Task`; document and SubmissionSet discovery where document sharing is in scope. |
| [RIS Workflow Manager](CapabilityStatement-my-radiology-ris-workflow-manager.html) | RIS partner acting as the operational order filler. | Create, update, read, and search across order, workflow, scheduling, procedure, patient, study, report, observation, document, location, and retrieval endpoint resources, plus optional `$impacs-ris-sync`. |
| [PACS Metadata Publisher](CapabilityStatement-my-radiology-pacs-metadata-publisher.html) | PACS or VNA partner exposing metadata. | `read` and `search-type` on `ImagingStudy`; `read` on `Endpoint`; optional packaged-document support through `DocumentReference`. |
| [Viewer Consumer](CapabilityStatement-my-radiology-viewer-consumer.html) | Viewer or EHR partner consuming results. | `read` and `search-type` on `DiagnosticReport`, `ImagingStudy`, `DocumentReference`, and `List`, plus `read` on `Endpoint` for retrieval resolution. |
| [Validation Consumer](CapabilityStatement-my-radiology-validation-consumer.html) | Conformance testing and validation participants. | `read` and `search-type` across the core artefacts required for validation, including document-sharing resources. |
| [MHD Document Source](CapabilityStatement-my-radiology-mhd-document-source.html) | RIS, PACS, VNA, or document-producing partner submitting content to an MHD gateway. | `transaction` with `DocumentReference`, `List`, and `Binary` creation inside ITI-65 bundles. |
| [MHD Document Recipient](CapabilityStatement-my-radiology-mhd-document-recipient.html) | Central document gateway or registry. | `transaction`, `read`, and `search-type` across `DocumentReference`, `List`, and `Binary`. |

## Document sharing artefacts

| Artefact type | Published artefacts | Purpose |
| --- | --- | --- |
| Value sets | [XDS Class Code](ValueSet-my-radiology-xds-class-code-vs.html), [XDS Format Code](ValueSet-my-radiology-xds-format-code-vs.html), [XDS Facility Type](ValueSet-my-radiology-xds-facility-type-vs.html), [XDS Practice Setting](ValueSet-my-radiology-xds-practice-setting-vs.html), [XDS Confidentiality](ValueSet-my-radiology-xds-confidentiality-vs.html), [XDS Content Type](ValueSet-my-radiology-xds-content-type-vs.html), [XDS Event Code](ValueSet-my-radiology-xds-event-code-vs.html) | Provide the mandatory MHD or XDS-aligned coded metadata used in document submissions and queries. |
| Code systems | [XDS Class Code](CodeSystem-my-radiology-xds-class-code-cs.html), [XDS Facility Type](CodeSystem-my-radiology-xds-facility-type-cs.html), [XDS Practice Setting](CodeSystem-my-radiology-xds-practice-setting-cs.html), [XDS Content Type](CodeSystem-my-radiology-xds-content-type-cs.html) | Publish the current local drafting vocabulary for document-sharing metadata where no final national code system exists yet. |
| Profiles | [MHD Submission Set](StructureDefinition-my-radiology-mhd-submission-set.html), [MHD AuditEvent](StructureDefinition-my-radiology-mhd-audit-event.html), [DocumentReference](StructureDefinition-my-radiology-document-reference.html) | Define the computable document-sharing payload shape. |
| Capability statements | [MHD Document Source](CapabilityStatement-my-radiology-mhd-document-source.html), [MHD Document Recipient](CapabilityStatement-my-radiology-mhd-document-recipient.html) | Define actor-facing behaviour for document submission, query, and retrieval. |
| Naming systems | [Document Unique ID Naming System](NamingSystem-MYDocumentUniqueIdNamingSystem.html) | Carries the provisional OID and URI model for document unique identifiers. |

## Operations

| Operation | Purpose | Notes |
| --- | --- | --- |
| [IMPACS RIS Sync](OperationDefinition-impacs-ris-sync.html) | Preserved optional direct-RIS retrieval operation for scheduled synchronisation. | `OPTIONAL`. Standard resource read and search interactions remain the national baseline. |

## Examples and workflow payloads

| Artefact | Use |
| --- | --- |
| [Radiology Order Workflow Bundle](Bundle-my-radiology-order-workflow-bundle-example.html) | Shows the order-to-report journey as one machine-readable collection. |
| [Radiology Order Submission Transaction](Bundle-my-radiology-order-submission-transaction-example.html) | Shows a realistic transaction-based onboarding or sandbox submission pattern. |
| [MHD Provide Document Bundle](Bundle-my-radiology-mhd-provide-document-bundle-example.html) | Shows the complete ITI-65 transaction structure for document submission. |
| [MHD Submission Set](List-my-radiology-mhd-submission-set-example.html), [MHD DocumentReference](DocumentReference-my-radiology-mhd-document-reference-example.html), [MHD AuditEvent](AuditEvent-my-radiology-mhd-audit-event-example.html) | Show the core MHD resources as standalone worked examples. |
| [RadioConnect Sync Bundle](Bundle-my-radiology-radioconnect-sync-bundle-example.html) | Shows the preserved optional direct-RIS retrieval response shape. |
| [Invalid ServiceRequest OperationOutcome](OperationOutcome-my-radiology-invalid-service-request-operationoutcome-example.html) | Shows the expected rejection shape when a partner submits an invalid order payload. |
| [Direct-RIS Accession Mismatch OperationOutcome](OperationOutcome-my-radiology-radioconnect-accession-mismatch-oo-example.html) | Shows the expected rejection or reconciliation failure response when accession linkage fails. |
| [Patient](Patient-my-patient-example.html), [Encounter](Encounter-my-encounter-example.html), [Organisation](Organization-my-organisation-example.html), [Location](Location-my-location-example.html), [Practitioner](Practitioner-my-practitioner-example.html), [PractitionerRole](PractitionerRole-my-practitioner-role-example.html) | Provide the shared supporting context for the radiology examples. |

## Payload-reading note

Implementation partners should use the generated profile pages to inspect the actual JSON and XML shape. The profile differential shows cardinality, Must Support, and binding changes. The example pages show concrete fields such as identifiers, status, category, retrieval endpoint references, terminology-coded elements, attachment metadata, document-sharing metadata, and optional direct retrieval bundle composition.
