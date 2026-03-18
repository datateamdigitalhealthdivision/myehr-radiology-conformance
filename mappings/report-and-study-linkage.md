# Report And Study Linkage

## Purpose

This note defines the preferred linkage between radiology reports and imaging studies.

## Recommended pattern

- `DiagnosticReport.basedOn` references the ordering `ServiceRequest`
- `DiagnosticReport.imagingStudy` references one or more `ImagingStudy` resources
- `DiagnosticReport.result` references structured `Observation` resources when such measurements or findings are published

## DocumentReference use

Use `DocumentReference` only when packaging a report document, supporting cross-enterprise sharing, or representing a document-centric exchange requirement. Do not use it as a routine substitute for `DiagnosticReport`.
