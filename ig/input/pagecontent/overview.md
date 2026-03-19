# National Overview

## Purpose

This implementation guide profiles the radiology-specific FHIR-facing layer for Malaysia while reusing MY Core for common Malaysian resource patterns wherever possible. It is intended to be consumed together with the repository-level workflow and annex material.

## Normative stack

- FHIR R4 only
- MY Core as the national baseline for common resources, with policy intent aligned to `v1.0.1`
- DICOM and DICOMweb for acquisition, storage, retrieval, and archive interoperability
- IHE Radiology patterns for operational choreography

## Core FHIR artefacts

- `ServiceRequest` for the imaging order
- `Task` for workflow state synchronisation between partner systems
- `Appointment` for booking and scheduling where exposed
- `Procedure` for the performed imaging act
- `ImagingStudy` for study-level metadata linked to DICOM identifiers
- `DiagnosticReport` for report exchange
- `Observation` for structured findings or quantitative measurements where needed
- `DocumentReference` for packaged report sharing scenarios

## What is normative in this publication

- the local radiology FHIR profiles and examples
- the published CapabilityStatements
- the published value sets, code systems, and naming systems
- the workflow, security, testing, and annex guidance maintained in the same repository

## What remains provisional

- final production endpoint roots for FHIR, SMART on FHIR, DICOMweb, and validation services
- final national identifier system URIs and minting authorities
- final national terminology hosting policy for local mirrors and future local code systems
- future cross-enterprise functions that depend on additional national policy decisions

## Relationship to the wider repository

The broader national conformance chapters remain authoritative and are maintained in the same repository:

- [National Chapters](national-chapters.html)
- [Workflow Summary](workflow-summary.html)
- [Technical Annexes](annexes.html)
- [FHIR Artefacts](fhir-artefacts.html)
