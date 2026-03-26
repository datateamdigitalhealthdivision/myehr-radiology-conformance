# Conformance Testing

This guide is accompanied by repository-level conformance assets intended to grow into a formal national validation pack.

## Initial test focus

- instance validation against the published profiles and bindings
- invariant validation for final reports, available studies, order intent, completed tasks, document unique identifiers, and SubmissionSet identifiers
- search and interaction behaviour aligned to the published CapabilityStatements
- workflow sequencing across ordering, scheduling, acquisition, reporting, retrieval, and document sharing
- rejection of invalid or incomplete payloads
- consistency between FHIR metadata and DICOM, DICOMweb, and document-sharing identifiers where referenced

## Published test assets

| Asset type | Repository source | Purpose |
| --- | --- | --- |
| Overview and structure | [tests/README.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/tests/README.md) | Explains the current test pack layout and growth path. |
| Positive FHIR payloads | [tests/fhir/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/fhir) | Reference payloads for conformant messages and resources. |
| Negative examples | [tests/negative-tests/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/negative-tests) | Examples expected to fail validation or be rejected, including final reports without conclusions, completed tasks without outputs, and direct-RIS accession mismatches. |
| Scenario bundles | [tests/sample-payloads/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/sample-payloads) | Composite payloads for workflow-oriented, document-sharing, and direct-retrieval testing. |
| Workflow scenarios and checklists | [tests/workflow-scenarios/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/workflow-scenarios) | Human-readable assertions, technical acceptance criteria, and UAT-oriented checks. |

## Current maturity statement

This first draft includes structured examples, scenarios, and validation guidance. It does not yet provide a nationally operated executable certification service.

## Immediate validation priorities

- reject `Task` instances that declare `status = completed` without an output reference
- reject final `DiagnosticReport` instances without `conclusion`, `effective[x]`, `issued`, and a PDF `presentedForm`
- reject `ImagingStudy` instances with `status = available` but no `series` or no DICOMweb `endpoint`
- reject `DocumentReference` instances that omit required MHD metadata when document sharing is claimed
- reject `List` SubmissionSet instances that omit the required OID-style identifier or `sourceId`
- verify patient-centric search support for `ServiceRequest`, `Task`, `DiagnosticReport`, `ImagingStudy`, `DocumentReference`, and `List`

## Scenario coverage

The initial repository now preserves and tests:

- create radiology order
- acknowledge and schedule order
- publish imaging study metadata and report content
- provide document bundle through MHD
- retrieve linked report and study content
- bulk direct-RIS synchronisation success
- patient-specific direct-RIS retrieval
- missing accession error handling
- partial report handling before final sign-off
- parameter-driven polling window behaviour

## Error response expectations

When a partner system rejects a payload, it should return a FHIR `OperationOutcome` that makes the reason clear enough for integration debugging and conformance testing.

- `issue.severity` should reflect the operational impact, usually `error` for invalid payloads
- `issue.code` should use standard FHIR values such as `invalid`, `required`, `processing`, or `invariant`
- `issue.details.text` should describe the breached national rule in clear implementer language
- `issue.expression` should point to the offending element where possible

The guide publishes:

- an [invalid ServiceRequest OperationOutcome example](OperationOutcome-my-radiology-invalid-service-request-operationoutcome-example.html)
- a [direct-RIS accession mismatch OperationOutcome example](OperationOutcome-my-radiology-radioconnect-accession-mismatch-oo-example.html)

## Notification and polling guidance

This first draft does not mandate a single national real-time notification mechanism. Until a national eventing policy is confirmed:

- polling based on the published search interactions is acceptable for phase 1 implementations
- implementation partners should size polling intervals according to the clinical urgency of the workflow
- event-driven notification using FHIR Subscription or an equivalent mechanism may be introduced in later phases once governance confirms the preferred pattern
- the optional `$impacs-ris-sync` operation, where supported, should be tested as an additional capability rather than the only conformant pattern

## Additional chapter

The maintained narrative chapter is available at [docs/06-conformance-testing.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/06-conformance-testing.md).
