# 07 Procurement Language

This chapter provides draft wording that procuring agencies may adapt. It is not legal advice and is marked `EXAMPLE ONLY`.

## Example core requirement wording

The supplier shall support the Malaysian national radiology interoperability and conformance repository as published for the applicable release, including:

- the FHIR R4 radiology implementation guide package
- the relevant actor CapabilityStatements
- the workflow and annex chapters covering DICOM, DICOMweb, IHE, security, and testing

## Example FHIR wording

The supplier shall support the creation, update, search, and read interactions required by the CapabilityStatement applicable to its actor role, including support for the mandated profiles on `ServiceRequest`, `Task`, `Procedure`, `ImagingStudy`, and `DiagnosticReport` where relevant.

## Example imaging wording

Where the supplied product includes modality, PACS, VNA, or viewer capability, the supplier shall support the DICOM or DICOMweb transactions identified as mandatory for the relevant workflow chapter, including conformance to national path conventions and identifier linkage rules.

## Example assurance wording

The supplier shall provide evidence of conformance through:

- payload validation results
- scenario-based test results
- declared CapabilityStatements
- implementation notes for any conditional or future functions not yet supported

## Example provisional wording

Where national identifiers, endpoint roots, or authorisation metadata remain provisional at the time of procurement, the supplier shall implement a configurable design that can adopt the final national values without material redesign.
