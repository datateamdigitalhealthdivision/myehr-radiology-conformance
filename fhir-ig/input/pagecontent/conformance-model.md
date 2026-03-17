# Conformance Model

The national conformance model is actor-based.

## Primary actors

- HIS Order Placer or Consumer
- RIS Workflow Manager or Order Filler
- PACS or VNA FHIR metadata publisher
- EHR or clinician viewer consumer
- national validation or conformance consumer

## Core expectations

- support the profiles relevant to the actor role
- honour the search and interaction behaviour declared in the applicable CapabilityStatement
- preserve identifier linkage between order, procedure, study, and report
- treat provisional endpoint and identifier content as configurable rather than fixed

