# 11 Encounter-Based Imaging

## Purpose

Define how urgent, walk-in, ward-based, or otherwise unscheduled imaging is represented without breaking conformance.

## Actors

- emergency department or ward system
- RIS
- modality
- reporting system

## Trigger

Imaging is required immediately or outside the standard scheduled booking pathway.

## Preconditions

- patient identity is available or can be established safely
- an encounter exists or can be created
- local policy permits unscheduled imaging

## Postconditions

- imaging proceeds safely
- the study and report remain linked to an order intent, even if created retrospectively
- status and identifiers remain consistent for later retrieval

## Source of truth

The RIS remains the workflow authority once the work is registered, even if the initial trigger came directly from emergency or ward operations.

## Sequence summary

1. Clinical staff initiate urgent imaging.
2. RIS creates or receives the order context as early as possible.
3. Modality performs the examination through an unscheduled workflow.
4. Resulting `Procedure`, `ImagingStudy`, and `DiagnosticReport` remain linked to the encounter and order context.

## FHIR artefacts involved

- `ServiceRequest`
- `Task`
- `Encounter`
- `Procedure`
- `ImagingStudy`
- `DiagnosticReport`

## DICOM or DICOMweb transactions involved

- Modality Worklist where available
- MPPS
- image storage and retrieval transactions

## IHE profile context

Relates to encounter-based imaging and exceptions around normal scheduled workflow while preserving the same operational controls.

## Required data elements

- encounter reference
- urgency or priority
- requested procedure
- patient identity
- authorising requester or responsible clinician
- accession identifier strategy

## Status transitions

These workflows may enter directly into accepted, ready, or in-progress states without a long booking phase, but they must still reach a consistent completed or cancelled end state.

## Acknowledgements or response expectations

Emergency workflows should not require excessive synchronous validation, but they must still provide enough acknowledgement for safe traceability.

## Errors or edge cases

- patient unidentified at time of imaging
- temporary identifiers later reconciled
- urgent exam performed before formal order completion
- multiple urgent studies within one encounter

## Security and audit considerations

Urgency does not remove audit obligations. Temporary identifiers and retrospective corrections should be especially well tracked.

## Test assertions

- urgent imaging can be represented without a booked appointment
- temporary identity use is later reconciled safely
- final report remains linked to the encounter and resulting study

## Implementation notes

This chapter exists to support real emergency behaviour while still keeping downstream metadata consistent.

## Open issues or local decisions pending

- national policy for temporary identifiers in urgent imaging is `TO BE CONFIRMED`
- minimum data set before image acquisition is `TO BE CONFIRMED`

