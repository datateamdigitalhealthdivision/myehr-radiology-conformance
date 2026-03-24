# Order ID And Accession Mapping

## Purpose

This note distinguishes the business order identifier from the accession identifier and documents the current draft national accession strategy.

## Core distinction

- the order identifier tracks the originating clinical request
- the accession identifier tracks operational radiology fulfilment and study handling
- the two may be related but should not be assumed to be interchangeable

## Current draft accession options

### Candidate A

`FACILITYCODE-YYYYMMDD-SEQUENCE`

### Candidate B

`FACILITYCODE-MODALITY-YYYYMMDD-SEQUENCE`

### Candidate C

centrally minted UUID with a human-readable alias

## Recommended draft

`DRAFT POLICY OPTION`: use Candidate A for sandbox and early local deployment because it is human-readable, pragmatic for facility-level generation, and easier to operate while national central services remain `TO BE CONFIRMED`.

## Mapping expectation

- `ServiceRequest.identifier` should carry the business order identifier
- the accession slice should be populated when the accession is known
- downstream `ImagingStudy` and `DiagnosticReport` artefacts should preserve the accession value consistently where operationally relevant
- the accession namespace root is currently `https://id.kkmhub.moh.gov.my/accession`
- the accession value should remain facility-traceable even before the final issuing authority is approved
