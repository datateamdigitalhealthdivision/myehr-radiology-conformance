# Workflow Summary

The detailed workflow chapters remain part of the repository narrative documentation. They describe the end-to-end operational choreography across FHIR, DICOM, DICOMweb, and IHE layers.

## Workflow chapter index

| Workflow | Primary purpose | Core FHIR artefacts | Imaging / IHE context | Repository source |
| --- | --- | --- | --- | --- |
| 01 Ordering | Creation and acknowledgement of the imaging order from HIS or CPOE to RIS. | `ServiceRequest`, `Task` | IHE Scheduled Workflow order placement context | [01-ordering.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/01-ordering.md) |
| 02 Scheduling | Booking or rescheduling of the requested examination. | `Appointment`, `Task`, `ServiceRequest` | IHE Scheduled Workflow scheduling context | [02-scheduling.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/02-scheduling.md) |
| 03 Modality Worklist | Distribution of worklist-ready items to acquisition systems. | `Task`, `ServiceRequest` | DICOM Modality Worklist | [03-modality-worklist.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/03-modality-worklist.md) |
| 04 Acquisition And MPPS | Recording performance state and acquisition progress. | `Task`, `Procedure`, `ImagingStudy` | DICOM MPPS and acquisition workflow | [04-acquisition-and-mpps.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/04-acquisition-and-mpps.md) |
| 05 Storage And Commitment | Storage of imaging objects and confirmation of archive acceptance. | `ImagingStudy` | DICOM Storage and Storage Commitment | [05-storage-and-commitment.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/05-storage-and-commitment.md) |
| 06 Reporting | Authoring, verification, and publication of radiology reports. | `DiagnosticReport`, `Observation`, `Procedure`, `ImagingStudy` | IHE reporting workflow context | [06-reporting.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/06-reporting.md) |
| 07 Viewing And Retrieval | Retrieval of report content and study metadata for care delivery. | `DiagnosticReport`, `ImagingStudy`, `DocumentReference` | DICOMweb QIDO-RS and WADO-RS | [07-viewing-and-retrieval.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/07-viewing-and-retrieval.md) |
| 08 Cross-Enterprise Sharing | Exchange across facilities or enterprise boundaries. | `DocumentReference`, `DiagnosticReport`, `ImagingStudy` | XDS-I.b and future XCA-I context | [08-cross-enterprise-sharing.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/08-cross-enterprise-sharing.md) |
| 09 External Priors | Import and reconciliation of prior studies from external sources. | `ImagingStudy`, `DocumentReference`, `Task` | Prior import and archive governance | [09-external-priors.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/09-external-priors.md) |
| 10 Corrections And IOCM | Correction, reconciliation, replacement, and amendment handling. | `Task`, `Procedure`, `ImagingStudy`, `DiagnosticReport`, `DocumentReference` | IOCM-aligned correction handling | [10-corrections-iocm.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/10-corrections-iocm.md) |
| 11 Encounter-Based Imaging | Unscheduled or encounter-driven imaging activity. | `ServiceRequest`, `Task`, `Procedure`, `ImagingStudy` | Encounter-based imaging patterns | [11-encounter-based-imaging.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/11-encounter-based-imaging.md) |

## Implementation note

Partners should read the workflow chapter relevant to their role together with the applicable CapabilityStatement and profile pages. The workflow chapter gives the operational expectation; the FHIR artefact pages give the computable payload shape.
