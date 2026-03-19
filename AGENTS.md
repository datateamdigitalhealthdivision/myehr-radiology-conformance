# AGENTS.md

Future coding agents working in this repository must preserve the following architectural and editorial rules.

## Core architecture

- Preserve the one-repository architecture.
- Treat the FHIR implementation guide as the computable core.
- Treat DICOM, DICOMweb, IHE, XDS-I.b, XCA-I, and related workflow material as narrative annexes and workflow chapters in the same repository.
- Do not split the repository into separate FHIR, DICOM, or IHE projects.

## FHIR profiling rules

- Remain fully compatible with FHIR R4.
- Derive from MY Core v1.0.1 for generic resources whenever possible.
- Do not duplicate generic MY Core profiles for Patient, Encounter, Practitioner, PractitionerRole, Organisation, Location, Device, or similar common resources unless there is a genuine radiology-specific need.
- Prefer constraints, bindings, cardinality changes, and must-support declarations over new extensions.
- Keep local extensions narrow, justified, and clearly documented.
- Every new profile must have at least one example instance.
- Every example must validate conceptually against the profile it claims to illustrate.
- Update CapabilityStatements whenever supported profiles or interactions change.

## Documentation rules

- Use British spelling throughout.
- Keep the repository partner-facing and implementer-friendly.
- When profiles change, update the narrative documentation in `/docs`, `/annexes`, and the IG page content in `/ig/input/pagecontent`.
- Ensure workflow chapters cross-reference the relevant FHIR artefacts and annexes.
- Explain provisional areas openly rather than presenting them as settled national policy.
- Use the placeholder markers `PROVISIONAL`, `TO BE CONFIRMED`, `EXAMPLE ONLY`, and `DRAFT POLICY OPTION` consistently.

## Example and testing rules

- Keep examples synchronised with profiles and terminology bindings.
- Keep the test scenarios in `/tests` aligned with the current workflow chapters and CapabilityStatements.
- Add negative examples when introducing new validation-sensitive rules.
- If a workflow chapter describes a status transition, ensure at least one example or test asset demonstrates it.

## CI and publication rules

- Keep GitHub Pages publication working from the rendered IG output.
- Preserve the one-repo structure with top-level `/docs` and `/annexes`, while keeping `/ig` as the computable package source.
- Retain release artefacts that implementation partners can download as packages.
- Do not remove package metadata, canonical URLs, or package-list behaviour without updating the release notes and governance content.

## Editorial intent

- Optimise for clarity, credibility, and practical implementability.
- Keep explanatory comments brief and high-signal.
- Prefer clear TODO markers over hidden assumptions.
- When uncertain about a national operational detail, scaffold the best draft and document the decision gap.
