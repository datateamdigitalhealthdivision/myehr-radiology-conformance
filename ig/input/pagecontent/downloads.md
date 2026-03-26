# Downloads

## Intended publication outputs

Implementation partners should be able to obtain:

- the rendered guide from GitHub Pages
- the FHIR package from GitHub Releases once tagged releases are published
- machine-readable profiles, value sets, code systems, naming systems, examples, and capability statements from the repository

## Recommended consumption sequence

1. Read the rendered guide, especially [FHIR Artefacts](fhir-artefacts.html), [Implementation Partner Guide](implementation-partner-guide.html), [Workflow Summary](workflow-summary.html), and [Security And Audit](security.html).
2. Download or inspect the package artefacts and load them into validation or server tooling.
3. Review the examples and workflow bundle to understand the expected payload shape.
4. Apply the relevant CapabilityStatement to the partner system role being implemented.
5. Use the repository test assets to begin local conformance checking.

## Publication locations

- [GitHub repository](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance)
- [GitHub releases](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/releases)
- [Artefact Index](artifacts.html)

## Publication history note

The canonical root for this guide has already been set by national architectural decision as `https://myehr.kkmhub.moh.gov.my/fhir/ImplementationGuide/my-radiology`. During the current GitHub Pages publication phase, version history is still exposed through the repository publication path while the future official canonical host is being prepared to carry the same publication assets.

Implementation partners should therefore treat the GitHub Pages site as the active rendered publication for draft versions, while preserving the authoritative canonical URLs embedded in the artefacts.

## Package note

The package identifier for this guide is `my.moh.kkmhub.myehr.radiology`. The package is intended for validation, implementation alignment, and later conformance testing.

## Technical publication metadata

The standard publisher metadata fragments below are included so that implementation partners can inspect dependency, intellectual-property, and cross-version publication detail directly from the rendered guide.

### Intellectual property statements

{% include ip-statements.xhtml %}

### Dependency table

{% include dependency-table.xhtml %}

### Global profiles table

{% include globals-table.xhtml %}

### Cross-version analysis

{% include cross-version-analysis.xhtml %}

## R4 implementation note

Some generated publication artefacts may show R5-flavoured extension metadata inserted by the IG Publisher, especially around `NamingSystem` presentation fields such as `version` or `url`. These publication-time decorations do not change the normative requirement that this guide remains a FHIR R4 implementation guide.
