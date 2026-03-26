# MHD To XDS Bridge Pattern

## Purpose

This source-preservation annex records the current intended use of IHE MHD as a bridge to backend XDS.b infrastructure for radiology document sharing.

## Key metadata expectations

The bridge should preserve the following mappings:

- `DocumentReference.category` -> `DocumentEntry.classCode`
- `DocumentReference.content.format` -> `DocumentEntry.formatCode`
- packaged PDF report examples use `urn:ihe:rad:PDF` with display `RAD PDF` to match the published IHE format code system
- `DocumentReference.context.facilityType` -> `DocumentEntry.healthcareFacilityTypeCode`
- `DocumentReference.context.practiceSetting` -> `DocumentEntry.practiceSettingCode`
- `DocumentReference.securityLabel` -> `DocumentEntry.confidentialityCode`
- `DocumentReference.context.event` -> `DocumentEntry.eventCodeList`
- `List.code` -> `SubmissionSet.contentTypeCode`

## Identity and OID guidance

- `DocumentReference.masterIdentifier` carries the document `uniqueId`
- `List.identifier` carries the SubmissionSet identifier
- `List.extension[sourceId]` carries the document source identifier
- `repositoryUniqueId` remains an infrastructure registration property
- `homeCommunityId` remains deferred until cross-community exchange is brought into scope

## Deployment note

The national position is to keep FHIR participants on the MHD side of the gateway. Native SOAP XDS endpoints should remain an infrastructure concern rather than a requirement for ordinary FHIR implementation partners.
