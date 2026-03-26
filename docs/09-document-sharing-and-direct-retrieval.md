# 09 Document Sharing And Direct Retrieval

## Purpose

Bring together the first-draft national position on document sharing and preserved direct-RIS retrieval patterns in one narrative chapter.

## Document sharing position

The preferred FHIR-native approach for cross-enterprise report document exchange is IHE MHD.

- `DocumentReference` carries the radiology document metadata
- `List` carries the SubmissionSet
- `Binary` carries the document payload where needed
- `DocumentReference.content.format` should use the published IHE format codes, for example `urn:ihe:rad:PDF` with display `RAD PDF` for packaged PDF reports
- `AuditEvent` carries the FHIR-based audit evidence

The MHD layer may operate as a standalone FHIR service or as a bridge to backend XDS.b infrastructure.

## Direct-RIS retrieval position

The preserved RadioConnect pattern remains visible for implementation partners that require scheduled synchronisation directly from a RIS.

- the national baseline remains standard FHIR `read` and `search-type`
- the optional `$impacs-ris-sync` operation may be used where both parties agree
- the pattern should be treated as a partner-specific operational mode, not as the only nationally valid retrieval mechanism
- returned direct-retrieval bundles should be self-resolving and include the referenced supporting resources needed for consumers to process them without follow-up lookups

## Shared identity and identifier considerations

- patient identity should use the national patient identifier wherever possible
- accession linkage remains critical for order-to-study reconciliation
- document unique identifiers, source identifiers, and related OIDs remain `PROVISIONAL`
- deployments that bridge to XDS infrastructure must document how identifiers are minted and governed

## Relationship to testing

Conformance testing should preserve both patterns:

- MHD document submission and retrieval tests
- direct-RIS synchronisation and reconciliation tests

This chapter should be read together with the workflow chapters, the Document Sharing page in the rendered guide, and the source-preservation annexes.
