Instance: MYPatientIdentifierNamingSystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MYPatientIdentifierNamingSystem"
* status = #draft
* kind = #identifier
* date = "2026-03-17"
* publisher = "Data Team, Digital Health Division, Ministry of Health Malaysia"
* responsible = "Ministry of Health Malaysia"
* description = "PROVISIONAL placeholder naming system for the national patient identifier domain."
* usage = "Use as a placeholder only until the final national patient identifier URI and formatting rules are approved."
* uniqueId[0].type = #uri
* uniqueId[0].value = $MYPATIENTID
* uniqueId[0].preferred = true
* uniqueId[0].comment = "PROVISIONAL placeholder only."

Instance: MYFacilityIdentifierNamingSystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MYFacilityIdentifierNamingSystem"
* status = #draft
* kind = #identifier
* date = "2026-03-17"
* publisher = "Data Team, Digital Health Division, Ministry of Health Malaysia"
* responsible = "Ministry of Health Malaysia"
* description = "PROVISIONAL placeholder naming system for facility identifiers."
* usage = "Use as a placeholder only until the final national facility identifier URI and governance rules are approved."
* uniqueId[0].type = #uri
* uniqueId[0].value = $MYFACILITYID
* uniqueId[0].preferred = true
* uniqueId[0].comment = "PROVISIONAL placeholder only."

Instance: MYHealthcareWorkerIdentifierNamingSystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MYHealthcareWorkerIdentifierNamingSystem"
* status = #draft
* kind = #identifier
* date = "2026-03-17"
* publisher = "Data Team, Digital Health Division, Ministry of Health Malaysia"
* responsible = "Ministry of Health Malaysia"
* description = "PROVISIONAL placeholder naming system for healthcare worker identifiers."
* usage = "Use as a placeholder only until the final national healthcare worker identifier URI and governance rules are approved."
* uniqueId[0].type = #uri
* uniqueId[0].value = $MYHCWID
* uniqueId[0].preferred = true
* uniqueId[0].comment = "PROVISIONAL placeholder only."

Instance: MYAccessionIdentifierNamingSystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MYAccessionIdentifierNamingSystem"
* status = #draft
* kind = #identifier
* date = "2026-03-17"
* publisher = "Data Team, Digital Health Division, Ministry of Health Malaysia"
* responsible = "Ministry of Health Malaysia"
* description = "PROVISIONAL placeholder naming system for accession identifiers, using the recommended draft facility-date-sequence approach for sandbox use."
* usage = "Use as a placeholder only until the final national accession policy and issuing authority are approved."
* uniqueId[0].type = #uri
* uniqueId[0].value = $MYACCESSION
* uniqueId[0].preferred = true
* uniqueId[0].comment = "PROVISIONAL placeholder only."

Instance: MYRadiologyOrderIdentifierNamingSystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MYRadiologyOrderIdentifierNamingSystem"
* status = #draft
* kind = #identifier
* date = "2026-03-17"
* publisher = "Data Team, Digital Health Division, Ministry of Health Malaysia"
* responsible = "Ministry of Health Malaysia"
* description = "PROVISIONAL placeholder naming system for radiology order identifiers issued by sandbox order placer systems."
* usage = "Use as a placeholder only until the national order identifier policy and issuing authority are approved."
* uniqueId[0].type = #uri
* uniqueId[0].value = $MYRADORDER
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Sandbox-first placeholder only."

Instance: MYOrganisationExample
InstanceOf: Organization
Usage: #example
Description: "Example imaging facility organisation used by the workflow examples."
* id = "my-organisation-example"
* identifier[0].system = $MYFACILITYID
* identifier[0].value = "HSAH"
* name = "Hospital Sultan Abdul Halim"

Instance: MYLocationExample
InstanceOf: Location
Usage: #example
Description: "Example CT suite location managed by the imaging facility."
* id = "my-location-example"
* status = #active
* name = "CT Suite 1"
* managingOrganization = Reference(MYOrganisationExample)

Instance: MYPractitionerExample
InstanceOf: Practitioner
Usage: #example
Description: "Example radiologist practitioner used across the reporting workflow."
* id = "my-practitioner-example"
* identifier[0].system = $MYHCWID
* identifier[0].value = "MYHCW-00004567"
* name[0].family = "Rahman"
* name[0].given[0] = "Nurul"

Instance: MYPractitionerRoleExample
InstanceOf: PractitionerRole
Usage: #example
Description: "Example consultant radiologist role at the imaging facility."
* id = "my-practitioner-role-example"
* practitioner = Reference(MYPractitionerExample)
* organization = Reference(MYOrganisationExample)
* code[0].text = "Consultant Radiologist"

