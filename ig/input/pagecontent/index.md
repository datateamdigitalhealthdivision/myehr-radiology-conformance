# Malaysian National Radiology Interoperability And Conformance Guide

This publication is issued as the draft computable FHIR R4 core of the Malaysian national radiology interoperability and conformance repository. It is intended to support implementation partners, integrators, and policy stakeholders working to a common national radiology exchange model.

## How this publication should be used

- read the [National Overview](overview.html) for the architectural position and normative stack
- read the [National Chapters](national-chapters.html) and [Workflow Summary](workflow-summary.html) for operational, governance, and workflow expectations
- use the [FHIR Artefacts](fhir-artefacts.html) and [Artefact Index](artifacts.html) for profiles, examples, capability statements, value sets, code systems, naming systems, and optional operations
- use the [Document Sharing](document-sharing.html) page for IHE MHD, XDS-aligned metadata, SubmissionSet handling, and document query or retrieval expectations
- use [Notifications And Polling](notifications.html), [Terminology And Identifiers](terminology.html), [Security And Audit](security.html), and [Conformance Testing](testing.html) to align implementation detail
- use [Downloads](downloads.html) for package consumption and publication pointers

## One-repository architecture

This guide does not stand alone as a separate radiology specification. It is the computable FHIR core of one national repository in which:

- FHIR provides the computable interface layer for orders, workflow state, imaging metadata, reports, document sharing, and conformance testing
- DICOM and DICOMweb remain the normative mechanisms for imaging acquisition, storage, retrieval, and archive exchange
- IHE Radiology and IHE MHD patterns continue to describe workflow choreography and cross-enterprise sharing expectations
- optional direct-RIS retrieval patterns such as the preserved RadioConnect synchronisation model are documented openly without displacing the national baseline of standard FHIR read and search interactions
- national governance, workflow, security, testing, and procurement chapters remain in the same repository

## Repository sources

- [Repository root](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance)
- [National chapters in `docs/`](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/docs)
- [Workflow chapters in `docs/04-workflows/`](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/docs/04-workflows)
- [Technical annexes in `annexes/`](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/annexes)
- [Tests in `tests/`](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/tests)
- [Mappings in `mappings/`](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/tree/main/mappings)

## Draft notice

National identifier URIs, operational endpoints, some deployment policies, and several cross-enterprise infrastructure assignments remain `PROVISIONAL` or `TO BE CONFIRMED`. Those areas are marked explicitly rather than being presented as settled policy.
