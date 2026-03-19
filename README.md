# MYEHR Radiology Conformance Repository

This repository is the draft content for the national Malaysian radiology interoperability and conformance specification published under `github.com/datateamdigitalhealthdivision/myehr-radiology-conformance`.

It is deliberately organised as one repository:

- the FHIR R4 implementation guide in [`/ig`](./ig) is the computable core for partner consumption
- the national conformance chapters in [`/docs`](./docs) describe governance, actor responsibilities, workflow expectations, security, testing, and procurement language
- the narrative technical annexes in [`/annexes`](./annexes) capture DICOM, DICOMweb, IHE, XDS-I, and transition guidance in the same repository
- the test assets and mapping notes in [`/tests`](./tests) and [`/mappings`](./mappings) support implementation, onboarding, and future conformance validation

## Normative position

The normative stack for this repository is:

- FHIR R4 only
- MY Core v1.0.1 for common Malaysian profiles unless a radiology-specific constraint is needed
- DICOM and DICOMweb for acquisition, storage, and retrieval
- IHE Radiology profiles for workflow choreography

Reference patterns from other jurisdictions may inform structure, publication approach, or governance style, but they are not the normative basis for Malaysia.

## What is normative vs illustrative

Normative or intended-to-be normative material in this repository includes:

- the local radiology FHIR profiles, value sets, code systems, examples, and capability statements in [`/ig`](./ig)
- the workflow, governance, security, terminology, and conformance chapters in [`/docs`](./docs)
- the DICOM, DICOMweb, IHE, and XDS-I narrative annexes in [`/annexes`](./annexes)

Illustrative or scaffolding material includes:

- example payloads and sample Bundles used to help partners implement and test
- draft procurement wording in [`/docs/07-procurement-language.md`](./docs/07-procurement-language.md)
- provisional placeholders where national identifiers, endpoints, or operational policies are not yet fixed

Provisional items are marked explicitly as `PROVISIONAL`, `TO BE CONFIRMED`, `EXAMPLE ONLY`, or `DRAFT POLICY OPTION`.

## Repository architecture

This repository follows a one-repo architecture on purpose.

- FHIR is the computable interface layer for orders, workflow state, imaging metadata, reports, and conformance testing.
- DICOM and DICOMweb remain the normative imaging transport and retrieval layers.
- IHE profiles remain the workflow choreography pattern for radiology operations.
- The FHIR IG does not replace DICOM or IHE; it complements them.

## Canonical and package details

- Canonical root: `https://myehr.kkmhub.moh.gov.my/fhir/ImplementationGuide/my-radiology`
- Package ID: `my.moh.kkmhub.myehr.radiology`
- FHIR version: `4.0.1`
- Intended release starting point: `0.1.0`
- Policy target dependency: `MY Core v1.0.1`

Build note:

- The official MY Core publication endpoint provided for this repository, `https://mysejahtera.malaysia.gov.my/ig-mycore/en/`, advertises package `hl7.fhir.uv.mycore#1.0.0` as of 18 March 2026. This repository keeps the policy target of `v1.0.1` explicit, but uses the published package line for build verification until the endpoint exposes `v1.0.1`.

## Intended publication model

- GitHub Pages is the first publication channel.
- GitHub Releases should retain packaged IG artefacts for implementation partners.
- The rendered guide is expected to be linked from the official Ministry of Health site later.

## Partner consumption model

Implementation partners are expected to use this repository in four ways:

1. Read the narrative conformance chapters to understand national workflow, security, and interoperability expectations.
2. Download the FHIR package from a release artefact and load it into a FHIR-capable validation or server toolchain.
3. Inspect the examples and capability statements to understand actor-specific expectations.
4. Use the tests and sample Bundles as a starting point for local integration testing and later national conformance testing.

## Local build

The FHIR IG is built with FSH and SUSHI, then rendered with the FHIR IG Publisher and Jekyll.

Typical local steps:

```bash
cd ig
npm install
npm run validate
npm run build
```

Windows PowerShell alternative:

```powershell
cd ig
npm install
npm run validate:ps
npm run build:ps
```

This repository also includes helper scripts in [`/ig/scripts`](./ig/scripts) and GitHub Actions workflows in [`.github/workflows`](./.github/workflows).
To keep builds reproducible, the repository bundles a slim MY Core snapshot from the official publication endpoint and seeds the local FHIR package cache before running SUSHI.
The repository also carries a pinned local publication template snapshot in [`/ig/local-template`](./ig/local-template) so that site rendering does not depend on the template registry resolving `current` at build time.
For a full local HTML render, Ruby plus Jekyll must also be installed. The GitHub Actions workflows provision Jekyll automatically for CI and GitHub Pages publication.

## Published site and package use

Once GitHub Pages is enabled, implementation partners should be able to:

- browse the rendered guide
- inspect profile snapshots and examples
- download the packaged artefacts from release assets
- use the CapabilityStatements to configure client and server behaviour

## Provisional areas in this first draft

The following areas are intentionally scaffolded and clearly marked as provisional:

- national identifier system URIs and operational value formats
- accession identifier policy and final minting authority
- final SMART on FHIR authorisation endpoints and scopes
- production DICOMweb hostnames and validation service endpoints
- any future local MOH code systems

## Repository layout

```text
/
|- README.md
|- AGENTS.md
|- docs/
|- annexes/
|- ig/
|- tests/
|- mappings/
`- .github/
```

## Suggested next actions after this draft

- confirm the final MY Core publication source and package distribution path for production builds
- confirm national identifier authorities and URI policy
- confirm which IHE cross-enterprise options are mandatory in phase 1 versus later phases
- expand the test pack into executable validation suites
