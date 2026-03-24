# 08 Notification Patterns

## Purpose

This chapter documents how implementation partners should detect workflow changes in the absence of a nationally mandated real-time notification mechanism.

## Current national position

This first draft accepts polling as the baseline operational approach for workflow visibility.

- HIS and EHR consumers may poll `ServiceRequest`, `Task`, `DiagnosticReport`, and `ImagingStudy` using the search parameters declared in the actor CapabilityStatements.
- Polling intervals should match clinical urgency and service operating practice.
- Polling should not be treated as a permanent architectural ceiling; it is a pragmatic phase 1 starting point.

## Minimum searchable state

Systems should support sufficient search behaviour to allow downstream actors to detect:

- newly placed or amended radiology orders
- accepted, rejected, scheduled, in-progress, completed, and amended workflow tasks
- newly available imaging studies
- newly issued or amended radiology reports

## Future direction

`TO BE CONFIRMED`: a later phase may define a preferred national event-driven notification pattern. Candidate options include FHIR `Subscription`, partner-managed event delivery, or a central notification broker.

Until that position is finalised, any partner that implements event-driven notification should ensure the mechanism is authenticated, authorised, auditable, and limited to signalling rather than carrying unnecessary clinical detail.
