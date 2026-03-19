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

## Scope expectations

The initial draft assumes SMART-style scopes such as:

- `system/ServiceRequest.read`
- `system/ServiceRequest.write`
- `system/Task.read`
- `system/Task.write`
- `system/ImagingStudy.read`
- `system/DiagnosticReport.read`
- `system/Observation.read`

## Trust boundaries

Partners should not assume that the FHIR layer alone is sufficient to secure the imaging ecosystem. The wider national trust model must also address:

- authentication of modalities to worklist and storage endpoints
- archive and viewer authentication to DICOMweb services
- organisation-to-organisation trust for cross-enterprise sharing
- correlation of FHIR actions with DICOM, DICOMweb, and audit events

## Audit expectations

Implementations should retain auditable evidence for:

- order creation, amendment, cancellation, and rejection
- appointment booking, rescheduling, and completion
- image storage, storage commitment, and retrieval
- report creation, finalisation, amendment, addendum publication, and viewing

## Additional chapter

The maintained repository chapter is available at [docs/05-security-and-audit.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/05-security-and-audit.md).
