# 02 Scope And Governance

## Governance intent

This repository is designed for national stewardship, not for one-off project delivery. It should support:

- transparent change control
- clear separation between settled requirements and provisional placeholders
- traceable decisions for vendors, procurers, and policy leads

## Governance model

The expected governance pattern is:

- a national standards owner approves policy and conformance direction
- a technical editorial group curates the IG, annexes, and test assets
- vendors and implementation sites raise issues through repository-based change requests
- significant design changes are recorded in architecture decision records

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
- record follow-up decisions in ADRs or chapter-level open issues

## Conformance levels

This draft supports three practical conformance views:

- `Core mandatory`: requirements needed for any vendor claiming alignment to the national radiology FHIR layer
- `Conditional mandatory`: requirements that apply when a vendor implements the relevant workflow function, such as scheduling or viewer retrieval
- `Future or optional`: capabilities scaffolded for later maturity, including some cross-enterprise sharing patterns

## Document maintenance

When computable artefacts change, the corresponding narrative chapters, examples, and tests must be updated in the same pull request. Drift between profiles and prose is considered a quality defect.

