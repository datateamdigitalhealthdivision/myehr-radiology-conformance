# 05 Security And Audit

## Security baseline

The FHIR-facing layer uses OAuth2 and SMART on FHIR. This repository assumes a realistic sandbox-first security posture:

- confidential clients for server-side integrations
- bearer tokens for API access
- scope-based authorisation aligned to actor role
- environment-specific base URLs and metadata endpoints

## SMART on FHIR placeholders

The following are `PROVISIONAL` examples only:

- SMART configuration URL: `https://sandbox-auth.myehr.kkmhub.moh.gov.my/.well-known/smart-configuration`
- Token endpoint root: `https://sandbox-auth.myehr.kkmhub.moh.gov.my`
- Audience: `https://sandbox.myehr.kkmhub.moh.gov.my/fhir/r4`

## Draft scope model

The first draft assumes SMART-style scopes such as:

- `system/ServiceRequest.read`
- `system/ServiceRequest.write`
- `system/Task.read`
- `system/Task.write`
- `system/ImagingStudy.read`
- `system/DiagnosticReport.read`
- `system/Observation.read`

These should be refined once the national authorisation policy is finalised.

## Imaging endpoint trust assumptions

DICOM and DICOMweb endpoints may not use SMART directly in every deployment. The national trust model should therefore describe:

- how modalities authenticate to worklist and storage endpoints
- how archives and viewers authenticate to DICOMweb services
- how organisation-to-organisation trust is established for cross-enterprise sharing
- how audit trails correlate FHIR actions with imaging transactions

## Audit expectations

The initial expectation is that implementations retain audit evidence for:

- order creation and amendment
- order acceptance or rejection
- appointment booking and rescheduling
- image storage and retrieval events
- report creation, finalisation, amendment, and viewing

## Confidentiality and access control

Access should be limited by care relationship, organisational role, and operational need. Implementers should ensure that imaging endpoints do not bypass the same patient confidentiality principles enforced on the FHIR layer.

## Production considerations still open

- federated trust between organisations is `TO BE CONFIRMED`
- final token lifetime policy is `TO BE CONFIRMED`
- break-glass behaviour is `TO BE CONFIRMED`
- detailed audit transport and retention policy is `TO BE CONFIRMED`
