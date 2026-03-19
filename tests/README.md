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

## Growth path

The long-term intent is to add executable validation logic, actor-specific checklists, and eventually a national validation harness aligned to the CapabilityStatements in the FHIR IG.
