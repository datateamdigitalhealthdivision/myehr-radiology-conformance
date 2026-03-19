# HL7 V2 Transition Annex

## Purpose

This annex describes how the national radiology conformance repository can support environments that still exchange radiology orders, scheduling events, or result notifications through HL7 v2 while transitioning toward the FHIR-facing national model.

## Scope

This annex is `PROVISIONAL` and transition-oriented. It does not replace the FHIR R4 computable core, DICOM, DICOMweb, or IHE workflow expectations defined elsewhere in this repository.

## Transition principles

- preserve the FHIR IG as the national computable baseline for new integrations
- allow transitional HL7 v2 interfaces where existing HIS, RIS, or broker estates cannot yet exchange FHIR directly
- avoid embedding national policy solely in v2 interface profiles
- keep identifier, terminology, and workflow semantics aligned with the FHIR-facing model

## Expected transitional patterns

- HL7 v2 order messages may continue to feed RIS workflows in legacy estates
- HL7 v2 scheduling notifications may continue where enterprise scheduling infrastructure is not yet FHIR-enabled
- HL7 v2 result notifications may continue for interim HIS consumption while `DiagnosticReport` and `ImagingStudy` publication patterns mature

## Conformance expectation

Where an implementation partner continues to use HL7 v2 in a local deployment:

- the underlying business semantics should still align with the national FHIR profiles
- identifiers should map consistently to the same business concepts used in the FHIR layer
- accession handling should follow the same provisional national policy described in the governance material
- DICOM and DICOMweb expectations remain unchanged

## Implementation note

Detailed national HL7 v2 message profiling is not defined in this first draft. If transition use remains substantial, a later phase may add formal v2 mapping tables and migration guidance.
