# 01 Order Placement

## Purpose

Define how an imaging order is placed from HIS or CPOE into RIS with enough structure for downstream scheduling, worklist generation, imaging performance, and reporting.

## Actors

- HIS or CPOE as Order Placer
- RIS as Order Filler and workflow manager
- optional EHR consumer for order visibility

## Trigger

A clinician requests a radiology examination for a patient encounter or episode of care.

## Preconditions

- patient identity is known or can be resolved
- requester identity is present
- a requested procedure code is available
- encounter context is present when relevant

## Postconditions

- a conformant `ServiceRequest` is persisted or accepted
- an operational acknowledgement is returned
- a `Task` is created or updated to show order receipt and acceptance status

## Source of truth

The submitting system is the source of truth for the original order request. The RIS becomes the source of truth for fulfilment status after receipt.

## Sequence summary

1. HIS submits a radiology `ServiceRequest`.
2. RIS validates patient, requester, and requested procedure details.
3. RIS accepts, rejects, or asks for correction.
4. RIS publishes a `Task` state that can be consumed by the order placer.

## FHIR artefacts involved

- `ServiceRequest`
- `Task`
- MY Core `Patient`, `Encounter`, `PractitionerRole`, and `Organisation`

## DICOM or DICOMweb transactions involved

None directly at order submission time. This chapter prepares information later used by DICOM Modality Worklist.

## IHE profile context

Aligns to IHE Scheduled Workflow order placer and order filler responsibilities.

## Required data elements

- business order identifier
- provisional accession strategy element
- patient reference
- encounter reference where relevant
- requested procedure code
- clinical indication or reason
- priority
- body site and laterality when clinically relevant
- requester details

## Status transitions

- `ServiceRequest.status`: `draft` or `active` according to local workflow
- `Task.status`: `requested`, `accepted`, `rejected`, or `cancelled`

## Acknowledgements or response expectations

The receiving RIS should return a clear success or failure response and should expose workflow acknowledgement through `Task` where FHIR state synchronisation is implemented.

## Errors or edge cases

- duplicate orders
- missing patient linkage
- invalid or unmapped requested procedure code
- unsupported priority value
- order placed without encounter in a workflow that requires it

## Security and audit considerations

Order submission must be authenticated, authorised, and auditable. Clinical indication and patient identity data should be protected in transit and at rest.

## Test assertions

- a valid order is accepted and yields an acknowledgement
- an invalid order is rejected with actionable error detail
- requester, patient, and encounter references are preserved consistently

## Implementation notes

Keep the order payload practical. Do not require radiology-specific extensions unless base or MY Core elements are insufficient.

## Open issues or local decisions pending

- exact accession assignment point is `TO BE CONFIRMED`
- national business rule for mandatory encounter linkage is `TO BE CONFIRMED`

