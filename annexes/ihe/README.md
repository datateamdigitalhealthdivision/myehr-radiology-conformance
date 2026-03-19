# IHE Radiology Annex

## Purpose

This annex explains how IHE Radiology workflow patterns relate to the national Malaysian radiology specification.

## Scheduled Workflow

IHE Scheduled Workflow remains the primary choreography model for:

- order placement
- order acceptance
- scheduling
- worklist distribution
- acquisition status
- reporting readiness

## Actor mapping in plain language

- HIS or CPOE maps to order placer responsibilities
- RIS maps to order filler and workflow management responsibilities
- modality maps to acquisition and performed step responsibilities
- PACS or VNA maps to archive and retrieval responsibilities

## Relationship to FHIR

FHIR provides:

- computable order exchange
- workflow state visibility
- report and study metadata publication
- capability declaration and conformance packaging

IHE continues to describe the operational choreography that the FHIR API alone does not replace.

## Mandatory now versus future optional

Current emphasis:

- Scheduled Workflow concepts are treated as baseline guidance now
- cross-enterprise options are documented but likely phased
- IOCM-aligned correction handling is important but may mature over time

## Implementation note

Implementation partners should not claim that support for the FHIR IG alone satisfies radiology operational conformance if the required DICOM and IHE workflow behaviours are absent.
