# Document Sharing

## Document Sharing Overview

This guide uses IHE MHD as the FHIR-native document-sharing mechanism for radiology reports and related packaged documents. MHD may operate as a standalone FHIR document service or as a bridge to backend XDS.b infrastructure through an MHD gateway. Native XDS.b SOAP endpoints are not required for FHIR participants.

## Architecture

Three deployment patterns are recognised in this first draft:

- `MHD standalone`: a FHIR document registry or repository without backend XDS.b
- `MHD to XDS.b bridge`: a FHIR-facing MHD gateway translating to XDS Registry and Repository transactions
- `Hybrid`: some participants use MHD directly while others continue to use native XDS.b behind the gateway

Illustrative flow:

```text
Document Source
  -> ITI-65 Provide Document Bundle
MHD Document Recipient or Gateway
  -> ITI-41 / ITI-42
XDS Registry and Repository
```

## MHD Transactions

| Transaction | FHIR interaction | Primary artefacts |
| --- | --- | --- |
| ITI-65 Provide Document Bundle | `POST` `Bundle` with `type = transaction` | `List`, `DocumentReference`, optional `Binary` |
| ITI-66 Find Document Lists | `GET` `List` search | `List` |
| ITI-67 Find Document References | `GET` `DocumentReference` search | `DocumentReference` |
| ITI-68 Retrieve Document | `GET` `Binary/[id]` | `Binary` |

The expected actor behaviour is published in the [MHD Document Source](CapabilityStatement-my-radiology-mhd-document-source.html) and [MHD Document Recipient](CapabilityStatement-my-radiology-mhd-document-recipient.html) CapabilityStatements.

## Affinity Domain Coded Metadata

Every document submission should carry the coded metadata published in this guide.

| XDS metadata slot | FHIR element | Published artefact |
| --- | --- | --- |
| `DocumentEntry.classCode` | `DocumentReference.category` | [MY Radiology XDS Class Code ValueSet](ValueSet-my-radiology-xds-class-code-vs.html) |
| `DocumentEntry.formatCode` | `DocumentReference.content.format` | [MY Radiology XDS Format Code ValueSet](ValueSet-my-radiology-xds-format-code-vs.html) |
| `DocumentEntry.healthcareFacilityTypeCode` | `DocumentReference.context.facilityType` | [MY Radiology XDS Facility Type ValueSet](ValueSet-my-radiology-xds-facility-type-vs.html) |
| `DocumentEntry.practiceSettingCode` | `DocumentReference.context.practiceSetting` | [MY Radiology XDS Practice Setting ValueSet](ValueSet-my-radiology-xds-practice-setting-vs.html) |
| `DocumentEntry.confidentialityCode` | `DocumentReference.securityLabel` | [MY Radiology XDS Confidentiality ValueSet](ValueSet-my-radiology-xds-confidentiality-vs.html) |
| `SubmissionSet.contentTypeCode` | `List.code` | [MY Radiology XDS Content Type ValueSet](ValueSet-my-radiology-xds-content-type-vs.html) |
| `DocumentEntry.eventCodeList` | `DocumentReference.context.event` | [MY Radiology XDS Event Code ValueSet](ValueSet-my-radiology-xds-event-code-vs.html) |

## Document Lifecycle

Document lifecycle states remain aligned to the clinical workflow:

- `preliminary` content may be shared only where governance and workflow permit
- `final` content is the default expected sharing state for report exchange
- `amended` and addendum content should preserve linkage to the earlier report or packaged document
- replacement should use `DocumentReference.relatesTo` with `code = replaces` where applicable
- `entered-in-error` content should remain auditable and should not be silently deleted from the sharing history

## Identifier Requirements

- `DocumentReference.masterIdentifier` SHALL carry the document `uniqueId` using `urn:ietf:rfc:3986` and a `urn:oid:` value
- `List.identifier` on the SubmissionSet SHALL carry an OID-style identifier
- `sourceId` SHALL be carried in the IHE MHD extension on the SubmissionSet and identify the document source system
- `repositoryUniqueId` is an infrastructure assignment and is not carried directly in the FHIR payloads
- `homeCommunityId` is required only if cross-community exchange is later brought into scope

The provisional published naming artefact is the [Document Unique ID Naming System](NamingSystem-MYDocumentUniqueIdNamingSystem.html).

## Patient Identity

The MHD Document Recipient must be able to resolve patient identity across document sources.

- `DocumentReference` and `List` resources SHALL reference the patient using the national patient identifier system
- submissions SHALL be rejected where patient identity cannot be resolved
- FHIR `$match` is the preferred identity matching mechanism
- PIXm remains a deployment option for environments that must interoperate with legacy cross-reference services
- cross-referencing between local MRNs and the national patient identifier remains a deployment responsibility and is outside the formal scope of this draft

## Security And Audit

MHD transactions should be implemented together with the [Security And Audit](security.html) page.

- TLS 1.2 or higher is required
- mutual TLS is recommended for server-to-server MHD integrations
- `AuditEvent` is the expected FHIR audit mechanism for document submission, query, and retrieval
- the audit repository endpoint remains `PROVISIONAL`
- document-sharing SMART scopes for `DocumentReference`, `List`, and `Binary` should be provisioned explicitly

## Implementation note

The national position is that MHD complements, rather than replaces, the local radiology workflow and imaging stack. `DiagnosticReport`, `ImagingStudy`, and DICOMweb remain relevant even when packaged report documents are shared through MHD.
