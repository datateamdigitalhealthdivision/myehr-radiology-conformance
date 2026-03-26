# Implementation Considerations

This page is informative and non-normative. It provides practical implementation targets that partners may use for deployment planning, testing, and operational readiness.

## Performance and response expectations

- Standard search interactions and the optional `$impacs-ris-sync` operation should normally complete within 2000 milliseconds for routine query volumes.
- Systems should be tested with clinically realistic payload sizes rather than only minimal examples.
- Performance tuning should preserve correctness of identifiers, references, and access-control enforcement.

## Bundle capacity and paging

- Servers should support returning bundles containing 50 or more resources without timing out.
- Partners should use `_count` and `_page` for larger retrieval windows so that result size remains operationally predictable.
- Searchset and transaction handling should preserve stable references, consistent ordering, and complete supporting context where internal bundle references depend on included resources.

## Polling interval guidance

Polling remains the phase 1 national baseline, but polling intervals should be configurable and proportionate to clinical urgency.

| Workflow urgency | Illustrative polling target |
| --- | --- |
| Routine workflow | Every 2 hours |
| Active inpatient or same-day outpatient workflow | Every 30 minutes |
| Urgent, emergency, or emergency department workflow | Every 10 minutes |

These timings are example only. Each deployment should tune them according to service risk, load profile, and operational agreement.

## Error handling and retry behaviour

- Servers should return `OperationOutcome` with an appropriate HTTP status code for all validation and processing failures.
- `400` should be used for invalid parameters or invalid payload content.
- `404` should be used where the requested business resource cannot be found.
- `500` should be used for unexpected server-side processing failures.
- Transient failures should be documented as retryable and should include enough diagnostic detail for partner troubleshooting without exposing unnecessary sensitive information.

## Operational planning note

Implementation partners should read this page together with [Notifications And Polling](notifications.html), [Conformance Testing](testing.html), and the relevant actor capability statements on the [FHIR Artefacts](fhir-artefacts.html) page before finalising non-functional requirements.
