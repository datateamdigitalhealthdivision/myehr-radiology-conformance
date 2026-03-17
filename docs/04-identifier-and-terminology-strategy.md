# 04 Identifier And Terminology Strategy

## Purpose

This chapter defines the draft national strategy for identifiers, terminology bindings, and terminology service assumptions for the radiology domain.

## Identifier principles

- distinguish the identifier system URI from the identifier value itself
- distinguish operational minting authority from user-facing display format
- keep system URIs stable even if visible formatting rules evolve
- avoid inventing final national roots before approval

## National identifier domains

### Patient identifier domain

- Intended future domain relationship: `myhrn.kkmhub.moh.gov.my`
- Status: `PROVISIONAL`
- Use in this repository: placeholder naming system and example-only system URI until the final policy is approved

### Facility identifier domain

- Intended future domain relationship: `facility.kkmhub.moh.gov.my`
- Status: `PROVISIONAL`

### Healthcare worker identifier domain

- Intended future domain relationship: `myhcw.kkmhub.moh.gov.my`
- Status: `PROVISIONAL`

## Accession identifier strategy

Accession identifiers are not yet nationally fixed. This repository documents three patterns.

### Candidate A

`FACILITYCODE-YYYYMMDD-SEQUENCE`

- Advantages: human-readable, easy to mint locally, easy to communicate operationally
- Risks: collision if sequence governance is weak, no modality hint

### Candidate B

`FACILITYCODE-MODALITY-YYYYMMDD-SEQUENCE`

- Advantages: more operationally readable, supports local troubleshooting
- Risks: modality can change during workflow, format is longer, modality code normalisation becomes a policy issue

### Candidate C

centrally minted UUID with a human-readable alias

- Advantages: strongest global uniqueness
- Risks: more operational complexity and weaker manual usability if central services are unavailable

### Recommended draft approach

`DRAFT POLICY OPTION`: use Candidate A for sandbox and early local deployments, with a stable identifier system URI per issuing organisation and an optional human-friendly alias if needed. This is pragmatic, supports facility-level generation, and avoids embedding mutable modality semantics in the primary identifier.

## Terminology policy

The following terminology families are in scope:

- RadLex as the preferred current basis for imaging procedure catalogues
- SNOMED CT for findings, procedures, anatomy, and clinical meaning where licensed and available
- LOINC for report and observation coding where suitable
- UCUM for quantitative units
- ICD-10 and ICD-10-PCS where operationally required
- ICD-11 via WHO API for classification use cases
- ICD-9-CM and ICHI where legacy or programme-specific mappings are needed
- DICOM code systems for modality, procedure, and image metadata alignment

No local MOH code systems are defined in this first draft.

## Terminology hosting assumptions

- Primary on-premise terminology service root: `https://terminology.kkmhub.moh.gov.my`
- ICD-11 external source: WHO API
- RadLex local hosting: `PROVISIONAL`, expected to be mirrored on-premise later

## Provisional endpoint placeholders

These are example endpoint roots only and are not final production decisions.

| Purpose | Placeholder |
| --- | --- |
| Terminology server | `https://terminology.kkmhub.moh.gov.my` |
| FHIR sandbox base | `https://sandbox.myehr.kkmhub.moh.gov.my/fhir/r4` |
| SMART metadata | `https://sandbox-auth.myehr.kkmhub.moh.gov.my/.well-known/smart-configuration` |
| Validation endpoint | `https://validation.myehr.kkmhub.moh.gov.my/fhir` |
| DICOMweb base | `https://sandbox-imaging.myehr.kkmhub.moh.gov.my/dicomweb` |

## Binding strategy summary

- orderable imaging procedures: RadLex preferred, SNOMED CT or local mapping support allowed where needed
- report code and section semantics: LOINC and SNOMED CT as appropriate
- quantitative measurements: LOINC plus UCUM
- diagnosis and indication coding: SNOMED CT, ICD-10, or ICD-11 depending on the use case
- modality and imaging metadata: DICOM code systems

## Open issues

- Final package and hosting path for MY Core v1.0.1 should be confirmed for production validator pipelines.
- Final accession identifier issuing authority is `TO BE CONFIRMED`.
- The national URI policy for provisional identifier systems is `TO BE CONFIRMED`.

