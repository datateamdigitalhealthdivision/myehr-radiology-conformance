# FHIR IG Build Notes

This directory contains the computable core of the Malaysian radiology interoperability and conformance repository.

## Package details

- Canonical root: `https://myehr.kkmhub.moh.gov.my/fhir/ImplementationGuide/my-radiology`
- Package ID: `my.moh.kkmhub.myehr.radiology`
- FHIR version: `4.0.1`
- Initial version: `0.1.0`
- Policy target dependency: `MY Core v1.0.1`
- Current published build dependency source: `hl7.fhir.uv.mycore#1.0.0` from `https://mysejahtera.malaysia.gov.my/ig-mycore/en/` as observed on 18 March 2026

## What this IG contains

- radiology-specific FHIR profiles for order, workflow, imaging study, reporting, and structured finding exchange
- capability statements for the main actor roles
- terminology placeholders, bindings, and naming system scaffolds
- example instances aligned to the profiles

Generic resources such as Patient, Encounter, Practitioner, Organisation, and Location should continue to use MY Core or base R4 patterns where possible.

## Local build

Recommended prerequisites:

- Java 17 or later
- Node.js 20 or later
- Ruby 3.3 or later with `jekyll` available on `PATH` for full HTML rendering
- internet access to download the IG Publisher and package dependencies if they are not already cached

Example local flow:

```bash
cd fhir-ig
npm install
npm run validate
npm run build
```

Windows PowerShell alternative:

```powershell
cd fhir-ig
npm install
npm run validate:ps
npm run build:ps
```

The bundled npm dependency is included to make local SUSHI use more reproducible. The shell scripts are Bash-based and are exercised by the GitHub Actions workflows on Ubuntu runners.
The IG is pinned to a repo-local publication template snapshot under `local-template` so builds do not depend on the remote template registry resolving `current` consistently.
The rendered website step uses Jekyll. The GitHub Actions workflows install Ruby and Jekyll automatically; local Windows builds should do the same before running `npm run build:ps`.
If a workspace-local RubyInstaller+Devkit is present under `tools/` and gems are installed under `tools/ruby-home/gems`, `build.ps1` will auto-detect that toolchain.
The repository also includes a vendored MY Core `1.0.0` snapshot sourced from the official publication endpoint so that builds do not depend on the external FHIR package registry serving that package correctly.

## Key profiles

- `MYRadiologyServiceRequest`
- `MYRadiologyTask`
- `MYRadiologyAppointment`
- `MYRadiologyProcedure`
- `MYRadiologyImagingStudy`
- `MYRadiologyDiagnosticReport`
- `MYRadiologyObservation`
- `MYRadiologyDocumentReference`

## Example artefacts

Examples are under `input/fsh/examples` and are intended to show:

- an imaging order
- workflow tracking state
- a scheduled appointment
- a performed procedure
- published imaging metadata
- a radiology report and optional structured finding

## Package consumption notes

Vendors should be able to:

- load the package into local validation tooling
- inspect the generated `StructureDefinition`, `ValueSet`, `CodeSystem`, and `CapabilityStatement` resources
- use examples to stand up sandbox-aligned server behaviour

## Provisional points to review

- the production distribution path for MY Core v1.0.1 should be confirmed
- the official MY Core publication currently exposes `1.0.0`, so uplift to the policy target `1.0.1` remains `TO BE CONFIRMED`
- identifier URIs and operational endpoint roots remain provisional unless explicitly approved
- local hosting strategy for mirrored RadLex terminology is scaffolded but not final
