# Implementation Partner Guide

This page organises the published implementation guide artefacts by use case so that implementation partners can identify exactly which profiles, capability statements, examples, terminology artefacts, and workflow chapters apply to the API surface they are building.

## How to use this page

Use this page as the practical entry point for implementation planning.

1. Confirm which actor role or use case applies to your system.
2. Read the linked CapabilityStatement and core profiles.
3. Review the worked examples and workflow chapters.
4. Confirm the identifier, terminology, security, and testing obligations before build commencement.

For the full published artefact list, see the [Artefact Index](artifacts.html).

## National identifier requirements for all use cases

The identifier requirements below apply across all use cases in this guide. They are not limited to the RadioConnect direct-retrieval pattern.

### Patient identifiers

Every [MYRadiologyPatient](StructureDefinition-my-radiology-patient.html) instance and every patient-facing reference resolution should support the following identifier slices:

| Identifier | System URI | Current status | National expectation |
| --- | --- | --- | --- |
| National ID (MyKad, MyKAS, or passport) | `http://fhir.hie.moh.gov.my/sid/my-kad` | `PROVISIONAL` URI, available now | SHALL be implemented immediately for patient identity resolution. |
| Local Patient ID | Site-specific system URI | Available now | SHALL be implemented immediately for local registration and reconciliation. |
| MyHRN | `http://fhir.hie.moh.gov.my/sid/my-hrn` | `PROVISIONAL`, pending activation | SHALL be scaffolded now so that future activation does not require schema or code changes. |

Key references:

- [MYRadiologyPatient profile](StructureDefinition-my-radiology-patient.html)
- [Patient example](Patient-my-patient-example.html)
- [Patient Identifier Naming System](NamingSystem-MYPatientIdentifierNamingSystem.html)

### Practitioner identifiers

Every [MYRadiologyPractitioner](StructureDefinition-my-radiology-practitioner.html) instance and every practitioner-facing reference resolution should support the following identifier slices:

| Identifier | System URI | Current status | National expectation |
| --- | --- | --- | --- |
| National ID (MyKad) | `http://fhir.hie.moh.gov.my/sid/my-kad` | `PROVISIONAL` URI, available now | SHALL be implemented immediately for practitioner identity resolution. |
| Local Staff ID | Site-specific system URI | Available now | SHALL be implemented immediately for local workforce reconciliation. |
| MyHCW | `http://fhir.hie.moh.gov.my/sid/my-hcw` | `PROVISIONAL`, pending activation | SHALL be scaffolded now so that future activation does not require schema or code changes. |

Key references:

- [MYRadiologyPractitioner profile](StructureDefinition-my-radiology-practitioner.html)
- [Practitioner example](Practitioner-my-practitioner-example.html)
- [PractitionerRole example](PractitionerRole-my-practitioner-role-example.html)
- [Healthcare Worker Identifier Naming System](NamingSystem-MYHealthcareWorkerIdentifierNamingSystem.html)

### Facility identifiers

Every [MYRadiologyLocation](StructureDefinition-my-radiology-location.html) instance and every imaging [Organisation](Organization-my-organisation-example.html) representation should carry the national facility identifier.

| Identifier | System URI | Current status | National expectation |
| --- | --- | --- | --- |
| Facility ID | `http://fhir.hie.moh.gov.my/sid/my-facility` | `PROVISIONAL` URI, available now | SHALL be implemented immediately for location and organisation reconciliation. |

Key references:

- [MYRadiologyLocation profile](StructureDefinition-my-radiology-location.html)
- [Location example](Location-my-location-example.html)
- [Organisation example](Organization-my-organisation-example.html)
- [Facility Identifier Naming System](NamingSystem-MYFacilityIdentifierNamingSystem.html)

### Order and accession identifiers

Order and accession identifiers remain essential for workflow and study reconciliation.

| Identifier | Current guide position | Reference |
| --- | --- | --- |
| Order ID (placer) | SHALL be carried on `ServiceRequest.identifier:placerOrder` using the published radiology order namespace. | [Order Identifier Naming System](NamingSystem-MYRadiologyOrderIdentifierNamingSystem.html) |
| Accession number | SHALL remain consistent across `ServiceRequest` and `ImagingStudy`. The namespace remains `PROVISIONAL` and governed through the published accession policy artefacts. | [Accession Identifier Naming System](NamingSystem-MYAccessionIdentifierNamingSystem.html), [Accession Pattern ValueSet](ValueSet-my-radiology-accession-pattern-vs.html) |

## Use case 1: RadioConnect

### Architectural role

