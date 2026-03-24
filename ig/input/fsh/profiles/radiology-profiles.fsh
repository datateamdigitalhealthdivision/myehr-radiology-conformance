Profile: MYRadiologyServiceRequest
Parent: $MYCoreServiceRequest
Id: my-radiology-service-request
Title: "MY Radiology ServiceRequest"
Description: "Radiology imaging order profile for Malaysian deployments. It captures requested procedure, priority, indication, requester context, patient linkage, and provisional accession handling."
* ^status = #draft
* ^experimental = false
* obeys my-radiology-servicerequest-order-intent
* obeys my-radiology-servicerequest-category-imaging
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains placerOrder 1..* MS and accession 0..1 MS
* identifier[placerOrder].system = $MYRADORDER (exactly)
* identifier[placerOrder].type = $V20203#PLAC "Placer Identifier"
* identifier[placerOrder].value 1..1 MS
* identifier[placerOrder] ^short = "Business order identifier issued by the order placer"
* identifier[accession].system = $MYACCESSION (exactly)
* identifier[accession].type = $V20203#ACSN "Accession ID"
* identifier[accession].value 1..1 MS
* identifier[accession] ^short = "Accession identifier within the nationally reserved accession namespace"
* identifier[accession].value ^short = "Facility-traceable accession value, for example FACILITYCODE-YYYYMMDD-SEQUENCE"
* status 1..1 MS
* intent = #order
* category 1..* MS
* category ^short = "Order category shall identify imaging or radiology for reliable workflow routing and filtering"
* code 1..1 MS
* code from MYRadiologyProcedureCodeVS (extensible)
* subject 1..1 MS
* subject only Reference($MYCorePatient)
* encounter 0..1 MS
* encounter only Reference($MYCoreEncounter)
* authoredOn 1..1 MS
* requester 1..1 MS
* requester only Reference($MYCorePractitionerRole)
* priority MS
* reasonCode 0..* MS
* reasonCode from MYRadiologyClinicalIndicationVS (extensible)
* reasonCode ^short = "Clinical indication, diagnosis, or appropriateness context for the requested examination"
* bodySite 0..* MS
* bodySite ^short = "Use SNOMED CT body structures and include laterality where clinically relevant"
* supportingInfo 0..* MS
* occurrence[x] 0..1 MS
* note 0..* MS

Profile: MYRadiologyTask
Parent: $MYCoreTask
Id: my-radiology-task
Title: "MY Radiology Task"
Description: "Workflow tracking profile used to communicate radiology order receipt, acceptance, scheduling, in-progress, completion, rejection, cancellation, and amendment states."
* ^status = #draft
* ^experimental = false
* obeys my-radiology-task-completed-requires-output
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains workflowTask 1..1 MS
* identifier[workflowTask].system = $MYRADTASK (exactly)
* identifier[workflowTask].type.text = "Radiology workflow task identifier"
* identifier[workflowTask].value 1..1 MS
* status 1..1 MS
* intent = #order
* code 1..1 MS
* code.text 1..1 MS
* focus 1..1 MS
* focus only Reference(MYRadiologyServiceRequest)
* for 1..1 MS
* for only Reference($MYCorePatient)
* encounter 0..1 MS
* encounter only Reference($MYCoreEncounter)
* authoredOn 1..1 MS
* lastModified 1..1 MS
* owner 0..1 MS
* owner only Reference($MYCoreOrganization)
* basedOn 1..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* businessStatus 1..1 MS
* businessStatus ^short = "Use the required MY Core business-status vocabulary; radiology workflow states are refined in national narrative guidance"
* statusReason 0..1 MS
* statusReason from MYRadiologyTaskStatusReasonVS (extensible)
* note 0..* MS
* input 0..* MS
* output 0..* MS
* output.type 1..1 MS
* output.type.text 1..1 MS
* output.type.text = "report"
* output.value[x] only Reference(MYRadiologyDiagnosticReport)
* output.valueReference 1..1 MS

Profile: MYRadiologyAppointment
Parent: $MYCoreAppointment
Id: my-radiology-appointment
Title: "MY Radiology Appointment"
Description: "Optional scheduling profile for booked radiology slots where FHIR Appointment is used to expose scheduling state."
* ^status = #draft
* ^experimental = false
* status 1..1 MS
* serviceCategory 1..* MS
* serviceType 1..* MS
* basedOn 1..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* description 0..1 MS
* start 1..1 MS
* end 1..1 MS
* participant 1..* MS
* participant.actor 1..1 MS
* specialty 1..* MS
* supportingInformation 1..* MS
* comment 0..1 MS

