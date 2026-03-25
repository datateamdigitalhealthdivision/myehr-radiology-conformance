# 08 Notification Patterns

## Purpose

This chapter documents how implementation partners should detect workflow changes in the absence of a nationally mandated real-time notification mechanism.

## Current national position

This first draft accepts polling as the baseline operational approach for workflow visibility.

- HIS and EHR consumers may poll `ServiceRequest`, `Task`, `DiagnosticReport`, `ImagingStudy`, `DocumentReference`, and `List` using the search parameters declared in the actor CapabilityStatements.
- Polling intervals should match clinical urgency and service operating practice.
- Polling should not be treated as a permanent architectural ceiling; it is a pragmatic phase 1 starting point.

## Minimum searchable state

Systems should support sufficient search behaviour to allow downstream actors to detect:

- newly placed or amended radiology orders
- accepted, rejected, scheduled, in-progress, completed, and amended workflow tasks
- newly available imaging studies
- newly issued or amended radiology reports
- newly submitted or replaced packaged documents where document sharing is in scope

## Optional direct-RIS retrieval pattern

The preserved RadioConnect pattern remains available as an optional partner-facing approach for scheduled synchronisation. It does not replace the national baseline of standard FHIR search and read interactions.

Example request pattern:

```http
GET [base]/$impacs-ris-sync?from=2026-03-22T00:00:00Z&to=2026-03-22T02:00:00Z&_count=50&_page=1&patientId=RIS-12345
Authorization: Bearer [token]
Accept: application/fhir+json
Prefer: respond-async
```

Operational expectations:

- the polling interval is configurable rather than fixed
- the RIS may query PACS or archive services for additional image metadata
- the response bundle should include the patient, study, report, order, practitioner, and location context needed for reconciliation
- the consumer is expected to validate profile conformance, accession linkage, and PDF report availability

## Future direction

`TO BE CONFIRMED`: a later phase may define a preferred national event-driven notification pattern. Candidate options include FHIR `Subscription`, partner-managed event delivery, or a central notification broker.

Until that position is finalised, any partner that implements event-driven notification should ensure the mechanism is authenticated, authorised, auditable, and limited to signalling rather than carrying unnecessary clinical detail.