RadioConnect is a federated radiology interoperability architecture linking heterogeneous hospital PACS or RIS environments to a national exchange layer without forcing immediate full system replacement.

- The local RadioConnect node operates within the participating hospital network and acts as a combined RIS Workflow Manager and PACS Metadata Publisher at the FHIR layer.
- The central RadioConnect node acts as the national coordination and exchange layer for cross-site discovery, routing, referral exchange, and controlled access.
- Where document sharing is in scope, the central node may also act as an MHD Document Recipient.

### Capability statements and core roles

| RadioConnect role | Capability statement |
| --- | --- |
| Local node | [RIS Workflow Manager](CapabilityStatement-my-radiology-ris-workflow-manager.html), [PACS Metadata Publisher](CapabilityStatement-my-radiology-pacs-metadata-publisher.html) |
| Central node | [Viewer Consumer](CapabilityStatement-my-radiology-viewer-consumer.html), [MHD Document Recipient](CapabilityStatement-my-radiology-mhd-document-recipient.html) where document sharing is in scope |

### Core artefacts to implement

| Artefact | Why it matters | Key links |
| --- | --- | --- |
| Order and workflow publication | Required to expose radiology orders and workflow state. | [MYRadiologyServiceRequest](StructureDefinition-my-radiology-service-request.html), [MYRadiologyTask](StructureDefinition-my-radiology-task.html), [Order example](ServiceRequest-my-radiology-service-request-example.html), [Task example](Task-my-radiology-task-example.html) |
| Study and retrieval publication | Required to expose imaging metadata and DICOMweb retrieval endpoints. | [MYRadiologyImagingStudy](StructureDefinition-my-radiology-imaging-study.html), [MYRadiologyDicomWebEndpoint](StructureDefinition-my-radiology-dicomweb-endpoint.html), [ImagingStudy example](ImagingStudy-my-radiology-imaging-study-example.html), [Endpoint example](Endpoint-my-radiology-dicomweb-endpoint-example.html) |
| Report and finding publication | Required to expose radiology reports and any structured findings. | [MYRadiologyDiagnosticReport](StructureDefinition-my-radiology-diagnostic-report.html), [MYRadiologyObservation](StructureDefinition-my-radiology-observation.html), [DiagnosticReport example](DiagnosticReport-my-radiology-diagnostic-report-example.html), [Observation example](Observation-my-radiology-observation-example.html) |
| Performed act linkage | Required where order, performance, and report traceability are published. | [MYRadiologyProcedure](StructureDefinition-my-radiology-procedure.html), [Procedure example](Procedure-my-radiology-procedure-example.html) |

### Optional direct retrieval pattern

The preserved RadioConnect operation remains optional. Standard resource read and search interactions remain the national baseline.

| Artefact | Link |
| --- | --- |
| Operation definition | [IMPACS RIS Sync Operation](OperationDefinition-impacs-ris-sync.html) |
| Response example | [RadioConnect Sync Bundle Example](Bundle-my-radiology-radioconnect-sync-bundle-example.html) |
| Error example | [Accession Mismatch OperationOutcome](OperationOutcome-my-radiology-radioconnect-accession-mismatch-oo-example.html) |
| Architecture and polling guidance | [Notifications And Polling](notifications.html) |
| Informative operational targets | [Implementation Considerations](implementation-considerations.html) |

### Related workflow and guidance pages

- [Workflow 01 Ordering](workflow-01-ordering.html)
- [Workflow 04 Acquisition And MPPS](workflow-04-acquisition-and-mpps.html)
- [Workflow 05 Storage And Commitment](workflow-05-storage-and-commitment.html)
- [Workflow 06 Reporting](workflow-06-reporting.html)
- [Workflow 07 Viewing And Retrieval](workflow-07-viewing-and-retrieval.html)
- [Workflow 08 Cross-Enterprise Sharing](workflow-08-cross-enterprise-sharing.html)
- [Workflow 09 External Priors](workflow-09-external-priors.html)
- [Workflow 10 Corrections And IOCM](workflow-10-corrections-iocm.html)
- [Terminology And Identifiers](terminology.html)
- [Security And Audit](security.html)
- [Conformance Testing](testing.html)

## Use case 2: EMR to PACS or RIS

### Core actor mapping

| Partner system role | Capability statement |
| --- | --- |
| EMR or HIS placing orders | [HIS Order Placer](CapabilityStatement-my-radiology-his-order-placer.html) |
| EMR or viewer consuming results | [Viewer Consumer](CapabilityStatement-my-radiology-viewer-consumer.html) |
| PACS or archive exposing metadata | [PACS Metadata Publisher](CapabilityStatement-my-radiology-pacs-metadata-publisher.html) |

