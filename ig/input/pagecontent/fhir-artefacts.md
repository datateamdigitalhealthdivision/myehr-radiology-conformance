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
| [MYRadiologyServiceRequest](StructureDefinition-my-radiology-service-request.html) | Imaging order profile. | Placer order identifier, provisional accession identifier, requested procedure, patient, encounter, requester, clinical indication, body site, supporting information. | [Example](ServiceRequest-my-radiology-service-request-example.html) |
| [MYRadiologyTask](StructureDefinition-my-radiology-task.html) | Workflow state synchronisation profile. | Task status, focus, patient, authored and modified timestamps, owner, business status, status reason, notes. | [Example](Task-my-radiology-task-example.html) |
| [MYRadiologyAppointment](StructureDefinition-my-radiology-appointment.html) | Optional scheduling profile. | Based-on order linkage, scheduled times, participants, supporting information, booking comments. | [Example](Appointment-my-radiology-appointment-example.html) |
| [MYRadiologyProcedure](StructureDefinition-my-radiology-procedure.html) | Performed imaging act. | Based-on order, performed time, performer, location, body site, downstream report linkage. | [Example](Procedure-my-radiology-procedure-example.html) |
| [MYRadiologyImagingStudy](StructureDefinition-my-radiology-imaging-study.html) | FHIR-facing study metadata aligned to DICOM. | `StudyInstanceUID`, accession linkage, subject, procedure linkage, WADO-RS `endpoint`, modality, started time, and series detail. | [Example](ImagingStudy-my-radiology-imaging-study-example.html) |
| [MYRadiologyDicomWebEndpoint](StructureDefinition-my-radiology-dicomweb-endpoint.html) | DICOMweb retrieval endpoint profile. | `connectionType = dicom-wado-rs`, endpoint name, organisation, base WADO-RS address, payload MIME type. | [Example](Endpoint-my-radiology-dicomweb-endpoint-example.html) |
| [MYRadiologyDiagnosticReport](StructureDefinition-my-radiology-diagnostic-report.html) | Radiology report publication. | Based-on order, report code, subject, issued time, performer, interpreter, imaging study links, result links, conclusion. | [Example](DiagnosticReport-my-radiology-diagnostic-report-example.html) |
| [MYRadiologyObservation](StructureDefinition-my-radiology-observation.html) | Structured findings or quantitative measurements. | Imaging category, finding code, subject, encounter, value, body site, derived-from study linkage. | [Example](Observation-my-radiology-observation-example.html) |
| [MYRadiologyDocumentReference](StructureDefinition-my-radiology-document-reference.html) | Packaged report document and sharing profile. | Document type, subject, date, author, attachment metadata, encounter context. | [Example](DocumentReference-my-radiology-document-reference-example.html) |
| [MYRadiologyProvenance](StructureDefinition-my-radiology-provenance.html) | Audit-grade provenance for authored, amended, and published radiology content. | Target resource linkage, recorded timestamp, responsible agent, activity, and reason. | [Example](Provenance-my-radiology-provenance-example.html) |

## Capability statements

| Capability statement | Intended actor | Main interactions |
| --- | --- | --- |
| [HIS Order Placer](CapabilityStatement-my-radiology-his-order-placer.html) | HIS or CPOE partner placing orders. | `create`, `read`, and `search-type` on `ServiceRequest`; `read` and `search-type` on `Task`; patient, status, and authored-date queries; scheduling visibility through `Appointment`. |
| [RIS Workflow Manager](CapabilityStatement-my-radiology-ris-workflow-manager.html) | RIS partner acting as the operational order filler. | Create, update, read, and search across order, workflow, scheduling, procedure, study, report, observation, and retrieval endpoint resources. |
| [PACS Metadata Publisher](CapabilityStatement-my-radiology-pacs-metadata-publisher.html) | PACS or VNA partner exposing metadata. | `read` and `search-type` on `ImagingStudy`; `read` on `Endpoint`; optional packaged-document support through `DocumentReference`. |
| [Viewer Consumer](CapabilityStatement-my-radiology-viewer-consumer.html) | Viewer or EHR partner consuming results. | `read` and `search-type` on `DiagnosticReport` and `ImagingStudy`, plus `read` on `Endpoint` for retrieval resolution. |
| [Validation Consumer](CapabilityStatement-my-radiology-validation-consumer.html) | Conformance testing and validation participants. | `read` and `search-type` across the core artefacts required for validation, including patient-centric search. |

