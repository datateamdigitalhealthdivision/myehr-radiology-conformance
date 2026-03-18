# DICOM Annex

## Role of DICOM in the national stack

DICOM remains the normative imaging transport and metadata standard for acquisition, storage, and archive interoperability. The FHIR implementation guide in this repository does not replace DICOM. It provides the outward-facing workflow, metadata, and conformance layer that vendors can consume more easily for national integration.

## Core conformance expectations

The first draft expects implementations to support the DICOM functions relevant to their role:

- Modality Worklist for work item distribution to modalities
- Modality Performed Procedure Step for acquisition status communication
- image storage to PACS or VNA
- storage commitment where supported or mandated locally

## Identifier alignment expectations

Implementers should maintain consistent linkage between:

- accession identifier and the order workflow
- `StudyInstanceUID` and the published `ImagingStudy`
- patient identifiers used operationally and patient references exposed through FHIR

Formatting conveniences must not alter the underlying identifier value.

## Operational policy notes

- AE titles, node names, and network routes are deployment-specific and `TO BE CONFIRMED` nationally
- transfer syntax policy is out of scope for this first draft
- image lifecycle and retention remain subject to local and national policy outside this repository

## Relationship to workflow chapters

- order and worklist preparation: [`../workflows/03-worklist-distribution.md`](../workflows/03-worklist-distribution.md)
- acquisition status: [`../workflows/04-acquisition-and-status.md`](../workflows/04-acquisition-and-status.md)
- storage and archive confirmation: [`../workflows/05-storage-and-commitment.md`](../workflows/05-storage-and-commitment.md)
