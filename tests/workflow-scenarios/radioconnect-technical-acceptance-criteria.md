# RadioConnect Technical Acceptance Criteria

## Connection And Operational Requirements

- the RIS exposes a production-grade FHIR R4 base URL over TLS 1.2 or higher
- OAuth2 bearer-token authentication is supported
- the optional `$impacs-ris-sync` operation is supported where the partner claims the RadioConnect pattern
- `from` and `to` are required parameters
- `patientId` remains optional
- polling frequency is configurable by the consuming system

## Resource Conformance And Cardinality

- `Patient` includes local and national identifiers, gender, and birth date
- `ServiceRequest` includes order identifier, accession identifier, and subject
- `ImagingStudy` includes study UID, accession identifier, and `basedOn`
- `DiagnosticReport` includes status, issued timestamp, and PDF `presentedForm`
- `Practitioner` includes local and national identifiers

## Logical Invariants And Data Integrity

- accession values remain reconcilable between `ServiceRequest` and `ImagingStudy`
- all returned resources declare the appropriate `meta.profile`
- internal references resolve correctly within the bundle
- the report payload remains human-readable through PDF rendering

## Error Handling And Performance

- errors are returned as `OperationOutcome`
- paging is supported for bulk windows
- issued timestamps reflect clinical sign-off time
