# Identifiers Mapping

## Purpose

This note complements the governance chapter by showing how identifier concepts are expected to appear across the national radiology artefacts.

## Resource-specific expectations

- `ServiceRequest.identifier`: business order identifiers and the accession identifier slice within the nationally reserved accession namespace
- `Appointment.identifier`: booking identifier where scheduling is used
- `Procedure.identifier`: performed procedure identifier if issued locally
- `ImagingStudy.identifier`: DICOM `StudyInstanceUID`, accession identifier, and optional local study business identifiers
- `DiagnosticReport.identifier`: report business identifier where separate from the order

## DICOM alignment

Where DICOM identifiers are surfaced in FHIR, the identifier system URI should remain stable and the actual UID or accession value should remain unchanged by format decoration.

## Policy note

Identifier system roots remain `PROVISIONAL` until national approval is issued. Implementers should therefore separate system URI policy, value syntax, display formatting, and issuing authority in their local designs.
