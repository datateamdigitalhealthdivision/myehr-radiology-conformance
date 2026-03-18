# Order To Worklist Mapping

This note explains how a FHIR radiology order becomes modality-consumable worklist context.

## Source artefacts

- `ServiceRequest`: clinical order intent and requested procedure context
- `Task`: state visibility for acceptance and readiness
- optional `Appointment`: booked slot details if scheduling is exposed through FHIR

## Target operational pattern

The authoritative worklist content remains DICOM Modality Worklist or an equivalent RIS-managed worklist. FHIR does not replace Modality Worklist; it provides interoperable order and status context around it.

## Key mapping points

- requested procedure code maps from `ServiceRequest.code`
- body site and laterality map from `ServiceRequest.bodySite`
- requester maps from `ServiceRequest.requester`
- accession identifier maps from `ServiceRequest.identifier` using the accession slice
- patient and encounter context map from linked references
- scheduling context can map from `Appointment` or locally managed RIS scheduling
