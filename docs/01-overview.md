# 01 Overview

## Purpose

This repository defines the first draft of a national radiology interoperability and conformance specification for Malaysia. It provides:

- a vendor-consumable FHIR R4 implementation guide
- workflow and conformance chapters covering the broader imaging ecosystem
- test and example assets to support implementation and future national validation

## Architectural position

The repository adopts a layered model.

- FHIR R4 is the computable exchange and conformance layer for orders, workflow state, imaging metadata, reports, and system capability declarations.
- MY Core v1.0.1 is reused for common Malaysian resource patterns unless a radiology-specific constraint is required.
- DICOM and DICOMweb remain the normative mechanisms for image acquisition, storage, and retrieval.
- IHE Radiology profiles provide the expected choreography for operational workflow, especially Scheduled Workflow and future cross-enterprise exchange options.

## Scope

The initial scope covers:

- imaging order placement and order state synchronisation
- optional scheduling and appointment exchange
- worklist distribution and acquisition progress
- performed procedure and imaging study metadata publication
- radiology report distribution and structured findings where appropriate
- viewer retrieval and cross-enterprise sharing patterns
- national guidance on identifiers, terminology, security, and conformance testing

## Out of scope for the first draft

The following are intentionally out of scope or only lightly scaffolded:

- full production IAM design beyond SMART on FHIR and trust assumptions
- detailed DICOM node configuration for each vendor product class
- executable national certification tooling
- local MOH terminology code systems not yet approved

## Normative stack

- FHIR R4 only
- MY Core v1.0.1 for common resource reuse
- DICOM and DICOMweb
- IHE Radiology profiles
- National policies defined in this repository where local choices are required

## Publication intent

This repository is intended to publish first to GitHub Pages and GitHub Releases, then later be linked from an official Ministry of Health web presence. Vendors should be able to consume either the rendered guide or the downloadable package.