Instance: MYPatientExample
InstanceOf: Patient
Usage: #example
Description: "Example patient record linked to the radiology order and reporting flow."
* id = "my-patient-example"
* identifier[0].system = $MYPATIENTID
* identifier[0].value = "MYHRN-0000001234"
* name[0].family = "Ahmad"
* name[0].given[0] = "Aisyah"
* gender = #female
* birthDate = "1980-04-12"

Instance: MYEncounterExample
InstanceOf: Encounter
Usage: #example
Description: "Example ambulatory encounter linked to the radiology order and report workflow."
* id = "my-encounter-example"
* status = #in-progress
* class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* class.code = #AMB
* subject = Reference(MYPatientExample)
* serviceProvider = Reference(MYOrganisationExample)

Instance: MYRadiologyServiceRequestExample
InstanceOf: MYRadiologyServiceRequest
Usage: #example
Description: "Example radiology order carrying both placer order and provisional accession identifiers."
* id = "my-radiology-service-request-example"
* status = #active
* intent = #order
* identifier[placerOrder].system = $MYRADORDER
* identifier[placerOrder].value = "RAD-ORD-20260317-0001"
* identifier[accession].system = $MYACCESSION
* identifier[accession].value = "HSAH-20260317-0001"
* code.coding[0].system = $MYRADLEXPROC
* code.coding[0].code = #RADLEX-CT-HEAD-WO
* code.coding[0].display = "CT head without contrast"
* code.text = "CT head without contrast"
* subject = Reference(MYPatientExample)
* encounter = Reference(MYEncounterExample)
* authoredOn = "2026-03-17T09:15:00+08:00"
* requester = Reference(MYPractitionerRoleExample)
* priority = #asap
* reasonCode[0].text = "Acute onset severe headache"
* bodySite[0].text = "Head"
* occurrenceDateTime = "2026-03-17T11:00:00+08:00"
* note[0].text = "Urgent CT requested to exclude acute intracranial event."

Instance: MYRadiologyTaskExample
InstanceOf: MYRadiologyTask
Usage: #example
Description: "Example workflow tracking task representing a scheduled radiology order."
* id = "my-radiology-task-example"
* status = #accepted
* intent = #order
* code.text = "Radiology workflow management"
* focus = Reference(MYRadiologyServiceRequestExample)
* for = Reference(MYPatientExample)
* encounter = Reference(MYEncounterExample)
* authoredOn = "2026-03-17T09:16:00+08:00"
* lastModified = "2026-03-17T09:20:00+08:00"
* owner = Reference(MYOrganisationExample)
* businessStatus = MYRadiologyWorkflowStateCS#scheduled "Scheduled"
* statusReason.text = "Order accepted and booked."

Instance: MYRadiologyAppointmentExample
InstanceOf: MYRadiologyAppointment
Usage: #example
* id = "my-radiology-appointment-example"
* status = #booked
* serviceType[0].text = "CT"
* basedOn[0] = Reference(MYRadiologyServiceRequestExample)
* description = "CT head without contrast"
* start = "2026-03-17T11:00:00+08:00"
* end = "2026-03-17T11:30:00+08:00"
* participant[0].actor = Reference(MYPatientExample)
* participant[0].status = #accepted
* participant[1].actor = Reference(MYLocationExample)
* participant[1].status = #accepted
* supportingInformation[0] = Reference(MYRadiologyServiceRequestExample)
* comment = "No oral intake restriction required."

Instance: MYRadiologyObservationExample
InstanceOf: MYRadiologyObservation
Usage: #example
Description: "Example structured finding observation linked to the radiology report."
* id = "my-radiology-observation-example"
* status = #final
* category = $ObsCat#imaging "Imaging"
* code.text = "Intracranial haemorrhage finding"
* subject = Reference(MYPatientExample)
* encounter = Reference(MYEncounterExample)
* basedOn[0] = Reference(MYRadiologyServiceRequestExample)
* effectiveDateTime = "2026-03-17T12:05:00+08:00"
* performer[0] = Reference(MYPractitionerExample)
* valueString = "Absent"
* bodySite[0].text = "Head"

