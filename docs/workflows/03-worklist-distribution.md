# 03 Worklist Distribution

## Purpose

Define how accepted or scheduled work is made available to modalities so that imaging can begin with consistent patient, procedure, and accession context.

## Actors

- RIS
- modality or acquisition workstation
- modality operator

## Trigger

An order is ready for performance, whether from a booked slot or an unscheduled but authorised workflow.

## Preconditions

- order acceptance is complete
- required patient and procedure data are available
- modality endpoint trust and configuration are established

## Postconditions

- the work item is available through DICOM Modality Worklist or equivalent operational workflow
- the modality can safely select the correct patient and requested procedure
- FHIR `Task` state can reflect readiness

## Source of truth

The RIS remains the source of truth for operational worklist content.

## Sequence summary

1. RIS prepares a work item from order and scheduling data.
2. Modality queries the worklist service.
3. Operator selects the correct patient and procedure item.
4. The workflow moves to in-progress when acquisition begins.

## FHIR artefacts involved

- `ServiceRequest`
- `Task`
- optional `Appointment`

## DICOM or DICOMweb transactions involved

- DICOM Modality Worklist query and response

## IHE profile context

Core IHE Scheduled Workflow behaviour for preparing and presenting work items to modalities.

## Required data elements

- accession identifier
- requested procedure code
- patient identity
- encounter or visit context where relevant
- location
- laterality or body site if applicable
- precautions or supporting information if required operationally

## Status transitions

- `Task.status`: `ready`, `in-progress`, or `cancelled`

## Acknowledgements or response expectations

Worklist publication should occur soon enough to support operational flow and must avoid presenting cancelled or superseded work items.

## Errors or edge cases

- duplicate worklist entries
- stale worklist after rescheduling
- patient mismatch discovered at modality
- modality unable to resolve the accession identifier

## Security and audit considerations

Device authentication and network trust are mandatory. Worklist access must be limited to authorised modalities and support audit correlation where feasible.

## Test assertions

- ready orders appear on the worklist with the expected identifiers
- cancelled orders no longer appear as available work
- laterality and requested procedure values remain consistent with the order

## Implementation notes

FHIR is not a substitute for Modality Worklist. It provides surrounding interoperability and testability for the workflow.

## Open issues or local decisions pending

- minimum timing expectation for worklist refresh is `TO BE CONFIRMED`
- national conventions for modality-side caching are `TO BE CONFIRMED`

