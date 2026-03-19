# DICOMweb Annex

## Role of DICOMweb

DICOMweb provides RESTful imaging query, storage, and retrieval capabilities that complement the FHIR-facing radiology layer. It is especially relevant for archives, enterprise viewers, and web-based consumers.

## National path convention

Use a configurable base URL and do not hard-code a final production hostname.

- Placeholder base: `https://sandbox-imaging.myehr.kkmhub.moh.gov.my/dicomweb`
- Status: `PROVISIONAL`

The national path conventions should follow standard DICOMweb patterns:

- `{dicomweb-base}/studies`
- `{dicomweb-base}/studies/{StudyInstanceUID}`
- `{dicomweb-base}/studies/{StudyInstanceUID}/series`
- `{dicomweb-base}/studies/{StudyInstanceUID}/series/{SeriesInstanceUID}/instances`
- `{dicomweb-base}/studies/{StudyInstanceUID}/series/{SeriesInstanceUID}/instances/{SOPInstanceUID}`

## Expected transactions

- `QIDO-RS` for query
- `WADO-RS` for retrieval
- `STOW-RS` for storage where applicable

## FHIR relationship

- `ImagingStudy` provides the FHIR-facing index and metadata layer
- `DiagnosticReport` provides the report layer
- DICOMweb provides the image retrieval and, where relevant, image storage operations

## Security notes

Authorisation patterns for DICOMweb are `PROVISIONAL`. Implementers should assume bearer-token or equivalent gateway-based controls may apply, but detailed production policy remains to be confirmed.

## Implementation guidance

- preserve `StudyInstanceUID`, series, and instance identifiers exactly
- support content negotiation where rendered retrieval is used
- return safe and clear errors for missing studies or denied access
