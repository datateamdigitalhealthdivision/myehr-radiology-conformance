# 06 Conformance Testing

## Purpose

This repository includes a lightweight but extensible conformance testing structure intended to grow into a national validation pack.

## Test model

Conformance testing should cover:

- instance validation against FHIR profiles and bindings
- search and interaction behaviour for declared CapabilityStatements
- workflow sequencing across multiple actors
- handling of invalid or incomplete payloads
- consistency between FHIR metadata and DICOM or DICOMweb references

## Initial actor-focused checks

### HIS Order Placer

- can create a conformant radiology `ServiceRequest`
- can receive workflow state updates through `Task`
- preserves accession and order identifiers consistently

### RIS Workflow Manager

- can accept, reject, schedule, and complete work items
- can publish `Procedure`, `ImagingStudy`, and `DiagnosticReport` outputs
- supports documented search expectations

### Viewer or EHR Consumer

- can read `DiagnosticReport`
- can follow `ImagingStudy` links and report-to-study associations
- handles amended reports safely

## Test asset types

- positive examples
- negative examples
- scenario Bundles
- actor-specific checklists
- future executable scripts or test harness definitions

## Assertion style

Assertions should be written so that they can later be converted into executable tests. Each assertion should identify:

- actor
- precondition
- action
- expected response
- expected persisted state
- error condition if applicable

## Current maturity

This first draft includes structured test folders, sample scenarios, and validation guidance. It does not yet include a national executable certification service.

