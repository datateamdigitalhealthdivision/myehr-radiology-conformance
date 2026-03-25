# 07 Viewing And Retrieval

## Purpose

Define how clinical systems retrieve reports, study metadata, packaged documents, and images for care delivery.

## Actors

- EHR or clinician viewer consumer
- RIS workflow manager
- PACS or VNA
- FHIR metadata publisher
- optional direct-RIS retrieval consumer

## Trigger

A clinician or authorised system needs to view a report, open imaging, query study metadata, or reconcile an external viewer cache.

## Preconditions

- the user or system is authorised
- the report and study have been published
- retrieval endpoints are reachable

## Postconditions

- report content can be read
- study metadata can be searched and retrieved
- image retrieval can be launched or consumed through DICOMweb or viewer mechanisms
- optional packaged report documents can be discovered where document sharing is in scope

## Source of truth

The reporting system is the source of truth for report content. The archive is the source of truth for image availability and retrieval. The RIS remains the workflow authority for direct-RIS synchronisation payloads.

## Sequence summary

1. Consumer searches or reads `DiagnosticReport`, `ImagingStudy`, and, where relevant, `DocumentReference`.
2. Consumer resolves study identifiers, series metadata, and linked `Endpoint` resources.
3. Consumer retrieves images or launches a viewer using the agreed endpoint pattern.
4. Optional direct-RIS consumers may use standard searches or the preserved `$impacs-ris-sync` operation for scheduled synchronisation windows.

## FHIR artefacts involved

- `DiagnosticReport`
- `ImagingStudy`
- `Endpoint`
- optional `DocumentReference`
- optional `List`
- optional `$impacs-ris-sync`

## DICOM or DICOMweb transactions involved

- `QIDO-RS`
- `WADO-RS`
- rendered retrieval where supported

## IHE profile context

Supports local viewing, future cross-enterprise display patterns, and document-sharing discovery where MHD is deployed.

## Required data elements

- report identifier
- study identifier and `StudyInstanceUID`
- modality and series summary
- WADO-RS retrieval endpoint with `connectionType = dicom-wado-rs`
- retrieval endpoint or viewer launch context where exposed
- packaged document metadata where document sharing is in scope

## Status transitions

There is no primary workflow status transition in this chapter beyond access logging and normal report lifecycle consumption.

## Acknowledgements or response expectations

Consumers should receive stable read and retrieval responses and clear errors when access is denied or content is unavailable.

## Errors or edge cases

- report available before images are retrievable
- study metadata published without complete series details
- temporary retrieval failure from the archive
- viewer launched without sufficient patient context
- direct-RIS response contains a study but not a final report yet

## Security and audit considerations

Viewer and retrieval access must enforce patient confidentiality, support audit logging, and avoid leaking direct archive endpoints without appropriate control.

## Test assertions

- a consumer can read a report and follow its imaging study linkage
- a consumer can resolve `ImagingStudy.endpoint` to a WADO-RS `Endpoint`
- a valid study identifier can be used to retrieve study metadata
- optional direct-RIS retrieval supports correct time-window filtering
- retrieval failures return clear and safe error behaviour

## Implementation notes

The national pattern favours stable identifier-based retrieval rather than ad hoc URL conventions embedded in local applications.

When `ImagingStudy.status = available`, the study metadata should expose at least one `Endpoint` carrying the WADO-RS base address and the published series summary needed by viewers.

### Optional direct-RIS retrieval pattern

The preserved RadioConnect pattern remains visible as an optional implementation approach.

```text
Direct retrieval consumer
  -> standard search or optional $impacs-ris-sync
RIS
  -> optional PACS metadata query
RIS
  -> searchset Bundle with Patient, Practitioner, Location, ServiceRequest, ImagingStudy, DiagnosticReport
Consumer
  -> validation, reconciliation, and local persistence
```

The numbered interaction flow is:

1. The consumer initiates a scheduled retrieval window.
2. The RIS determines the matching orders, studies, and reports.
3. The RIS may query PACS or archive services for additional image metadata.
4. The RIS returns a FHIR `Bundle`.
5. The consumer validates profile conformance and identifier linkage.
6. The consumer reconciles the results with local state and awaits the next window.

## Open issues or local decisions pending

- the final national viewer launch pattern is `TO BE CONFIRMED`
- whether rendered retrieval is mandatory in sandbox is `TO BE CONFIRMED`
- whether the optional direct-RIS operation is retained beyond early partner deployments remains `TO BE CONFIRMED`

## Related Pages

- [Workflow Summary](workflow-summary.html)
- [FHIR Artefacts](fhir-artefacts.html)
- [Technical Annexes](annexes.html)
- Maintained source markdown: [docs/04-workflows/07-viewing-and-retrieval.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/04-workflows/07-viewing-and-retrieval.md)