Instance: MYRadiologyProcedureExample
InstanceOf: MYRadiologyProcedure
Usage: #example
Description: "Example performed imaging procedure derived from the originating radiology order."
* id = "my-radiology-procedure-example"
* status = #completed
* basedOn[0] = Reference(MYRadiologyServiceRequestExample)
* code.coding[0].system = $MYRADLEXPROC
* code.coding[0].code = #RADLEX-CT-HEAD-WO
* code.coding[0].display = "CT head without contrast"
* code.text = "CT head without contrast"
* subject = Reference(MYPatientExample)
* encounter = Reference(MYEncounterExample)
* performedDateTime = "2026-03-17T11:18:00+08:00"
* recorder = Reference(MYPractitionerExample)
* performer[0].actor = Reference(MYPractitionerExample)
* location = Reference(MYLocationExample)
* bodySite[0].text = "Head"
* note[0].text = "Study completed without contrast."

Instance: MYRadiologyImagingStudyExample
InstanceOf: MYRadiologyImagingStudy
Usage: #example
* id = "my-radiology-imaging-study-example"
* identifier[studyInstanceUID].system = $DICOMUID
* identifier[studyInstanceUID].value = "urn:oid:1.2.840.113619.2.55.3.604688321.783.1456849848.467"
* identifier[accession].system = $MYACCESSION
* identifier[accession].value = "HSAH-20260317-0001"
* status = #available
* subject = Reference(MYPatientExample)
* encounter = Reference(MYEncounterExample)
* basedOn[0] = Reference(MYRadiologyServiceRequestExample)
* procedureReference[0] = Reference(MYRadiologyProcedureExample)
* procedureCode[0].text = "CT head without contrast"
* modality[0] = $DICOMONT#CT "Computed Tomography"
* numberOfSeries = 1
* numberOfInstances = 120
* started = "2026-03-17T11:18:00+08:00"
* description = "CT head without contrast"
* series[0].uid = "1.2.840.113619.2.55.3.604688321.783.1456849848.468"
* series[0].number = 1
* series[0].modality = $DICOMONT#CT "Computed Tomography"
* series[0].description = "Axial head"
* series[0].numberOfInstances = 120

Instance: MYRadiologyDiagnosticReportExample
InstanceOf: MYRadiologyDiagnosticReport
Usage: #example
Description: "Example final radiology report linked to the imaging study and structured finding."
* id = "my-radiology-diagnostic-report-example"
* status = #final
* basedOn[0] = Reference(MYRadiologyServiceRequestExample)
* code = $LNC#18748-4 "Diagnostic imaging study"
* subject = Reference(MYPatientExample)
* encounter = Reference(MYEncounterExample)
* effectiveDateTime = "2026-03-17T12:05:00+08:00"
* issued = "2026-03-17T12:15:00+08:00"
* performer[0] = Reference(MYOrganisationExample)
* resultsInterpreter[0] = Reference(MYPractitionerExample)
* imagingStudy[0] = Reference(MYRadiologyImagingStudyExample)
* result[0] = Reference(MYRadiologyObservationExample)
* conclusion = "No acute intracranial haemorrhage."
* conclusionCode[0].text = "No acute intracranial haemorrhage"
* presentedForm[0].contentType = #text/plain
* presentedForm[0].data = "Tm8gYWN1dGUgaW50cmFjcmFuaWFsIGhhZW1vcnJoYWdlLg=="

Instance: MYRadiologyDocumentReferenceExample
InstanceOf: MYRadiologyDocumentReference
Usage: #example
* id = "my-radiology-document-reference-example"
* status = #current
* docStatus = #final
* type = $LNC#18748-4 "Diagnostic imaging study"
* subject = Reference(MYPatientExample)
* date = "2026-03-17T12:15:00+08:00"
* author[0] = Reference(MYPractitionerExample)
* description = "Packaged final radiology report document."
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Binary/example-report-pdf"
* context.encounter[0] = Reference(MYEncounterExample)

Instance: MYRadiologyOrderWorkflowBundleExample
InstanceOf: Bundle
Usage: #example
Description: "Example collection bundle showing the core order-to-report radiology workflow resources together."
* id = "my-radiology-order-workflow-bundle-example"
* type = #collection
* entry[0].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/ServiceRequest/my-radiology-service-request-example"
* entry[0].resource = MYRadiologyServiceRequestExample
* entry[1].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Task/my-radiology-task-example"
* entry[1].resource = MYRadiologyTaskExample
* entry[2].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Appointment/my-radiology-appointment-example"
* entry[2].resource = MYRadiologyAppointmentExample
* entry[3].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Procedure/my-radiology-procedure-example"
* entry[3].resource = MYRadiologyProcedureExample
* entry[4].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/ImagingStudy/my-radiology-imaging-study-example"
* entry[4].resource = MYRadiologyImagingStudyExample
* entry[5].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/DiagnosticReport/my-radiology-diagnostic-report-example"
* entry[5].resource = MYRadiologyDiagnosticReportExample