Profile: MYRadiologyProcedure
Parent: $MYCoreProcedure
Id: my-radiology-procedure
Title: "MY Radiology Procedure"
Description: "Performed imaging procedure profile linking the originating order to the performed act, performer context, and downstream report or study."
* ^status = #draft
* ^experimental = false
* basedOn 1..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* status 1..1 MS
* code 1..1 MS
* code from MYRadiologyProcedureCodeVS (extensible)
* subject 1..1 MS
* subject only Reference($MYCorePatient)
* encounter 1..1 MS
* encounter only Reference($MYCoreEncounter)
* category 1..1 MS
* performed[x] 1..1 MS
* recorder 0..1 MS
* recorder only Reference($MYCorePractitioner or $MYCorePractitionerRole)
* performer 0..* MS
* performer.actor 1..1 MS
* performer.actor only Reference($MYCorePractitioner or $MYCorePractitionerRole or $MYCoreOrganization)
* location 0..1 MS
* location only Reference($MYCoreLocation)
* bodySite 0..* MS
* report 0..* MS
* report only Reference(MYRadiologyDiagnosticReport)
* note 0..* MS

Profile: MYRadiologyImagingStudy
Parent: $MYCoreImagingStudy
Id: my-radiology-imaging-study
Title: "MY Radiology ImagingStudy"
Description: "FHIR-facing imaging study metadata aligned to the DICOM study, including linkage to the order, performed procedure, and study identifiers."
* ^status = #draft
* ^experimental = false
* obeys my-radiology-imagingstudy-available-requires-series
* obeys my-radiology-imagingstudy-available-requires-endpoint
* obeys my-radiology-imagingstudy-numberofseries-matches
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains studyInstanceUID 1..1 MS and accession 0..1 MS
* identifier[studyInstanceUID].system = $DICOMUID (exactly)
* identifier[studyInstanceUID].type.text = "DICOM Study Instance UID"
* identifier[studyInstanceUID].value 1..1 MS
* identifier[studyInstanceUID].value obeys my-radiology-dicom-urn-oid
* identifier[studyInstanceUID].value ^short = "StudyInstanceUID carried as urn:oid:<numeric-uid>"
* identifier[accession].system = $MYACCESSION (exactly)
* identifier[accession].type = $V20203#ACSN "Accession ID"
* identifier[accession].value 1..1 MS
* status 1..1 MS
* subject 1..1 MS
* subject only Reference($MYCorePatient)
* encounter 0..1 MS
* encounter only Reference($MYCoreEncounter)
* basedOn 0..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* procedureReference 0..1 MS
* procedureReference only Reference(MYRadiologyProcedure)
* procedureCode 0..* MS
* procedureCode from MYRadiologyProcedureCodeVS (extensible)
* endpoint 0..* MS
* endpoint only Reference(MYRadiologyDicomWebEndpoint)
* endpoint ^short = "DICOMweb retrieval endpoint(s) for WADO-RS access"
* modality 1..* MS
* modality from MYRadiologyModalityVS (required)
* numberOfSeries 1..1 MS
* numberOfInstances 1..1 MS
* started 0..1 MS
* description 0..1 MS
* series 0..* MS
* series.uid 1..1 MS
* series.uid obeys my-radiology-dicom-oid
* series.number 0..1 MS
* series.modality 1..1 MS
* series.modality from MYRadiologyModalityVS (required)
* series.description 0..1 MS
* series.numberOfInstances 1..1 MS
* series.instance 0..* MS
* series.instance.uid 1..1 MS
* series.instance.uid obeys my-radiology-dicom-oid
* series.instance.sopClass 1..1 MS

Profile: MYRadiologyDicomWebEndpoint
Parent: Endpoint
Id: my-radiology-dicomweb-endpoint
Title: "MY Radiology DICOMweb Endpoint"
Description: "Endpoint profile for DICOM WADO-RS retrieval. It carries the retrieval base URL used by imaging viewers and integration consumers to access study content."
* ^status = #draft
* ^experimental = false
* status 1..1 MS
* connectionType 1..1 MS
* connectionType = $EndpointConnType#dicom-wado-rs "DICOM WADO-RS"
* name 0..1 MS
* managingOrganization 0..1 MS
* managingOrganization only Reference($MYCoreOrganization)
* address 1..1 MS
* address ^short = "Base WADO-RS URL, for example {dicomweb-base}/studies/{StudyInstanceUID}"
* payloadType 1..* MS
* payloadMimeType 0..* MS
* header 0..* MS

