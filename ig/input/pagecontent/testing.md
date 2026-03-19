# Conformance Testing

This guide is accompanied by repository-level conformance assets intended to grow into a formal national validation pack.

## Initial test focus

- instance validation against the published profiles and bindings
- search and interaction behaviour aligned to the published CapabilityStatements
- workflow sequencing across ordering, scheduling, acquisition, reporting, and retrieval
- rejection of invalid or incomplete payloads
- consistency between FHIR metadata and DICOM or DICOMweb identifiers where referenced

## Published test assets

| Asset type | Repository source | Purpose |
| --- | --- | --- |
| Overview and structure | [tests/README.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/tests/README.md) | Explains the current test pack layout and growth path. |
| Positive FHIR payloads | [tests/fhir/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/fhir) | Reference payloads for conformant messages and resources. |
| Negative examples | [tests/negative-tests/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/negative-tests) | Examples expected to fail validation or be rejected. |
| Scenario bundles | [tests/sample-payloads/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/sample-payloads) | Composite payloads for workflow-oriented testing. |
| Workflow scenarios and checklists | [tests/workflow-scenarios/](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests/workflow-scenarios) | Human-readable assertions and actor-focused checks. |

## Current maturity statement

This first draft includes structured examples, scenarios, and validation guidance. It does not yet provide a nationally operated executable certification service.

## Additional chapter

The maintained narrative chapter is available at [docs/06-conformance-testing.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/06-conformance-testing.md).
