# Test Assets

This directory contains the first draft of the national radiology conformance test pack.

## Current structure

- `fhir/`: machine-readable FHIR payloads and reference examples
- `workflow-scenarios/`: human-readable scenario descriptions and actor checklists
- `negative-tests/`: examples expected to fail validation or be rejected
- `sample-payloads/`: representative Bundles and composite exchange payloads

## Initial usage

The assets in this directory are intended for:

- implementer self-testing
- onboarding workshops
- future conversion into automated validation suites
- regression checking when profile invariants or CapabilityStatement expectations are tightened

## Growth path

The long-term intent is to add executable validation logic, actor-specific checklists, and eventually a national validation harness aligned to the CapabilityStatements in the FHIR IG.

## Error handling note

Negative-test execution should expect a FHIR `OperationOutcome` where a receiving system rejects an invalid payload. The current repository includes a starter example for an invalid radiology `ServiceRequest`.
