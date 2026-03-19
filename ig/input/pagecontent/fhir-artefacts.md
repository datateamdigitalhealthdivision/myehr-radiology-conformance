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
| [MYRadiologyImagingStudy](StructureDefinition-my-radiology-imaging-study.html) | FHIR-facing study metadata aligned to DICOM. | `StudyInstanceUID`, accession linkage, subject, procedure linkage, modality, started time, series detail. | [Example](ImagingStudy-my-radiology-imaging-study-example.html) |
| [MYRadiologyDiagnosticReport](StructureDefinition-my-radiology-diagnostic-report.html) | Radiology report publication. | Based-on order, report code, subject, issued time, performer, interpreter, imaging study links, result links, conclusion. | [Example](DiagnosticReport-my-radiology-diagnostic-report-example.html) |
| [MYRadiologyObservation](StructureDefinition-my-radiology-observation.html) | Structured findings or quantitative measurements. | Imaging category, finding code, subject, encounter, value, body site, derived-from study linkage. | [Example](Observation-my-radiology-observation-example.html) |
| [MYRadiologyDocumentReference](StructureDefinition-my-radiology-document-reference.html) | Packaged report document and sharing profile. | Document type, subject, date, author, attachment metadata, encounter context. | [Example](DocumentReference-my-radiology-document-reference-example.html) |

## Capability statements

| Capability statement | Intended actor | Main interactions |
| --- | --- | --- |
| [HIS Order Placer](CapabilityStatement-my-radiology-his-order-placer.html) | HIS or CPOE partner placing orders. | `create`, `read`, and `search-type` on `ServiceRequest`; `read` and `search-type` on `Task`; scheduling visibility through `Appointment`. |
| [RIS Workflow Manager](CapabilityStatement-my-radiology-ris-workflow-manager.html) | RIS partner acting as the operational order filler. | Create, update, read, and search across order, workflow, scheduling, procedure, study, report, and observation resources. |
| [PACS Metadata Publisher](CapabilityStatement-my-radiology-pacs-metadata-publisher.html) | PACS or VNA partner exposing metadata. | `read` and `search-type` on `ImagingStudy` and `DocumentReference`. |
| [Viewer Consumer](CapabilityStatement-my-radiology-viewer-consumer.html) | Viewer or EHR partner consuming results. | `read` and `search-type` on `DiagnosticReport`, `ImagingStudy`, and `DocumentReference`. |
| [Validation Consumer](CapabilityStatement-my-radiology-validation-consumer.html) | Conformance testing and validation participants. | `read` and `search-type` across the core artefacts required for validation. |

## Terminology artefacts

| Artefact type | Published artefacts | Purpose |
| --- | --- | --- |
| Value sets | [Procedure](ValueSet-my-radiology-procedure-code-vs.html), [Modality](ValueSet-my-radiology-modality-vs.html), [Report Code](ValueSet-my-radiology-report-code-vs.html), [Finding Code](ValueSet-my-radiology-finding-code-vs.html), [Workflow State](ValueSet-my-radiology-workflow-state-vs.html), [Accession Pattern](ValueSet-my-radiology-accession-pattern-vs.html), [Document Type](ValueSet-my-radiology-document-type-vs.html) | Bind resource elements to the preferred or required coding envelope. |
| Code systems | [Workflow State](CodeSystem-my-radiology-workflow-state-cs.html), [Accession Pattern](CodeSystem-my-radiology-accession-pattern-cs.html), [RadLex Mirror Placeholder](CodeSystem-my-radlex-procedure-mirror.html) | Publish draft local coding scaffolds and explicit policy-option codes where no final national code system is yet approved. |
| Naming systems | [Patient](NamingSystem-MYPatientIdentifierNamingSystem.html), [Facility](NamingSystem-MYFacilityIdentifierNamingSystem.html), [Healthcare Worker](NamingSystem-MYHealthcareWorkerIdentifierNamingSystem.html), [Accession](NamingSystem-MYAccessionIdentifierNamingSystem.html), [Radiology Order](NamingSystem-MYRadiologyOrderIdentifierNamingSystem.html) | Distinguish identifier system URI, usage note, and placeholder status from the operational value format. |

## Examples and workflow payloads

| Artefact | Use |
| --- | --- |
| [Radiology Order Workflow Bundle](Bundle-my-radiology-order-workflow-bundle-example.html) | Shows the order-to-report journey as one machine-readable collection. |
| [Patient](Patient-my-patient-example.html), [Encounter](Encounter-my-encounter-example.html), [Organisation](Organization-my-organisation-example.html), [Location](Location-my-location-example.html), [Practitioner](Practitioner-my-practitioner-example.html), [PractitionerRole](PractitionerRole-my-practitioner-role-example.html) | Provide the shared supporting context for the radiology examples. |
| [Repository test assets](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests) | Provide positive, negative, scenario, and checklist-oriented validation material. |

## Concept maps

No national `ConceptMap` artefacts are asserted in this first draft. Crosswalks between RadLex, SNOMED CT, LOINC, DICOM terminology, and future local code systems remain `TO BE CONFIRMED` and should be published only once governance approves the mapping basis.
