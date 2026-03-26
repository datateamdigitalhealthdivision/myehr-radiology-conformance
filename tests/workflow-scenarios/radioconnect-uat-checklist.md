# RadioConnect UAT Checklist

## UAT Phase 1: Connectivity And Security

|ID|Test scenario|Expected result|Pass or Fail|
|---|---|---|---|
|1.1|Base URL access|System can reach the FHIR R4 endpoint and receive a CapabilityStatement.||
|1.2|Authentication|Connection is successful using OAuth2 bearer tokens; unauthorised requests return `401`.||
|1.3|TLS compliance|Connection is rejected if using protocols lower than TLS 1.2.||

## UAT Phase 2: Functional Sync Operations

|ID|Test scenario|Expected result|Pass or Fail|
|---|---|---|---|
|2.1|Bulk sync success|Triggering `$impacs-ris-sync` with a two-hour window returns a Bundle with all records from that period.||
|2.2|Parameter validation|Changing the `from` and `to` parameters accurately shifts the data returned in the Bundle.||
|2.3|Patient filter|Syncing with a specific `patientId` returns only resources for that patient.||
|2.4|Empty set handling|Requesting a time range with no activity returns a valid Bundle with `total: 0`.||

## UAT Phase 3: Data Integrity And Clinical Rules

|ID|Test scenario|Expected result|Pass or Fail|
|---|---|---|---|
|3.1|Accession match|`ImagingStudy.identifier[ACSN]` matches `ServiceRequest.identifier[ACSN]` for every entry.||
|3.2|PDF ingestion|The returned `DiagnosticReport.presentedForm` is valid PDF content and renders correctly.||
|3.3|Mandatory fields|Every resource contains `meta.profile` and the expected identifiers.||
|3.4|Status updates|A report moved from preliminary to final triggers a successful update in the consumer.||

## UAT Phase 4: Negative Testing

|ID|Test scenario|Expected result|Pass or Fail|
|---|---|---|---|
|4.1|Malformed request|Invalid date format returns `400 Bad Request` with an `OperationOutcome`.||
|4.2|Missing accession|A study without an accession identifier triggers a validation error or reconciliation failure.||
|4.3|Broken reference|A report pointing to a non-existent patient is rejected by the validator.||

## UAT Phase 5: Performance And Scaling

|ID|Test scenario|Expected result|Pass or Fail|
|---|---|---|---|
|5.1|Response latency|The sync operation completes in under 2000 ms for standard queries.||
|5.2|Large bundle test|The server successfully serves a Bundle containing 50 or more resources without timing out.||

## Approval Sign-Off

Technical Lead: ____________________ Date: __________

Clinical Lead: ____________________ Date: __________
