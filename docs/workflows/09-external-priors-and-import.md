# 09 External Priors And Import

## Purpose

Define how externally sourced prior studies are imported, reconciled, and made available for clinical comparison.

## Actors

- import gateway or archive
- RIS
- radiologist
- PACS or VNA

## Trigger

An external prior study is pushed, pulled, or manually imported for patient care.

## Preconditions

- organisational policy permits import
- patient identity can be matched or reconciled
- provenance of the external content can be captured

## Postconditions

- the external study is catalogued and marked as imported
- identity reconciliation state is visible
- clinicians can use the prior safely during reporting and viewing

## Source of truth

The imported content remains externally sourced in provenance terms, but the local archive becomes the local source of truth for its managed copy.

## Sequence summary

1. External study is received or retrieved.
2. Local systems reconcile patient identity and provenance.
3. Study is stored locally or linked virtually according to deployment design.
4. The study becomes available to reporting and viewing workflows with clear origin metadata.

## FHIR artefacts involved

- `ImagingStudy`
- optional `DocumentReference`
- optional `DiagnosticReport` reference if an external report is also shared

## DICOM or DICOMweb transactions involved

- DICOM import or storage
- optional `STOW-RS`
- retrieval of priors through `QIDO-RS` or `WADO-RS`

## IHE profile context

Related to import and reconciliation patterns and may intersect with IOCM when corrections are needed after import.

## Required data elements

- source organisation
- original accession or study identifier where available
- local import identifier if assigned
- patient reconciliation status
- study provenance metadata

## Status transitions

Imported studies should move through recognisable internal states such as received, reconciled, available, or quarantined.

## Acknowledgements or response expectations

Import workflows should report whether the study was accepted, quarantined, or rejected and why.

## Errors or edge cases

- patient identity mismatch
- imported study missing critical metadata
- duplicate prior already held locally
- external report references unavailable

## Security and audit considerations

Import actions should capture provenance, operator identity where manual intervention occurs, and any patient identity reconciliation activity.

## Test assertions

- imported studies retain source provenance
- identity reconciliation outcomes are visible
- duplicate imports are handled safely

## Implementation notes

Imported studies should not be silently normalised in ways that erase source provenance or original identifiers.

## Open issues or local decisions pending

- national policy for virtual versus physical import is `TO BE CONFIRMED`
- patient identity reconciliation governance is `TO BE CONFIRMED`
