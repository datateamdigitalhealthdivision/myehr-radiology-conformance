Profile: MYRadiologyServiceRequest
Parent: ServiceRequest
Id: my-radiology-service-request
Title: "MY Radiology ServiceRequest"
Description: "Radiology imaging order profile for Malaysian deployments. It captures requested procedure, priority, indication, requester context, patient linkage, and provisional accession handling."
* ^status = #draft
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains placerOrder 1..* MS and accession 0..1 MS
* identifier[placerOrder].system = $MYRADORDER (exactly)
* identifier[placerOrder].value 1..1 MS
* identifier[placerOrder] ^short = "Business order identifier issued by the order placer"
* identifier[accession].system = $MYACCESSION (exactly)
* identifier[accession].value 1..1 MS
* identifier[accession] ^short = "PROVISIONAL accession identifier"
* status 1..1 MS
* intent = #order
* code 1..1 MS
* code from MYRadiologyProcedureCodeVS (preferred)
* subject 1..1 MS
* encounter 0..1 MS
* authoredOn 1..1 MS
* requester 1..1 MS
* priority MS
* reasonCode 0..* MS
* bodySite 0..* MS
* supportingInfo 0..* MS
* occurrence[x] 0..1 MS
* note 0..* MS

Profile: MYRadiologyTask
Parent: Task
Id: my-radiology-task
Title: "MY Radiology Task"
Description: "Workflow tracking profile used to communicate radiology order receipt, acceptance, scheduling, in-progress, completion, rejection, cancellation, and amendment states."
* ^status = #draft
* status 1..1 MS
* intent = #order
* code 1..1 MS
* code.text 1..1 MS
* focus 1..1 MS
* focus only Reference(MYRadiologyServiceRequest)
* for 1..1 MS
* for only Reference(Patient)
* encounter 0..1 MS
* authoredOn 1..1 MS
* lastModified 1..1 MS
* owner 0..1 MS
* owner only Reference(Organization)
* businessStatus 0..1 MS
* businessStatus from MYRadiologyWorkflowStateVS (preferred)
* statusReason 0..1 MS
* note 0..* MS
* input 0..* MS
* output 0..* MS

Profile: MYRadiologyAppointment
Parent: Appointment
Id: my-radiology-appointment
Title: "MY Radiology Appointment"
Description: "Optional scheduling profile for booked radiology slots where FHIR Appointment is used to expose scheduling state."
* ^status = #draft
* status 1..1 MS
* serviceType 0..* MS
* serviceType from MYRadiologyProcedureCodeVS (preferred)
* basedOn 1..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* description 0..1 MS
* start 1..1 MS
* end 1..1 MS
* participant 1..* MS
* participant.actor 1..1 MS
* supportingInformation 0..* MS
* comment 0..1 MS

Profile: MYRadiologyProcedure
Parent: Procedure
Id: my-radiology-procedure
Title: "MY Radiology Procedure"
Description: "Performed imaging procedure profile linking the originating order to the performed act, performer context, and downstream report or study."
* ^status = #draft
* basedOn 1..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* status 1..1 MS
* code 1..1 MS
* code from MYRadiologyProcedureCodeVS (preferred)
* subject 1..1 MS
* encounter 0..1 MS
* performed[x] 1..1 MS
* recorder 0..1 MS
* performer 0..* MS
* performer.actor 1..1 MS
* location 0..1 MS
* bodySite 0..* MS
* report 0..* MS
* report only Reference(MYRadiologyDiagnosticReport)
* note 0..* MS

Profile: MYRadiologyImagingStudy
Parent: ImagingStudy
Id: my-radiology-imaging-study
Title: "MY Radiology ImagingStudy"
Description: "FHIR-facing imaging study metadata aligned to the DICOM study, including linkage to the order, performed procedure, and study identifiers."
* ^status = #draft
* identifier ^slicing.discriminator[0].type = #value
* identifier ^slicing.discriminator[0].path = "system"
* identifier ^slicing.rules = #open
* identifier contains studyInstanceUID 1..1 MS and accession 0..1 MS
* identifier[studyInstanceUID].system = $DICOMUID (exactly)
* identifier[studyInstanceUID].value 1..1 MS
* identifier[accession].system = $MYACCESSION (exactly)
* identifier[accession].value 1..1 MS
* status 1..1 MS
* subject 1..1 MS
* encounter 0..1 MS
* basedOn 0..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* procedureReference 0..1 MS
* procedureReference only Reference(MYRadiologyProcedure)
* procedureCode 0..* MS
* procedureCode from MYRadiologyProcedureCodeVS (extensible)
* modality 1..* MS
* modality from MYRadiologyModalityVS (extensible)
* numberOfSeries 1..1 MS
* numberOfInstances 1..1 MS
* started 0..1 MS
* description 0..1 MS
* series 0..* MS
* series.uid 1..1 MS
* series.number 0..1 MS
* series.modality 1..1 MS
* series.modality from MYRadiologyModalityVS (extensible)
* series.description 0..1 MS
* series.numberOfInstances 0..1 MS

Profile: MYRadiologyDiagnosticReport
Parent: DiagnosticReport
Id: my-radiology-diagnostic-report
Title: "MY Radiology DiagnosticReport"
Description: "Radiology report profile covering preliminary, final, and amended reporting, with linkage to imaging studies and optional structured findings."
* ^status = #draft
* basedOn 1..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* status 1..1 MS
* category 0..* MS
* code 1..1 MS
* code from MYRadiologyReportCodeVS (preferred)
* subject 1..1 MS
* encounter 0..1 MS
* effective[x] 0..1 MS
* issued 1..1 MS
* performer 1..* MS
* resultsInterpreter 1..* MS
* imagingStudy 1..* MS
* imagingStudy only Reference(MYRadiologyImagingStudy)
* result 0..* MS
* result only Reference(MYRadiologyObservation)
* conclusion 0..1 MS
* conclusionCode 0..* MS
* presentedForm 0..* MS

Profile: MYRadiologyObservation
Parent: Observation
Id: my-radiology-observation
Title: "MY Radiology Observation"
Description: "Structured radiology finding or quantitative measurement profile to be used only when narrative reporting alone is insufficient."
* ^status = #draft
* status 1..1 MS
* category 1..* MS
* category = $ObsCat#imaging "Imaging"
* code 1..1 MS
* code from MYRadiologyFindingCodeVS (preferred)
* subject 1..1 MS
* encounter 0..1 MS
* basedOn 0..* MS
* basedOn only Reference(MYRadiologyServiceRequest)
* partOf 0..* MS
* partOf only Reference(MYRadiologyProcedure)
* effective[x] 0..1 MS
* performer 0..* MS
* value[x] 0..1 MS
* bodySite 0..1 MS
* derivedFrom 0..* MS
* derivedFrom only Reference(MYRadiologyImagingStudy)

Profile: MYRadiologyDocumentReference
Parent: DocumentReference
Id: my-radiology-document-reference
Title: "MY Radiology DocumentReference"
Description: "Optional document-centric profile for packaged radiology report documents and cross-enterprise sharing scenarios."
* ^status = #draft
* status 1..1 MS
* docStatus 0..1 MS
* type 1..1 MS
* type from MYRadiologyDocumentTypeVS (preferred)
* subject 1..1 MS
* date 1..1 MS
* author 0..* MS
* description 0..1 MS
* content 1..* MS
* content.attachment.contentType 1..1 MS
* content.attachment.url 0..1 MS
* context.encounter 0..* MS
* relatesTo 0..* MS
