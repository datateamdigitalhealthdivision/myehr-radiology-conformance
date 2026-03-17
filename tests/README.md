# Test Assets

This directory contains the first draft of the national radiology conformance test pack.

## Current structure

- `scenarios/`: human-readable scenario descriptions
- `sample-bundles/`: example transaction or message Bundles
- `positive/`: examples expected to conform
- `negative/`: examples expected to fail or require rejection

## Initial usage

The assets in this directory are intended for:

- implementer self-testing
- onboarding workshops
- future conversion into automated validation suites

## Growth path

The long-term intent is to add executable validation logic, actor-specific checklists, and eventually a national validation harness aligned to the CapabilityStatements in the FHIR IG.

