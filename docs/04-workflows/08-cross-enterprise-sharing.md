# 08 Cross-Enterprise Sharing

## Purpose

Define the draft national approach for sharing radiology reports and imaging references across organisations or facilities.

## Actors

- source organisation repository, RIS, archive, or MHD Document Source
- consuming organisation
- MHD Document Recipient or gateway where implemented
- cross-enterprise registry or repository infrastructure where implemented

## Trigger

A report or study needs to be accessed outside the originating organisation for patient care, referral, transfer, or longitudinal record access.

## Preconditions

- sharing policy permits the exchange
- patient identity correlation is possible
- organisational trust is in place

## Postconditions

- external consumers can discover or receive report and study references
- document packages can be queried and retrieved through MHD where deployed
- image retrieval can occur through the agreed cross-enterprise pattern
- provenance and access are traceable

## Source of truth

The originating organisation remains the source of truth for its report and imaging content. The document-sharing gateway or registry is an access layer rather than the clinical authority.

## Sequence summary

1. Source system publishes or exposes report and study references.
2. Source system may package the report document as `DocumentReference` and `List` for MHD or XDS-aligned sharing.
3. Consumer discovers the relevant content through registry, repository, or agreed API mechanisms.
4. Consumer retrieves the report and, where permitted, the associated images.

## FHIR artefacts involved

- `DiagnosticReport`
- `ImagingStudy`
- `DocumentReference`
- `List`
- `AuditEvent`
- MY Core `Patient`

## DICOM or DICOMweb transactions involved

- DICOMweb retrieval for study content where supported

## IHE profile context

Primary narrative alignment is to `MHD` for FHIR-native document sharing and `XDS-I.b` for cross-enterprise imaging content, with `XCA-I` reserved as a future option where national cross-community exchange is needed.

## Required data elements

- source organisation identifier
- patient identity correlation data
- report identifier
- study identifier and `StudyInstanceUID`
- document `uniqueId`, `sourceId`, and submission metadata where MHD is used
- provenance and availability metadata

## Status transitions

Content availability, replacement, or deprecation should be visible to consumers, especially where amended reports or corrected studies exist.

## Acknowledgements or response expectations

Cross-enterprise exchange should return clear discovery and retrieval outcomes. Denial or policy failure should be explicit and auditable.

## Errors or edge cases

- patient identity cannot be matched
- source archive reachable but study retrieval denied
- amended reports supersede content already shared externally
- consumer lacks support for the chosen sharing pattern
- document package accepted but backend XDS registration fails

## Security and audit considerations

Cross-enterprise sharing requires stronger trust governance than local retrieval. Authentication, authorisation, purpose-of-use, and audit trails are critical.

Routine access should be limited to an authorised treating relationship or another approved operational basis. `PROVISIONAL`: the final national consent model for cross-facility imaging access remains `TO BE CONFIRMED`, so implementers should expose the policy hooks needed for local approval, disclosure logging, and later national alignment.

Where emergency or break-glass access is supported, the consuming system shall record the requesting identity, the clinical justification, the accessed study or report, and the access timestamp for retrospective review.

## Test assertions

- a shared report remains linked to the correct imaging study
- provenance and source organisation remain visible
- required MHD metadata is populated when document sharing is used
- access denial is distinguishable from technical failure

## Implementation notes

This capability is likely phased. The first draft therefore documents it clearly but does not treat it as universal day-one functionality.

MHD is the preferred FHIR-native document-sharing mechanism. Implementers should not expose backend XDS SOAP endpoints to ordinary FHIR participants where an MHD gateway is available.

## Open issues or local decisions pending

- whether `MHD` is phase-1 mandatory for cross-enterprise report sharing is `TO BE CONFIRMED`
- whether `XDS-I.b` is phase-1 mandatory for image manifest exchange is `TO BE CONFIRMED`
- whether `XCA-I` is needed nationally remains `TO BE CONFIRMED`
- detailed national consent and break-glass policy remains `TO BE CONFIRMED`