Profile: MYRadiologyDiagnosticReport
Parent: $MYCoreDiagnosticReport
Id: my-radiology-diagnostic-report
Title: "MY Radiology DiagnosticReport"
Description: "Radiology report profile covering preliminary, final, and amended reporting, with linkage to imaging studies and optional structured findings."
* ^status = #draft
* ^experimental = false
* obeys my-radiology-report-category-rad
* obeys my-radiology-report-final-requires-conclusion-and-times
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains reportIdentifier 1..1 MS
* identifier[reportIdentifier].system = $MYRADREPORT (exactly)
* identifier[reportIdentifier].type.text = "Radiology report identifier"
* identifier[reportIdentifier].value 1..1 MS
* basedOn 1..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* status 1..1 MS
* category 1..* MS
* category from http://terminology.hl7.org/ValueSet/v2-0074 (extensible)
* category ^short = "At least one category coding shall be HL7 v2 RAD for reliable radiology filtering"
* code 1..1 MS
* code from MYRadiologyReportCodeVS (extensible)
* subject 1..1 MS
* subject only Reference($MYCorePatient)
* encounter 1..1 MS
* encounter only Reference($MYCoreEncounter)
* effective[x] 0..1 MS
* issued 1..1 MS
* performer 1..* MS
* performer only Reference($MYCoreOrganization or $MYCorePractitioner or $MYCorePractitionerRole)
* resultsInterpreter 1..* MS
* resultsInterpreter only Reference($MYCorePractitioner or $MYCorePractitionerRole)
* imagingStudy 1..* MS
* imagingStudy only Reference(MYRadiologyImagingStudy)
* result 0..* MS
* result only Reference(MYRadiologyObservation)
* conclusion 1..1 MS
* conclusionCode 0..* MS
* presentedForm 0..* MS
* presentedForm.contentType 1..1 MS
* presentedForm.contentType from MYRadiologyPresentedFormContentTypeVS (required)
* presentedForm.data 0..1 MS
* presentedForm.url 0..1 MS
* presentedForm ^short = "Rendered report attachment. PDF shall be supported; HTML should be supported where available."

Profile: MYRadiologyObservation
Parent: Observation
Id: my-radiology-observation
Title: "MY Radiology Observation"
Description: "Structured radiology finding or quantitative measurement profile to be used only when narrative reporting alone is insufficient."
* ^status = #draft
* ^experimental = false
* status 1..1 MS
* category 1..* MS
* category = $ObsCat#imaging "Imaging"
* code 1..1 MS
* code from MYRadiologyFindingCodeVS (extensible)
* subject 1..1 MS
* subject only Reference($MYCorePatient)
* encounter 0..1 MS
* encounter only Reference($MYCoreEncounter)
* basedOn 0..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* partOf 0..* MS
* partOf only Reference(MYRadiologyProcedure)
* effective[x] 0..1 MS
* performer 0..* MS
* performer only Reference($MYCoreOrganization or $MYCorePractitioner or $MYCorePractitionerRole)
* value[x] 0..1 MS
* bodySite 0..1 MS
* derivedFrom 0..* MS
* derivedFrom ^short = "Reference the ImagingStudy that the structured finding or measurement was derived from"
* derivedFrom MS
* derivedFrom only Reference(MYRadiologyImagingStudy)

Profile: MYRadiologyDocumentReference
Parent: DocumentReference
Id: my-radiology-document-reference
Title: "MY Radiology DocumentReference"
Description: "Optional document-centric profile for packaged radiology report documents and cross-enterprise sharing scenarios."
* ^status = #draft
* ^experimental = false
* status 1..1 MS
* docStatus 0..1 MS
* type 1..1 MS
* type from MYRadiologyDocumentTypeVS (extensible)
* subject 1..1 MS
* subject only Reference($MYCorePatient)
* date 1..1 MS
* author 0..* MS
* author only Reference($MYCoreOrganization or $MYCorePractitioner or $MYCorePractitionerRole)
* description 0..1 MS
* content 1..* MS
* content.attachment.contentType 1..1 MS
* content.attachment.url 0..1 MS
* context.encounter 0..* MS
* context.encounter only Reference($MYCoreEncounter)
* relatesTo 0..* MS

Profile: MYRadiologyProvenance
Parent: Provenance
Id: my-radiology-provenance
Title: "MY Radiology Provenance"
Description: "Provenance profile used to record authorship, amendment, and publication responsibility for radiology resources that require stronger audit traceability."
* ^status = #draft
* ^experimental = false
* target 1..* MS
* target only Reference(MYRadiologyServiceRequest or MYRadiologyTask or MYRadiologyProcedure or MYRadiologyImagingStudy or MYRadiologyDiagnosticReport or MYRadiologyObservation or MYRadiologyDocumentReference)
* recorded 1..1 MS
* activity 0..1 MS
* reason 0..* MS
* agent 1..* MS
* agent.type 0..1 MS
* agent.who 1..1 MS
* agent.who only Reference($MYCoreOrganization or $MYCorePractitioner or $MYCorePractitionerRole)
* entity 0..* MS
