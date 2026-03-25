# Notifications And Polling

This guide recognises that workflow visibility is only useful if downstream systems can detect change within an acceptable operational time.

## Baseline national position in v0.1.0

This first draft does not mandate a single national eventing mechanism for radiology workflow updates.

- phase 1 implementations may use polling against the declared search interactions in the CapabilityStatements
- polling intervals should be proportionate to the clinical urgency of the workflow being supported
- notification design should avoid disclosing unnecessary clinical detail outside the subsequent secure resource read

## Polling expectations

At minimum, an implementation partner should be able to poll the following:

- `ServiceRequest` by patient, identifier, status, authored date, and category
- `Task` by patient, focus, status, and authored-on
- `DiagnosticReport` by patient, identifier, status, issued date, and category
- `ImagingStudy` by patient and identifier
- `DocumentReference` and `List` where document sharing is in scope

Polling remains acceptable in this draft because the CapabilityStatements publish these searches explicitly and the workflow chapters define the state transitions that consumers should expect to discover.

## Optional direct-RIS synchronisation pattern

The preserved RadioConnect pattern remains supported as an optional partner-specific retrieval mechanism. It does not replace the national baseline of standard read and search interactions.

Example request pattern:

```http
GET [base]/$impacs-ris-sync?from=2026-03-22T00:00:00Z&to=2026-03-22T02:00:00Z&_count=50&_page=1&patientId=RIS-12345
Authorization: Bearer [token]
Accept: application/fhir+json
Prefer: respond-async
```

Implementation expectations for the optional operation are:

- `from` and `to` are required parameters defining the polling window
- `_count` and `_page` support bulk retrieval without excessive response size
- `patientId` narrows the response to one patient where needed
- the RIS may query PACS or archive services for additional metadata before assembling the response bundle
- the response is a `searchset` `Bundle` containing the matched `Patient`, `Practitioner`, `Location`, `ServiceRequest`, `ImagingStudy`, and `DiagnosticReport` resources

## Future event-driven pattern

`TO BE CONFIRMED`: a later national phase may define a preferred event-driven pattern, potentially using FHIR `Subscription`, partner-managed message delivery, or a national notification broker.

If event-driven notification is implemented before that policy is settled:

- the notification channel should carry the minimum data needed to trigger a secure read
- the channel should be authenticated, authorised, and auditable
- the notification should point back to the authoritative FHIR resource rather than attempting to carry full radiology content

## Testing note

Conformance testing should treat polling as the minimum baseline and event-driven notification as an optional additional capability until the national notification policy is finalised.

The optional `$impacs-ris-sync` operation, where implemented, should be tested for:

- correct time-window filtering
- patient-specific filtering
- response paging behaviour
- accession reconciliation and PDF report availability in the returned bundle
