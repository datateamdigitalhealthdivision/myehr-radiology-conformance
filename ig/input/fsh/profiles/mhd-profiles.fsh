Profile: MYRadiologyMHDSubmissionSet
Parent: List
Id: my-radiology-mhd-submission-set
Title: "MY Radiology MHD Submission Set"
Description: "SubmissionSet profile used when radiology documents are submitted through IHE MHD. It represents the XDS SubmissionSet as a FHIR List resource and carries source identity, content type, patient linkage, and the document membership list."
* ^status = #draft
* ^experimental = false
* obeys my-radiology-mhd-submissionset-identifier-oid
* extension contains
    IHEMHDSourceIdExtension named sourceId 1..1 MS and
    IHEMHDDesignationTypeExtension named designationType 0..* MS
* extension[sourceId].valueIdentifier 1..1 MS
* extension[sourceId].valueIdentifier.system = "urn:ietf:rfc:3986"
* extension[sourceId].valueIdentifier.value 1..1 MS
* extension[sourceId].valueIdentifier.value obeys my-radiology-urn-oid
* identifier 1..* MS
* identifier.system 1..1 MS
* identifier.value 1..1 MS
* status = #current
* mode = #working
* code 1..1 MS
* code from MYRadiologyXDSContentTypeVS (required)
* subject 1..1 MS
* subject only Reference(MYRadiologyPatient)
* date 1..1 MS
* source 0..1 MS
* source only Reference(MYRadiologyPractitioner or $MYCorePractitionerRole)
* entry 1..* MS
* entry.item 1..1 MS
* entry.item only Reference(MYRadiologyDocumentReference)

Profile: MYRadiologyMHDAuditEvent
Parent: AuditEvent
Id: my-radiology-mhd-audit-event
Title: "MY Radiology MHD AuditEvent"
Description: "AuditEvent profile used for MHD submission, query, and retrieval auditing in the national radiology guide. It provides the FHIR-based audit record expected for ITI-65, ITI-66, ITI-67, and ITI-68 flows."
* ^status = #draft
* ^experimental = false
* type 1..1 MS
* subtype 1..* MS
* action 1..1 MS
* recorded 1..1 MS
* outcome 1..1 MS
* agent 2..* MS
* agent.type 0..1 MS
* agent.who 0..1 MS
* agent.requestor 1..1 MS
* agent.network 0..1 MS
* entity 1..* MS
* entity.what 1..1 MS
* entity.what only Reference(MYRadiologyPatient or MYRadiologyMHDSubmissionSet or MYRadiologyDocumentReference)