### What implementation partners need to build

| Function | Artefacts |
| --- | --- |
| Order submission | [MYRadiologyServiceRequest](StructureDefinition-my-radiology-service-request.html), [Order Submission Transaction Example](Bundle-my-radiology-order-submission-transaction-example.html) |
| Workflow tracking | [MYRadiologyTask](StructureDefinition-my-radiology-task.html), [MYRadiologyAppointment](StructureDefinition-my-radiology-appointment.html) |
| Report viewing | [MYRadiologyDiagnosticReport](StructureDefinition-my-radiology-diagnostic-report.html), [MYRadiologyObservation](StructureDefinition-my-radiology-observation.html) |
| Study discovery and image launch | [MYRadiologyImagingStudy](StructureDefinition-my-radiology-imaging-study.html), [MYRadiologyDicomWebEndpoint](StructureDefinition-my-radiology-dicomweb-endpoint.html) |
| Error handling | [Invalid ServiceRequest OperationOutcome](OperationOutcome-my-radiology-invalid-service-request-operationoutcome-example.html) |

### Related workflow chapters

- [Workflow 01 Ordering](workflow-01-ordering.html)
- [Workflow 02 Scheduling](workflow-02-scheduling.html)
- [Workflow 03 Modality Worklist](workflow-03-modality-worklist.html)
- [Workflow 06 Reporting](workflow-06-reporting.html)
- [Workflow 07 Viewing And Retrieval](workflow-07-viewing-and-retrieval.html)
- [Workflow 11 Encounter-Based Imaging](workflow-11-encounter-based-imaging.html)

## Use case 3: EMR to MyEHR

### Core actor mapping

| Partner system role | Capability statement |
| --- | --- |
| Hospital system publishing reports to MyEHR | [MHD Document Source](CapabilityStatement-my-radiology-mhd-document-source.html) |
| MyEHR receiving and indexing documents | [MHD Document Recipient](CapabilityStatement-my-radiology-mhd-document-recipient.html) |
| Clinician consuming shared results | [Viewer Consumer](CapabilityStatement-my-radiology-viewer-consumer.html) |

### Core artefacts to implement

| Function | Artefacts |
| --- | --- |
| Report packaging | [MYRadiologyDocumentReference](StructureDefinition-my-radiology-document-reference.html), [DocumentReference example](DocumentReference-my-radiology-mhd-document-reference-example.html) |
| Submission set assembly | [MYRadiologyMHDSubmissionSet](StructureDefinition-my-radiology-mhd-submission-set.html), [SubmissionSet example](List-my-radiology-mhd-submission-set-example.html) |
| ITI-65 transaction submission | [MHD Provide Document Bundle Example](Bundle-my-radiology-mhd-provide-document-bundle-example.html) |
| Audit and provenance | [MYRadiologyMHDAuditEvent](StructureDefinition-my-radiology-mhd-audit-event.html), [MYRadiologyProvenance](StructureDefinition-my-radiology-provenance.html), [AuditEvent example](AuditEvent-my-radiology-mhd-audit-event-example.html), [Provenance example](Provenance-my-radiology-provenance-example.html) |
| Shared-document metadata coding | [Document Sharing](document-sharing.html), [Terminology And Identifiers](terminology.html) |

### Critical identity requirement

Documents submitted into the MyEHR sharing environment should reference the patient using the national patient identity pattern published by this guide, and should be ready to carry MyHRN as soon as the national MPI is operational. Submissions should be rejected where patient identity cannot be resolved.

### Related workflow and guidance pages

- [Workflow 06 Reporting](workflow-06-reporting.html)
- [Workflow 08 Cross-Enterprise Sharing](workflow-08-cross-enterprise-sharing.html)
- [Document Sharing](document-sharing.html)
- [Security And Audit](security.html)
- [Conformance Testing](testing.html)

## Cross-reference directory

| Need | Go to |
| --- | --- |
| Full artefact list | [Artefact Index](artifacts.html) |
| Actor obligations | [Conformance Model](conformance-model.html) |
| Full workflow set | [Workflow Summary](workflow-summary.html) |
| Terminology and identifiers | [Terminology And Identifiers](terminology.html) |
| Security and SMART assumptions | [Security And Audit](security.html) |
| Testing and validation | [Conformance Testing](testing.html) |
| Package and publication downloads | [Downloads](downloads.html) |
| National overview and publication context | [National Overview](overview.html) |
