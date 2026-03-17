# ADR-002: Reuse MY Core For Generic Resources

## Status

Accepted

## Context

Malaysia already has MY Core as the baseline for common FHIR R4 resource patterns. Reprofiling common resources inside the radiology repository would duplicate governance effort and create unnecessary divergence.

## Decision

Derive from MY Core v1.0.1 for generic resources such as Patient, Encounter, Practitioner, PractitionerRole, Organisation, and Location unless a narrowly justified radiology-specific constraint is required.

## Consequences

- implementers have fewer profiles to learn
- the radiology guide stays focused on domain-specific behaviour
- future MY Core updates remain the main dependency management concern

