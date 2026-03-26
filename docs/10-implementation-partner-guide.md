# 10 Implementation Partner Guide

## Purpose

This chapter points implementation partners to the rendered [Implementation Partner Guide](https://datateamdigitalhealthdivision.github.io/myehr-radiology-conformance/implementation-partner-guide.html), which organises the published artefacts by use case.

## Key use cases

- RadioConnect federation and optional direct retrieval
- EMR to PACS or RIS order and results integration
- EMR to MyEHR document sharing through MHD

## Core expectations

- implement the national patient, practitioner, and facility identifier scaffolding consistently across all use cases, including the nationally reserved placeholder namespaces for local patient and local staff identifiers
- apply the actor CapabilityStatements before building interface behaviour
- use the examples, workflow chapters, terminology guidance, and testing assets together rather than in isolation
