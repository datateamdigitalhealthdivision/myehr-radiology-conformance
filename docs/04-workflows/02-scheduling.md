# 02 Scheduling

## Purpose

Define how accepted imaging orders are booked, rescheduled, or cancelled when the deployment exposes scheduling through the national conformance layer.

## Actors

- RIS scheduling team
- HIS or CPOE consumer
- patient communication services where present

## Trigger

An accepted imaging order requires a booked date and time, or an existing booking is changed.

## Preconditions

- the order has been accepted
- the requested procedure is schedulable
- scheduling resources and locations are known

## Postconditions

- an `Appointment` is created or updated when FHIR scheduling is used
- `Task` status reflects the booking state
- downstream worklist preparation can occur

## Source of truth

The RIS is the source of truth for booked radiology slots and scheduling status.

## Sequence summary

1. RIS reviews the accepted order and available slots.
2. RIS books or proposes an appointment.
3. Appointment details are shared with the order placer or downstream consumer if required.
4. Rescheduling or cancellation events update the same booking context.

## FHIR artefacts involved

- `Appointment`
- `Task`
- `ServiceRequest`
- MY Core `Location` and `PractitionerRole` where applicable

## DICOM or DICOMweb transactions involved

None directly, but scheduling outputs populate later worklist and acquisition steps.

## IHE profile context

Fits the scheduling and scheduled procedure step preparation aspects of IHE Scheduled Workflow.

## Required data elements

- appointment identifier
- linked order reference
- scheduled start and end
- performing location
- modality or service area where relevant
- patient preparation instructions if known

## Status transitions

- `Appointment.status`: `proposed`, `booked`, `cancelled`, `fulfilled`, or `noshow`
- `Task.status`: `accepted`, `ready`, or `cancelled`

## Acknowledgements or response expectations

Scheduling updates should be visible to the order placer in near real time where integration contracts require it.

## Errors or edge cases

- slot no longer available
- patient preparation constraints not met
- appointment cancelled after worklist publication
- multiple appointments for a multi-part procedure

## Security and audit considerations

Scheduling visibility should be limited to authorised users and systems. All booking changes should be traceable by user, date, and reason.

## Test assertions

- a booked appointment links back to the accepted order
- rescheduling preserves identifier continuity
- cancelled appointments do not leave stale ready-to-perform work items

## Implementation notes

FHIR `Appointment` is recommended but not mandatory in every local deployment. If scheduling is managed entirely inside the RIS, vendors should still be able to expose equivalent workflow state.

## Open issues or local decisions pending

- national rule for when `Appointment` is mandatory remains `TO BE CONFIRMED`
- patient-facing notification behaviour is outside this first draft
