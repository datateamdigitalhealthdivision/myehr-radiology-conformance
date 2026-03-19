# 02 Governance And Scope

## Governance intent

This repository is designed for national stewardship, not for one-off project delivery. It should support:

- transparent change control
- clear separation between settled requirements and provisional placeholders
- traceable decisions for implementation partners, procurers, and policy leads

## Governance model

The expected governance pattern is:

- a national standards owner approves policy and conformance direction
- a technical editorial group curates the IG, annexes, and test assets
- implementation partners and implementation sites raise issues through repository-based change requests
- major design changes are reflected in the maintained governance chapters and release notes

## Scope control

Change proposals should be assessed against three questions:

1. Does the change support a real national workflow or conformance need?
2. Can the need be met by reusing MY Core or base FHIR rather than inventing new structures?
3. Does the change preserve the one-repo architecture and the separation between computable FHIR artefacts and broader imaging workflow documentation?

## Provisional policy handling

Where a national decision is not final:

- document the decision gap openly
- choose a practical draft that enables sandbox implementation
- avoid presenting placeholder identifiers or endpoints as if they were production decisions
- record follow-up decisions in chapter-level open issues and release notes

## Conformance levels

This draft supports three practical conformance views:

- `Core mandatory`: requirements needed for any implementation partner claiming alignment to the national radiology FHIR layer
- `Conditional mandatory`: requirements that apply when an implementation partner implements the relevant workflow function, such as scheduling or viewer retrieval
- `Future or optional`: capabilities scaffolded for later maturity, including some cross-enterprise sharing patterns

## Identifier policy summary

The national identifier strategy in this draft follows four principles:

- distinguish the identifier system URI from the identifier value itself
- distinguish operational minting authority from user-facing display format
- keep system URIs stable even if visible formatting rules evolve
- avoid inventing final national roots before approval

The intended future domain relationships remain `PROVISIONAL`:

- patient identifiers: `myhrn.kkmhub.moh.gov.my`
- facility identifiers: `facility.kkmhub.moh.gov.my`
- healthcare worker identifiers: `myhcw.kkmhub.moh.gov.my`

Accession identifiers are not yet nationally fixed. This repository keeps three candidate patterns in scope and recommends `FACILITYCODE-YYYYMMDD-SEQUENCE` as the pragmatic sandbox draft because it supports facility-level generation, uniqueness, and operational traceability without depending on central minting.

## Terminology and endpoint policy summary

The terminology position in this draft is:

- RadLex is the preferred current basis for imaging procedure catalogues
- SNOMED CT, LOINC, UCUM, ICD-10, ICD-11, ICD-10-PCS, ICD-9-CM, ICHI, and DICOM code systems are in scope
- no local MOH code systems are defined in this first draft

Terminology hosting assumptions remain `PROVISIONAL`:

- primary on-premise terminology service root: `https://terminology.kkmhub.moh.gov.my`
- ICD-11 source: WHO API
- RadLex local hosting: expected later through a local mirror

Operational endpoint placeholders remain example-only until nationally approved, including the FHIR sandbox base, SMART metadata endpoint, validation endpoint, and DICOMweb base.

## Release and versioning policy

This repository uses a practical semantic versioning model starting at `0.1.0`.

- `main` is the active working branch
- continuous integration builds every change
- tagged milestone versions are published as Git tags and GitHub Releases
- the FHIR package version matches the repository release version

Before creating a tagged release:

- the FHIR IG must build successfully
- example artefacts and CapabilityStatements must be in sync with profiles
- key narrative chapters and annexes must reflect the shipped artefacts
- known provisional items must be clearly marked

## Document maintenance

When computable artefacts change, the corresponding narrative chapters, annexes, examples, and tests must be updated in the same pull request. Drift between profiles and prose is considered a quality defect.
