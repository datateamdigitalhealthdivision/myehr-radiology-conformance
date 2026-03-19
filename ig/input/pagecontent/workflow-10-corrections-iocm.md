# 10 Corrections And IOCM

## Purpose

Define how corrected orders, imaging metadata, and reports are handled without losing traceability.

## Actors

- RIS
- reporting system
- PACS or VNA
- health information management or quality team where relevant

## Trigger

An error, mismatch, amendment, or replacement event is identified after initial publication or performance.

## Preconditions

- the discrepancy is confirmed
- responsible operational authority is identified
- downstream systems can receive corrected state

## Postconditions

- corrected resources or replacement indicators are published
- superseded content remains traceable
- audit evidence records what changed and why

## Source of truth

The system operationally responsible for the corrected content remains the source of truth: RIS for business workflow correction, archive for imaging object correction, reporting system for report amendment.

## Sequence summary

1. A discrepancy is identified.
2. Responsible system applies correction or marks content entered in error.
3. Corrected state is propagated to dependent systems.
4. Superseded and replacement relationships remain visible.

## FHIR artefacts involved

- `Task`
- `Procedure`
- `ImagingStudy`
- `DiagnosticReport`
- optional `DocumentReference`

## DICOM or DICOMweb transactions involved

- IOCM-related patterns
- corrected retrieval behaviour where replaced objects exist

## IHE profile context

Strongly aligned to IHE IOCM concepts for image object change management.

## Required data elements

- correction reason
- replacement or supersession relationship
- timestamps
- responsible user or system
- affected identifiers

## Status transitions

- `DiagnosticReport.status`: may move to `amended`, `appended`, or `entered-in-error`
- `Task.status`: may move to `cancelled` or another corrective workflow state

## Acknowledgements or response expectations

Consumers should be able to distinguish corrected content from original content and should not treat superseded results as current.

## Errors or edge cases

- correction arrives after cross-enterprise sharing
- wrong-patient acquisition requires quarantine
- report amended without linked study correction
- consumer caches stale report content

## Security and audit considerations

Correction flows must be highly auditable. Access to wrong-patient or quarantined content should be tightly controlled.

## Test assertions

- amended reports remain traceable to the replaced version
- corrective workflow prevents stale content from appearing current
- wrong-patient scenarios produce safe rejection or quarantine behaviour

## Implementation notes

Do not rely on deletion alone. Prefer traceable replacement, amendment, or entered-in-error semantics.

## Open issues or local decisions pending

- detailed national IOCM adoption level is `TO BE CONFIRMED`
- archive behaviour for replaced instances is `TO BE CONFIRMED`

## Related Pages

- [Workflow Summary](workflow-summary.html)
- [FHIR Artefacts](fhir-artefacts.html)
- [Technical Annexes](annexes.html)
- Maintained source markdown: [docs/04-workflows/10-corrections-iocm.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/10-corrections-iocm.md)