## Terminology artefacts

| Artefact type | Published artefacts | Purpose |
| --- | --- | --- |
| Value sets | [Procedure](ValueSet-my-radiology-procedure-code-vs.html), [Clinical Indication](ValueSet-my-radiology-clinical-indication-vs.html), [Modality](ValueSet-my-radiology-modality-vs.html), [Report Code](ValueSet-my-radiology-report-code-vs.html), [Finding Code](ValueSet-my-radiology-finding-code-vs.html), [Workflow State](ValueSet-my-radiology-workflow-state-vs.html), [Task Status Reason](ValueSet-my-radiology-task-status-reason-vs.html), [Presented Form Content Type](ValueSet-my-radiology-presented-form-content-type-vs.html), [Accession Pattern](ValueSet-my-radiology-accession-pattern-vs.html), [Document Type](ValueSet-my-radiology-document-type-vs.html) | Bind resource elements to the preferred, extensible, or required coding envelope. |
| Code systems | [Workflow State](CodeSystem-my-radiology-workflow-state-cs.html), [Task Status Reason](CodeSystem-my-radiology-task-status-reason-cs.html), [Accession Pattern](CodeSystem-my-radiology-accession-pattern-cs.html), [RadLex Mirror Placeholder](CodeSystem-my-radlex-procedure-mirror.html) | Publish draft local coding scaffolds and explicit policy-option codes where no final national code system is yet approved. |
| Naming systems | [Patient](NamingSystem-MYPatientIdentifierNamingSystem.html), [Facility](NamingSystem-MYFacilityIdentifierNamingSystem.html), [Healthcare Worker](NamingSystem-MYHealthcareWorkerIdentifierNamingSystem.html), [Accession](NamingSystem-MYAccessionIdentifierNamingSystem.html), [Radiology Order](NamingSystem-MYRadiologyOrderIdentifierNamingSystem.html), [Radiology Task](NamingSystem-MYRadiologyTaskIdentifierNamingSystem.html), [Radiology Report](NamingSystem-MYRadiologyReportIdentifierNamingSystem.html) | Distinguish identifier system URI, usage note, and placeholder status from the operational value format. |
| Concept maps | [Procedure Code Mapping](ConceptMap-my-radiology-procedure-code-conceptmap.html) | Provides a starter computable crosswalk from the provisional local RadLex mirror to commonly used LOINC codes. |

## Examples and workflow payloads

| Artefact | Use |
| --- | --- |
| [Radiology Order Workflow Bundle](Bundle-my-radiology-order-workflow-bundle-example.html) | Shows the order-to-report journey as one machine-readable collection. |
| [Radiology Order Submission Transaction](Bundle-my-radiology-order-submission-transaction-example.html) | Shows a realistic transaction-based onboarding or sandbox submission pattern. |
| [Invalid ServiceRequest OperationOutcome](OperationOutcome-my-radiology-invalid-service-request-operationoutcome-example.html) | Shows the expected rejection shape when a partner submits an invalid order payload. |
| [Patient](Patient-my-patient-example.html), [Encounter](Encounter-my-encounter-example.html), [Organisation](Organization-my-organisation-example.html), [Location](Location-my-location-example.html), [Practitioner](Practitioner-my-practitioner-example.html), [PractitionerRole](PractitionerRole-my-practitioner-role-example.html) | Provide the shared supporting context for the radiology examples. |
| [Repository test assets](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests) | Provide positive, negative, scenario, and checklist-oriented validation material. |

## Concept maps

This guide now publishes a starter `ConceptMap` to demonstrate the expected computable mapping approach. It is intentionally narrow and should be treated as a drafting scaffold rather than a final nationally approved mapping set.

- The first published map aligns the provisional local RadLex mirror codes used in this repository with common LOINC radiology procedure or report codes.
- Additional mappings to SNOMED CT, DICOM terminology, and future local code systems remain `TO BE CONFIRMED`.
- Implementation partners should not infer that an unmapped concept is nationally approved merely because one starter map is present.

## Payload-reading note

Implementation partners should use the generated profile pages to inspect the actual JSON and XML shape. The profile differential shows cardinality, Must Support, and binding changes. The example pages show concrete header-level fields such as identifiers, status, category, retrieval endpoint references, terminology-coded elements, and attachment metadata.
