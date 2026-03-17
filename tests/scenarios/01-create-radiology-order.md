# Scenario 01: Create Radiology Order

## Objective

Verify that a HIS can create a conformant radiology `ServiceRequest`.

## Preconditions

- patient, requester, and encounter are known
- requested procedure coding is available

## Action

Submit a `ServiceRequest` using the `MYRadiologyServiceRequest` profile.

## Expected result

- the order is accepted
- the business order identifier is preserved
- a workflow `Task` can be created or updated to represent receipt

## Negative checks

- reject a missing requested procedure
- reject missing patient linkage
- reject an unsupported identifier structure if local rules require it

