# National Chapters

The formal narrative chapters of the Malaysian radiology conformance repository remain part of the same publication set as this FHIR guide. They provide governance, scope, actor, security, testing, document-sharing, and procurement context that the computable artefacts alone do not replace.

## Chapter directory

| Chapter | Purpose | Repository source |
| --- | --- | --- |
| Overview | Establishes national purpose, architectural position, scope, and publication intent. | [docs/01-overview.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/01-overview.md) |
| Governance And Scope | Sets governance principles, conformance levels, placeholder policy, identifier policy summary, and release expectations. | [docs/02-governance-and-scope.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/02-governance-and-scope.md) |
| Actor Model | Describes the main actor roles and the responsibility boundaries between systems. | [docs/03-actor-model.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/03-actor-model.md) |
| Security And Audit | States OAuth2, SMART on FHIR, trust assumptions, and audit expectations. | [docs/05-security-and-audit.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/05-security-and-audit.md) |
| Conformance Testing | Defines the initial national test model, assertions, and actor-focused checks. | [docs/06-conformance-testing.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/06-conformance-testing.md) |
| Procurement Language | Provides `EXAMPLE ONLY` wording for implementation and procurement documentation. | [docs/07-procurement-language.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/07-procurement-language.md) |
| Notification Patterns | Describes the current polling-based phase 1 approach, optional direct-RIS synchronisation, and future eventing direction. | [docs/08-notification-patterns.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/08-notification-patterns.md) |
| Document Sharing And Direct Retrieval | Brings together MHD, XDS-aligned metadata, document identity, and preserved RadioConnect retrieval guidance. | [docs/09-document-sharing-and-direct-retrieval.md](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/docs/09-document-sharing-and-direct-retrieval.md) |

## Relationship to the rendered guide

- The rendered IG pages summarise the national position for implementers.
- The repository chapter files remain the maintained markdown source for detailed narrative policy text.
- Workflow chapters and technical annexes are published separately because they span FHIR, DICOM, DICOMweb, IHE, MHD, XDS-I, and transition material.
