# 08 Cross-Enterprise Sharing

## Purpose

Define the draft national approach for sharing radiology reports and imaging references across organisations or facilities.

## Actors

- source organisation repository or archive
- consuming organisation
- cross-enterprise registry or gateway where implemented

## Trigger

A report or study needs to be accessed outside the originating organisation for patient care, referral, or transfer.

## Preconditions

- sharing policy permits the exchange
- patient identity correlation is possible
- organisational trust is in place

## Postconditions

- external consumers can discover or receive report and study references
- image retrieval can occur through the agreed cross-enterprise pattern
- provenance and access are traceable

## Source of truth

The originating organisation remains the source of truth for its report and imaging content.

## Sequence summary

1. Source system publishes or exposes report and study references.
2. Consumer discovers the relevant content through registry, repository, or agreed API mechanisms.
3. Consumer retrieves the report and, where permitted, the associated images.

## FHIR artefacts involved

- `DiagnosticReport`
- `ImagingStudy`
- `DocumentReference`
- MY Core `Patient`

## DICOM or DICOMweb transactions involved

- DICOMweb retrieval for study content where supported

## IHE profile context

Primary narrative alignment is to `XDS-I.b`, with `XCA-I` reserved as a future option where national cross-community exchange is needed.

## Required data elements

- source organisation identifier
- patient identity correlation data
- report identifier
- study identifier and `StudyInstanceUID`
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

## Security and audit considerations

Cross-enterprise sharing requires stronger trust governance than local retrieval. Authentication, authorisation, purpose-of-use, and audit trails are critical.

## Test assertions

- a shared report remains linked to the correct imaging study
- provenance and source organisation remain visible
- access denial is distinguishable from technical failure

## Implementation notes

This capability is likely phased. The first draft therefore documents it clearly but does not treat it as universal day-one functionality.

## Open issues or local decisions pending

- whether `XDS-I.b` is phase-1 mandatory is `TO BE CONFIRMED`
- whether `XCA-I` is needed nationally remains `TO BE CONFIRMED`

