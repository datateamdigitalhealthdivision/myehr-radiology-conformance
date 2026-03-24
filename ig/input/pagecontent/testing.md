# Conformance Testing

This guide is accompanied by repository-level conformance assets intended to grow into a formal national validation pack.

## Initial test focus

- instance validation against the published profiles and bindings
- invariant validation for final reports, available studies, order intent, and completed tasks
- search and interaction behaviour aligned to the published CapabilityStatements
- workflow sequencing across ordering, scheduling, acquisition, reporting, and retrieval
- rejection of invalid or incomplete payloads
- consistency between FHIR metadata and DICOM or DICOMweb identifiers where referenced

## Published test assets

| Asset type | Repository source | Purpose |
| --- | --- | --- |
| Overview and structure | [tests/README.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/tests/README.md) | Explains the current test pack layout and growth path. |
| Positive FHIR payloads | [tests/fhir/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/fhir) | Reference payloads for conformant messages and resources. |
| Negative examples | [tests/negative-tests/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/negative-tests) | Examples expected to fail validation or be rejected, including final reports without conclusions and completed tasks without outputs. |
| Scenario bundles | [tests/sample-payloads/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/sample-payloads) | Composite payloads for workflow-oriented testing. |
| Workflow scenarios and checklists | [tests/workflow-scenarios/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/workflow-scenarios) | Human-readable assertions and actor-focused checks. |

## Current maturity statement

This first draft includes structured examples, scenarios, and validation guidance. It does not yet provide a nationally operated executable certification service.

## Immediate validation priorities

- reject `Task` instances that declare `status = completed` without an output reference
- reject final `DiagnosticReport` instances without `conclusion`, `effective[x]`, and `issued`
- reject `ImagingStudy` instances with `status = available` but no `series` or no DICOMweb `endpoint`
- verify patient-centric search support for `ServiceRequest`, `Task`, `DiagnosticReport`, and `ImagingStudy`

## Error response expectations

When a partner system rejects a payload, it should return a FHIR `OperationOutcome` that makes the reason clear enough for integration debugging and conformance testing.

- `issue.severity` should reflect the operational impact, usually `error` for invalid payloads
- `issue.code` should use standard FHIR values such as `invalid`, `required`, or `processing`
- `issue.details.text` should describe the breached national rule in clear implementer language
- `issue.expression` should point to the offending element where possible

The guide publishes an [invalid ServiceRequest OperationOutcome example](OperationOutcome-my-radiology-invalid-service-request-operationoutcome-example.html) to show the expected shape.

## Notification and polling guidance

This first draft does not mandate a single national real-time notification mechanism. Until a national eventing policy is confirmed:

- polling based on the published search interactions is acceptable for phase 1 implementations
- implementation partners should size polling intervals according to the clinical urgency of the workflow
- event-driven notification using FHIR Subscription or an equivalent mechanism may be introduced in later phases once governance confirms the preferred pattern

The maintained narrative note is published in the Notifications And Polling page of this guide.

## Additional chapter

The maintained narrative chapter is available at [docs/06-conformance-testing.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/06-conformance-testing.md).
