# Technical Annexes

The wider radiology conformance stack cannot be reduced to FHIR alone. The technical annexes in the repository describe how DICOM, DICOMweb, IHE, MHD, XDS-I, optional direct-RIS retrieval patterns, and transition material fit with the computable FHIR layer.

## Annex index

| Annex | Purpose | Repository source |
| --- | --- | --- |
| DICOM | States national expectations for Modality Worklist, MPPS, storage, and identifier alignment. | [annexes/dicom/README.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/annexes/dicom/README.md) |
| DICOMweb | States expectations for QIDO-RS, WADO-RS, STOW-RS, and path conventions. | [annexes/dicomweb/README.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/annexes/dicomweb/README.md) |
| IHE | Explains Scheduled Workflow, MHD, and the relationship between operational choreography and FHIR. | [annexes/ihe/README.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/annexes/ihe/README.md) |
| XDS-I | Provides cross-enterprise imaging document and manifest guidance. | [annexes/xds-i/README.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/annexes/xds-i/README.md) |
| HL7 v2 Transition | Describes transition guidance for environments that still depend on HL7 v2 interfaces. | [annexes/hl7v2-transition/README.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/annexes/hl7v2-transition/README.md) |

## Source-preservation annexes

- [MHD to XDS Bridge Pattern](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/annexes/xds-i/mhd-xds-bridge-pattern.md)
- [RadioConnect Direct-RIS Pattern](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/annexes/ihe/radioconnect-direct-ris-pattern.md)

## Reading order

- start with [Workflow Summary](workflow-summary.html) to identify the relevant operational stage
- use [FHIR Artefacts](fhir-artefacts.html) for the computable payload shape
- use [Document Sharing](document-sharing.html) for MHD and XDS-aligned document exchange
- use the relevant annex for imaging-layer, choreography, source-preservation, and deployment detail

## Important reminder

Support for the FHIR IG alone does not satisfy the wider operational conformance position where DICOM, DICOMweb, IHE, MHD, or cross-enterprise requirements also apply.
