# 11 Implementation Considerations

## Purpose

This informative chapter records non-normative operational guidance for performance, paging, polling intervals, and error handling.

## Read with

- the rendered [Implementation Considerations](https://datateamdigitalhealthdivision.github.io/myehr-radiology-conformance/implementation-considerations.html) page
- [08 Notification Patterns](./08-notification-patterns.md)
- [06 Conformance Testing](./06-conformance-testing.md)

## Informative targets

- routine search and direct-retrieval interactions should normally complete within 2000 milliseconds
- servers should handle bundles containing 50 or more resources without timing out
- polling intervals should be configurable and tied to clinical urgency
- failures should return `OperationOutcome` with the appropriate HTTP status and retry guidance where relevant
