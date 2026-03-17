# 04 Acquisition And Status

## Purpose

Define how imaging performance begins, progresses, and completes, including state synchronisation back to operational systems and the FHIR-facing layer.

## Actors

- modality
- RIS
- PACS or VNA

## Trigger

The modality operator begins the examination for a selected work item.

## Preconditions

- the correct work item has been selected
- the patient is verified
- the operator is authenticated

## Postconditions

- acquisition state is visible operationally
- performed procedure details are recorded
- downstream storage and reporting can proceed

## Source of truth

The modality and RIS jointly provide operational truth for in-progress and completion status, with RIS acting as the workflow coordination authority.

## Sequence summary

1. Modality starts the examination.
2. Modality or RIS records in-progress state.
3. Imaging completes, is aborted, or is partially completed.
4. Performed status is reflected to FHIR through `Task` and `Procedure` as applicable.

## FHIR artefacts involved

- `Task`
- `Procedure`
- `ServiceRequest`
- future or optional `ImagingStudy` pre-publication metadata

## DICOM or DICOMweb transactions involved

- DICOM Modality Performed Procedure Step
- image storage may begin during or immediately after acquisition

## IHE profile context

Fits the acquisition and performed procedure step responsibilities of IHE Scheduled Workflow.

## Required data elements

- start and end times
- device identity
- operator identity where available
- performed procedure details
- cancellation or discontinuation reason if not completed

## Status transitions

- `Task.status`: `in-progress`, `completed`, `failed`, or `cancelled`
- `Procedure.status`: `in-progress`, `completed`, `stopped`, or `not-done`

## Acknowledgements or response expectations

The RIS should receive performed status in time to prevent duplicate work assignment and to support reporting readiness.

## Errors or edge cases

- patient mismatch discovered after acquisition start
- exam aborted after partial image capture
- multiple performed steps for one order
- device offline during status communication

## Security and audit considerations

Operator accountability, device trust, and timing of performed status messages should be auditable. Implementers should preserve evidence of aborted or corrected acquisitions.

## Test assertions

- in-progress status is visible after acquisition starts
- completed imaging leads to a completed or equivalent performed procedure state
- cancelled examinations are not reported as complete

## Implementation notes

Map operational detail carefully. DICOM performed procedure granularity may not line up perfectly with the FHIR state model.

## Open issues or local decisions pending

- the exact national mapping between MPPS outcomes and `Task` values remains `TO BE CONFIRMED`
- handling of partially completed acquisitions requires further national policy work

