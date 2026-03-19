# Scenario 02: Order Acceptance And Scheduling

## Objective

Verify that an accepted order can move into a scheduled state with consistent identifier linkage.

## Preconditions

- a valid order exists
- RIS slot management is available

## Action

Update workflow state and create an `Appointment` where scheduling is exposed through FHIR.

## Expected result

- `Task.businessStatus` moves to `scheduled`
- the appointment references the originating order
- cancelled or rescheduled bookings remain traceable
