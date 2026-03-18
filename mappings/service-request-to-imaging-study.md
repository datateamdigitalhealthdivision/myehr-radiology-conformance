# ServiceRequest To ImagingStudy Mapping

This note explains how the requested order is linked to the performed imaging study.

## Principle

The order and the resulting DICOM study are related but not identical. The `ServiceRequest` expresses requested intent; the `ImagingStudy` expresses performed imaging metadata aligned with the DICOM study.

## Recommended linkage

- `ImagingStudy.basedOn` references the originating `ServiceRequest`
- `Procedure.basedOn` also references the originating `ServiceRequest`
- `ImagingStudy.identifier` or a dedicated extension can carry DICOM-aligned identifiers as needed
- the DICOM `StudyInstanceUID` is represented in `ImagingStudy.identifier` using the official DICOM UID system

## Operational caveat

One request may yield more than one study in edge cases such as split acquisitions or repeat imaging. Implementers should not assume a rigid one-to-one relationship.
