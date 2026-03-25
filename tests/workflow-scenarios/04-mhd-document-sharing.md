# 04 MHD Document Sharing

## Goal

Verify that a document source can assemble and submit a valid ITI-65 Provide Document Bundle and that a recipient can expose the submitted metadata for later discovery.

## Preconditions

- patient identity is resolvable
- document source is authorised
- document unique ID and source ID placeholders are configured

## Test steps

1. Submit the `mhd-provide-document-bundle.json` payload to the MHD recipient.
2. Verify that the recipient returns a successful transaction response.
3. Query `DocumentReference` by patient and category.
4. Query `List` by patient and code.
5. Retrieve the referenced `Binary` content.

## Expected outcome

- the submitted `DocumentReference` and `List` are searchable
- required metadata bindings are preserved
- the retrieved `Binary` content is available as PDF
