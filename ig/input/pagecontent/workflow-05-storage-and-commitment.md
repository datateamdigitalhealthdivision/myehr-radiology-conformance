# 05 Storage And Commitment

## Purpose

Define how acquired imaging objects are stored, acknowledged, and made durably available for later reporting and retrieval.

## Actors

- modality
- PACS or VNA
- RIS

## Trigger

Imaging objects are produced and need to be stored in an archive or enterprise imaging platform.

## Preconditions

- study and series identifiers have been created
- storage routes are configured
- archive trust is established

## Postconditions

- image objects are stored successfully or failure is surfaced
- storage commitment can be confirmed where implemented
- FHIR-facing study metadata can be published once archive state is stable

## Source of truth

The archive is the source of truth for stored image availability. The RIS remains the source of truth for workflow progression.

## Sequence summary

1. Modality sends image objects to the archive.
2. Archive acknowledges receipt.
3. Storage commitment is requested and returned where implemented.
4. Study metadata is exposed for FHIR and viewer use when the archive state is dependable.

## FHIR artefacts involved

- `ImagingStudy`
- `Task`
- `Procedure`

## DICOM or DICOMweb transactions involved

- DICOM image storage
- DICOM storage commitment
- optional DICOMweb `STOW-RS`

## IHE profile context

Supports the storage and availability assumptions used in IHE Scheduled Workflow and later sharing patterns.

## Required data elements

- `StudyInstanceUID`
- series and instance identifiers
- archive receipt status
- storage commitment outcome where used
- linked order or accession context

## Status transitions

- `Task.status`: remains `in-progress` until durable storage is confirmed, then may move to `completed`
- `ImagingStudy.status`: published when the study is available for consumption

## Acknowledgements or response expectations

Implementations should distinguish between receipt of objects and durable storage confirmation. Where commitment is implemented, a success acknowledgement is expected.

## Errors or edge cases

- partial series storage failure
- archive outage after acquisition
- image receipt without later commitment success
- duplicated storage attempts

## Security and audit considerations

Storage channels must be trusted and auditable. Archives should retain evidence of receipt, commitment, and failure handling.

## Test assertions

- stored studies can be linked back to the originating order
- storage commitment failure is visible to operational systems
- `ImagingStudy` is not published before essential identifiers are stable

## Implementation notes

The national conformance layer does not dictate one archive product model. It requires consistent identifier linkage and clear acknowledgement semantics.

## Open issues or local decisions pending

- whether storage commitment is phase-1 mandatory remains `TO BE CONFIRMED`
- the trigger point for publishing `ImagingStudy` metadata remains `TO BE CONFIRMED`

## Related Pages

- [Workflow Summary](workflow-summary.html)
- [FHIR Artefacts](fhir-artefacts.html)
- [Technical Annexes](annexes.html)
- Maintained source markdown: [docs/04-workflows/05-storage-and-commitment.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/05-storage-and-commitment.md)

