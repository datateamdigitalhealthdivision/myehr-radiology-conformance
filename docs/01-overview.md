# 01 Overview

## Purpose

This repository defines the first draft of a national radiology interoperability and conformance specification for Malaysia. It provides:

- a partner-consumable FHIR R4 implementation guide
- workflow and conformance chapters covering the broader imaging ecosystem
- test and example assets to support implementation and future national validation
- document-sharing and direct-retrieval guidance preserved in the same repository rather than as separate side specifications

## Architectural position

The repository adopts a layered model.

- FHIR R4 is the computable exchange and conformance layer for orders, workflow state, imaging metadata, reports, document sharing, and system capability declarations.
- MY Core v1.0.1 is reused for common Malaysian resource patterns unless a radiology-specific constraint is required.
- DICOM and DICOMweb remain the normative mechanisms for image acquisition, storage, and retrieval.
- IHE Radiology profiles provide the expected choreography for operational workflow, especially Scheduled Workflow.
- IHE MHD provides the preferred FHIR-native document-sharing bridge where XDS-aligned cross-enterprise exchange is required.
- Preserved direct-RIS retrieval patterns such as the RadioConnect synchronisation model may be used by implementation partners where operationally justified, but they do not replace the national baseline of standard FHIR read and search interactions.

## Scope

The initial scope covers:

- imaging order placement and order state synchronisation
- optional scheduling and appointment exchange
- worklist distribution and acquisition progress
- performed procedure and imaging study metadata publication
- radiology report distribution and structured findings where appropriate
- viewer retrieval and optional direct-RIS synchronisation
- document sharing, including MHD-aligned SubmissionSet and DocumentReference exchange
- national guidance on identifiers, terminology, security, and conformance testing

## Out of scope for the first draft

The following are intentionally out of scope or only lightly scaffolded:

- full production IAM design beyond SMART on FHIR and trust assumptions
- detailed DICOM node configuration for each partner product class
- executable national certification tooling
- local MOH terminology code systems not yet approved
- final national OID allocations for document-sharing infrastructure identifiers

## Normative stack

- FHIR R4 only
- MY Core v1.0.1 for common resource reuse
- DICOM and DICOMweb
- IHE Radiology profiles
- IHE MHD for FHIR-native document sharing
- National policies defined in this repository where local choices are required

## Publication intent

This repository is intended to publish first to GitHub Pages and GitHub Releases, then later be linked from an official Ministry of Health web presence. Implementation partners should be able to consume either the rendered guide or the downloadable package.
