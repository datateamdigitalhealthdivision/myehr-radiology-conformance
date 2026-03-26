# RadioConnect Direct-RIS Pattern

## Purpose

This source-preservation annex records the optional direct-RIS retrieval and synchronisation pattern supplied by implementation partners. It is retained so that partner-specific deployments can remain aligned to the national repository without requiring a separate specification.

## Request pattern

```http
GET [base]/$impacs-ris-sync?from=2026-03-22T00:00:00Z&to=2026-03-22T02:00:00Z&_count=50&_page=1&patientId=RIS-12345
Authorization: Bearer [token]
Accept: application/fhir+json
Prefer: respond-async
```

## Expected payload shape

The response should be a self-resolving `searchset` `Bundle` with a `self` link and the matched business resources:

- `ServiceRequest`
- `ImagingStudy`
- `DiagnosticReport`

The bundle should also include the referenced supporting resources needed to resolve internal references cleanly, typically:

- `Patient`
- `Encounter`
- `Practitioner`
- `PractitionerRole`
- `Organisation`
- `Location`
- `Procedure`
- `Observation`
- `Endpoint`

## Preserved technical rules

- accession identifiers should remain reconcilable between `ServiceRequest` and `ImagingStudy`
- the returned report should include a PDF `presentedForm`
- internal references should resolve correctly within the returned bundle
- `_count`, `_page`, and patient-specific filtering remain part of the preserved operating pattern

## Capability template note

Partners claiming this pattern should publish a `CapabilityStatement` that explicitly declares support for the relevant resources and, where applicable, the optional `$impacs-ris-sync` operation.
