# 06 Conformance Testing

## Purpose

This repository includes a lightweight but extensible conformance testing structure intended to grow into a national validation pack.

## Test model

Conformance testing should cover:

- instance validation against FHIR profiles and bindings
- invariant validation for final reports, available studies, completed tasks, document unique identifiers, and SubmissionSet identifiers
- search and interaction behaviour for declared CapabilityStatements
- workflow sequencing across multiple actors
- handling of invalid or incomplete payloads
- consistency between FHIR metadata and DICOM, DICOMweb, or document-sharing references

## Initial actor-focused checks

### HIS Order Placer

- can create a conformant radiology `ServiceRequest`
- can receive workflow state updates through `Task`
- preserves accession and order identifiers consistently

### RIS Workflow Manager

- can accept, reject, schedule, and complete work items
- can publish `Procedure`, `ImagingStudy`, `Endpoint`, `DiagnosticReport`, `DocumentReference`, and `List` outputs where in scope
- supports documented search expectations
- supports the optional `$impacs-ris-sync` operation if it claims direct-RIS capability

### Viewer or EHR Consumer

- can read `DiagnosticReport`
- can follow `ImagingStudy` links, `Endpoint` references, `DocumentReference` links, and report-to-study associations
- handles amended reports safely

### MHD Document Source and Recipient

- can assemble and accept a valid ITI-65 Provide Document Bundle
- preserve the required metadata bindings on `DocumentReference` and `List`
- can return clear query results and rejection responses

## Preserved scenario coverage

The repository now preserves the following scenarios for future automation and procurement use:

- bulk direct-RIS synchronisation success
- patient-specific direct-RIS query
- missing accession error handling
- partial report handling before final sign-off
- parameter-driven frequency testing
- MHD document submission and retrieval

## Test asset types

- positive examples
- negative examples
- scenario bundles
- actor-specific checklists
- technical acceptance criteria summaries
- UAT-oriented checklists
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

## Error response expectations

Where a system rejects a payload, it should return a FHIR `OperationOutcome` rather than a transport-level error alone.

- `issue.severity` should communicate whether the problem is fatal to processing.
- `issue.code` should use the standard FHIR error taxonomy.
- `issue.details.text` should state the breached national rule in plain implementation language.
- `issue.expression` should identify the offending element where possible.

The repository includes starter example rejection payloads for an invalid radiology `ServiceRequest` and a direct-RIS accession mismatch.

## Notification and polling test expectations

This first draft accepts polling as the baseline notification pattern for workflow status changes. Testing should therefore verify that the declared search interactions are sufficient for downstream systems to discover changed orders, tasks, reports, studies, and document packages.

If a partner implements event-driven notifications or the optional `$impacs-ris-sync` operation, those capabilities should be tested as additional supported functions rather than assumed by default in phase 1.
