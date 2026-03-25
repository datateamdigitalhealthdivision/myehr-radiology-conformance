# Security And Audit

## Baseline security position

The FHIR-facing layer assumes OAuth2 and SMART on FHIR with a realistic sandbox-first implementation posture. This guide does not attempt to define the full production identity and access management architecture, but it does state the minimum national assumptions that implementation partners should design for.

## Working assumptions in this draft

- confidential clients for server-side integrations
- bearer-token access to the FHIR API
- scope-based authorisation aligned to actor role
- environment-specific base URLs and metadata endpoints
- auditable linkage between FHIR events and imaging-layer transactions

## `PROVISIONAL` endpoint placeholders

- SMART configuration: `https://sandbox-auth.myehr.kkmhub.moh.gov.my/.well-known/smart-configuration`
- token endpoint root: `https://sandbox-auth.myehr.kkmhub.moh.gov.my`
- FHIR sandbox audience: `https://sandbox.myehr.kkmhub.moh.gov.my/fhir/r4`
- terminology root: `https://terminology.kkmhub.moh.gov.my`
- audit repository: `https://audit.myehr.kkmhub.moh.gov.my/fhir/r4`

## Scope expectations

The initial draft assumes SMART-style scopes such as:

- `system/ServiceRequest.read`
- `system/ServiceRequest.write`
- `system/Task.read`
- `system/Task.write`
- `system/ImagingStudy.read`
- `system/DiagnosticReport.read`
- `system/Observation.read`
- `system/DocumentReference.read`
- `system/DocumentReference.write`
- `system/List.read`
- `system/List.write`
- `system/Binary.read`
- `system/Binary.write`

## Trust boundaries

Partners should not assume that the FHIR layer alone is sufficient to secure the imaging ecosystem. The wider national trust model must also address:

- authentication of modalities to worklist and storage endpoints
- archive and viewer authentication to DICOMweb services
- organisation-to-organisation trust for cross-enterprise sharing
- correlation of FHIR actions with DICOM, DICOMweb, and audit events

## Document sharing security

For MHD and XDS-aligned document sharing:

- all ITI-65, ITI-66, ITI-67, and ITI-68 transactions SHALL use TLS 1.2 or higher
- MHD Document Recipients SHOULD require mutual TLS for server-to-server integrations
- certificate policy and trust-chain issuance remain `TO BE CONFIRMED` under the national PKI model
- Document Sources SHALL generate a FHIR `AuditEvent` for each ITI-65 submission
- Document Recipients SHALL generate a FHIR `AuditEvent` for each ITI-65 receipt, each ITI-67 query response, and each ITI-68 retrieval
- audit retention remains `TO BE CONFIRMED`, but the implementation design should support no less than 7 years

## Direct-RIS retrieval security note

Where the optional `$impacs-ris-sync` pattern is implemented:

- the request SHALL use OAuth2 bearer tokens
- the client SHALL request `application/fhir+json`
- `Prefer: respond-async` may be used for large retrieval windows
- the operation SHALL remain auditable in the same way as equivalent search or read interactions

## Audit expectations

Implementations should retain auditable evidence for:

- order creation, amendment, cancellation, and rejection
- appointment booking, rescheduling, and completion
- image storage, storage commitment, and retrieval
- report creation, finalisation, amendment, addendum publication, and viewing
- document submission, query, retrieval, replacement, and rejection

## Consent and emergency access

Cross-enterprise image and report sharing introduces a separate policy question beyond transport security: when a receiving organisation is permitted to view information from another organisation.

- Routine sharing should be governed by the treating relationship, authorised role, and applicable patient-consent rules in force for the deployment context.
- `PROVISIONAL`: the detailed national consent and disclosure policy remains `TO BE CONFIRMED`. This guide therefore does not hard-code a final consent workflow into the computable artefacts.
- Emergency or break-glass access may be necessary for time-critical care. Where such access is implemented, the accessing system shall record who accessed the information, when it occurred, the emergency justification, and which external study or report was viewed.
- Break-glass access should be tightly role-controlled, auditable, and subject to retrospective review by the responsible organisation.

## Notification security note

If implementers use event-driven notification in later phases, the notification channel shall be protected to the same trust standard as the primary FHIR API. Notification endpoints should not disclose more data than necessary to signal that a downstream read should occur.

## Additional chapter

The maintained repository chapter is available at [docs/05-security-and-audit.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/05-security-and-audit.md).
