# ADR-001: One Repository Architecture

## Status

Accepted

## Context

The national radiology specification needs to publish both computable FHIR artefacts and broader workflow, DICOM, DICOMweb, and IHE conformance guidance. Splitting them into separate repositories would increase drift and make vendor onboarding harder.

## Decision

Use one repository for:

- the FHIR R4 implementation guide and package
- the workflow chapters and technical annexes
- examples, tests, mappings, and decision records

## Consequences

- vendors can find the computable and narrative artefacts in one place
- changes to profiles can be reviewed together with workflow and security implications
- publication remains simpler, with GitHub Pages and release assets managed together
