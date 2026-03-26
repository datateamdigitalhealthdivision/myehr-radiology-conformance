# 05 RadioConnect Direct-RIS Sync

## Goal

Verify the preserved optional direct-RIS retrieval pattern using either standard polling behaviour or the optional `$impacs-ris-sync` operation.

## Scenario set

### Bulk Sync Success

- request a two-hour window
- expect a `searchset` bundle with a `self` link and the requested polling window parameters
- expect the matched order, study, and report resources together with the referenced patient, encounter, practitioner, role, organisation, location, procedure, observation, and endpoint context needed to resolve internal references

### Patient-Specific Query

- supply `patientId`
- expect only resources for the named patient, with the same supporting references preserved for that patient context

### Missing Accession Error

- submit or simulate a study without a reconcilable accession identifier
- expect an `OperationOutcome` or a reconciliation failure

### Partial Report Handling

- return a preliminary report
- expect the consumer to retain the payload but mark it for later finalisation

### Parameter-Driven Frequency Test

- execute different time windows
- confirm the bundle contents follow the requested window precisely
