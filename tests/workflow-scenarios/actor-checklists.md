# Actor Checklists

## HIS Order Placer

- can create conformant `ServiceRequest`
- can read or search `Task`
- can consume appointment details if scheduling is exposed

## RIS Workflow Manager

- can accept or reject orders
- can expose booking and workflow state
- can publish performed procedure, imaging study, and report outputs

## PACS Or VNA Metadata Publisher

- can expose `ImagingStudy` read and search behaviour
- preserves `StudyInstanceUID` and accession linkage

## EHR Or Viewer Consumer

- can read and search `DiagnosticReport`
- can follow report-to-study linkage
- can handle amended report behaviour safely

## Validation Consumer

- can retrieve examples and declared capabilities
- can distinguish valid and invalid payloads
