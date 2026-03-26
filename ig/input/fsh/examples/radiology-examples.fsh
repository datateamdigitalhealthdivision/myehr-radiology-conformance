Instance: MYPatientIdentifierNamingSystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MYPatientIdentifierNamingSystem"
* status = #draft
* kind = #identifier
* date = "2026-03-17"
* publisher = "Data Team, Digital Health Division, Ministry of Health Malaysia"
* responsible = "Ministry of Health Malaysia"
* description = "PROVISIONAL placeholder naming system for the MyHRN national patient identifier domain, pending national MPI activation."
* usage = "Use to scaffold support for MyHRN now so that national MPI activation can be adopted without schema change."
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
* description = "PROVISIONAL placeholder naming system for the national facility identifier domain used across organisation and location reconciliation."
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
* description = "PROVISIONAL placeholder naming system for the MyHCW national healthcare worker identifier domain, pending national activation."
* usage = "Use to scaffold support for MyHCW now so that national activation can be adopted without schema change."
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
* description = "PROVISIONAL placeholder naming system for accession identifiers within the nationally reserved accession namespace, using the recommended draft facility-date-sequence approach for sandbox use."
* usage = "Use the nationally reserved accession namespace root and generate facility-traceable accession values until the final national accession authority is approved."
* uniqueId[0].type = #uri
* uniqueId[0].value = $MYACCESSION
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Reserved namespace root. The accession value itself should preserve facility-level traceability."

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

Instance: MYRadiologyTaskIdentifierNamingSystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MYRadiologyTaskIdentifierNamingSystem"
* status = #draft
* kind = #identifier
* date = "2026-03-24"
* publisher = "Data Team, Digital Health Division, Ministry of Health Malaysia"
* responsible = "Ministry of Health Malaysia"
* description = "PROVISIONAL placeholder naming system for radiology workflow task identifiers issued by workflow-managing systems."
* usage = "Use as a placeholder only until the national workflow task identifier policy and issuing authority are approved."
* uniqueId[0].type = #uri
* uniqueId[0].value = $MYRADTASK
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Sandbox-first placeholder only."

Instance: MYRadiologyReportIdentifierNamingSystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MYRadiologyReportIdentifierNamingSystem"
* status = #draft
* kind = #identifier
* date = "2026-03-24"
* publisher = "Data Team, Digital Health Division, Ministry of Health Malaysia"
* responsible = "Ministry of Health Malaysia"
* description = "PROVISIONAL placeholder naming system for radiology report identifiers issued by reporting systems."
* usage = "Use as a placeholder only until the national radiology report identifier policy and issuing authority are approved."
* uniqueId[0].type = #uri
* uniqueId[0].value = $MYRADREPORT
* uniqueId[0].preferred = true
* uniqueId[0].comment = "Sandbox-first placeholder only."

Instance: MYOrganisationExample
InstanceOf: $MYCoreOrganization
Usage: #example
Description: "Example imaging facility organisation used by the workflow examples and aligned to the site facility code used across the accompanying examples."
* id = "my-organisation-example"
* identifier[0].system = "http://fhir.hie.moh.gov.my/sid/organization-id"
* identifier[0].value = "HSAH"
* active = true
* name = "Hospital Sultan Abdul Halim"
* telecom[0].system = #phone
* telecom[0].value = "+60-4-7404000"
* address[0].line[0] = "Bandar Amanjaya"
* address[0].city = "Sungai Petani"
* address[0].district = "Kuala Muda"
* address[0].state = "Kedah"
* address[0].postalCode = "08000"
* address[0].country = "MY"

Instance: MYLocationExample
InstanceOf: MYRadiologyLocation
Usage: #example
Description: "Example CT suite location managed by the imaging facility, carrying the provisional national facility identifier and a site-local departmental identifier."
* id = "my-location-example"
* identifier[facilityId].system = $MYFACILITYID
* identifier[facilityId].value = "HSAH"
* identifier[localLocationId].type.text = "Local location identifier"
* identifier[localLocationId].system = "https://hospital-sah.moh.gov.my/id/location"
* identifier[localLocationId].value = "HSAH-RAD-CT1"
* status = #active
* name = "CT Suite 1"
* type[0].text = "Computed tomography suite"
* managingOrganization = Reference(MYOrganisationExample)
* address.line[0] = "Radiology Department, Level 1"
* address.city = "Sungai Petani"
* address.state = "Kedah"
* address.postalCode = "08000"
* address.country = "MY"

Instance: MYPractitionerExample
InstanceOf: MYRadiologyPractitioner
Usage: #example
Description: "Example radiologist practitioner used across the reporting workflow, including a placeholder MyHCW slice pending national activation."
* id = "my-practitioner-example"
* identifier[nationalId].system = $MYKAD
* identifier[nationalId].type = $V20203#NIIP "National unique individual identifier"
* identifier[nationalId].value = "820914-08-5234"
* identifier[localStaffId].type = $V20203#EMPL "Employee number"
* identifier[localStaffId].system = "https://hospital-sah.moh.gov.my/id/staff"
* identifier[localStaffId].value = "RAD-DR-456"
* identifier[myHcwId].system = $MYHCWID
* identifier[myHcwId].type.text = "MyHCW"
* identifier[myHcwId].value = "MYHCW-PENDING-00004567"
* name[0].prefix[0] = "Dr"
* name[0].family = "Rahman"
* name[0].given[0] = "Nurul"
* gender = #female
* birthDate = "1982-09-14"

Instance: MYPractitionerRoleExample
InstanceOf: $MYCorePractitionerRole
Usage: #example
Description: "Example consultant radiologist role at the imaging facility."
* id = "my-practitioner-role-example"
* practitioner = Reference(MYPractitionerExample)
* organization = Reference(MYOrganisationExample)
* code[0].text = "Consultant Radiologist"
* specialty[0].text = "Diagnostic Radiology"

Instance: MYPatientExample
InstanceOf: MYRadiologyPatient
Usage: #example
Description: "Example patient record linked to the radiology order and reporting flow, including a placeholder MyHRN slice pending national MPI activation."
* id = "my-patient-example"
* identifier[nationalId].system = $MYKAD
* identifier[nationalId].type = $V20203#NIIP "National unique individual identifier"
* identifier[nationalId].value = "800412-08-5123"
* identifier[localPatientId].type = $V20203#MR "Medical record number"
* identifier[localPatientId].system = "https://hospital-sah.moh.gov.my/id/patient"
* identifier[localPatientId].value = "RIS-12345"
* identifier[myHrn].system = $MYPATIENTID
* identifier[myHrn].type.text = "MyHRN"
* identifier[myHrn].value = "MYHRN-PENDING-0000001234"
* name[0].family = "Ahmad"
* name[0].given[0] = "Aisyah"
* gender = #female
* birthDate = "1980-04-12"
* telecom[0].system = #phone
* telecom[0].value = "+60-12-5551234"
* address[0].line[0] = "No. 18, Jalan Putra Indah 3"
* address[0].city = "Sungai Petani"
* address[0].state = "Kedah"
* address[0].postalCode = "08000"
* address[0].country = "MY"
* managingOrganization = Reference(MYOrganisationExample)

Instance: MYEncounterExample
InstanceOf: $MYCoreEncounter
Usage: #example
Description: "Example ambulatory encounter linked to the radiology order and report workflow."
* id = "my-encounter-example"
* status = #in-progress
* class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode"
* class.code = #AMB
* identifier[encounterNo].system = "http://fhir.hie.moh.gov.my/sid/encounter-id"
* identifier[encounterNo].value = "ENC-20260317-0001"
* type[0].text = "Radiology outpatient encounter"
* serviceType.text = "Diagnostic radiology service"
* period.start = "2026-03-17T09:00:00+08:00"
* subject = Reference(MYPatientExample)
* serviceProvider = Reference(MYOrganisationExample)

Instance: MYRadiologyServiceRequestExample
InstanceOf: MYRadiologyServiceRequest
Usage: #example
Description: "Example radiology order carrying both placer order and provisional accession identifiers."
* id = "my-radiology-service-request-example"
* status = #active
* intent = #order
* category[0].coding[0] = $V20074#RAD "Radiology"
* category[0].coding[1] = $SCT#363679005 "Imaging"
* category[0].text = "Radiology imaging order"
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
* reasonCode[0].coding[0] = $ICD10#R51 "Headache"
* reasonCode[0].text = "Acute onset severe headache"
* bodySite[0].text = "Head"
* locationReference[0] = Reference(MYLocationExample)
* occurrenceDateTime = "2026-03-17T11:00:00+08:00"
* note[0].text = "Urgent CT requested to exclude acute intracranial event."

Instance: MYRadiologyTaskExample
InstanceOf: MYRadiologyTask
Usage: #example
Description: "Example workflow tracking task representing a scheduled radiology order."
* id = "my-radiology-task-example"
* identifier[workflowTask].system = $MYRADTASK
* identifier[workflowTask].value = "RAD-TASK-20260317-0001"
* status = #accepted
* intent = #order
* code.text = "Radiology workflow management"
* basedOn[0] = Reference(MYRadiologyServiceRequestExample)
* focus = Reference(MYRadiologyServiceRequestExample)
* for = Reference(MYPatientExample)
* encounter = Reference(MYEncounterExample)
* authoredOn = "2026-03-17T09:16:00+08:00"
* lastModified = "2026-03-17T09:20:00+08:00"
* owner = Reference(MYOrganisationExample)
* businessStatus = MYRadiologyWorkflowStateCS#scheduled "Scheduled"
* statusReason = MYRadiologyTaskStatusReasonCS#rescheduled "Rescheduled"

Instance: MYRadiologyDicomWebEndpointExample
InstanceOf: MYRadiologyDicomWebEndpoint
Usage: #example
Description: "Example WADO-RS endpoint used by the imaging study metadata example."
* id = "my-radiology-dicomweb-endpoint-example"
* status = #active
* connectionType = $EndpointConnType#dicom-wado-rs "DICOM WADO-RS"
* name = "Hospital Sultan Abdul Halim WADO-RS"
* managingOrganization = Reference(MYOrganisationExample)
* address = "https://sandbox.myehr.kkmhub.moh.gov.my/dicomweb/studies"
* payloadType[0].text = "Radiology imaging retrieval"
* payloadMimeType[0] = #application/dicom+json

Instance: MYRadiologyAppointmentExample
InstanceOf: MYRadiologyAppointment
Usage: #example
* id = "my-radiology-appointment-example"
* status = #booked
* serviceCategory[0].text = "Radiology"
* serviceType[0].text = "CT head without contrast"
* basedOn[0] = Reference(MYRadiologyServiceRequestExample)
* description = "CT head without contrast"
* start = "2026-03-17T11:00:00+08:00"
* end = "2026-03-17T11:30:00+08:00"
* specialty[0].text = "Radiology"
* participant[0].actor = Reference(MYPatientExample)
* participant[0].actor.type = "Patient"
* participant[0].actor.display = "Aisyah Ahmad"
* participant[0].status = #accepted
* participant[1].actor = Reference(MYLocationExample)
* participant[1].actor.type = "Location"
* participant[1].actor.display = "CT Suite 1"
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
* code.coding[0] = $SCT#118247008 "Radiologic finding"
* code.text = "Intracranial haemorrhage finding"
* subject = Reference(MYPatientExample)
* encounter = Reference(MYEncounterExample)
* basedOn[0] = Reference(MYRadiologyServiceRequestExample)
* effectiveDateTime = "2026-03-17T12:05:00+08:00"
* performer[0] = Reference(MYPractitionerExample)
* valueString = "Absent"
* bodySite[0].text = "Head"
* derivedFrom[0] = Reference(MYRadiologyImagingStudyExample)

Instance: MYRadiologyProcedureExample
InstanceOf: MYRadiologyProcedure
Usage: #example
Description: "Example performed imaging procedure derived from the originating radiology order."
* id = "my-radiology-procedure-example"
* status = #completed
* basedOn[0] = Reference(MYRadiologyServiceRequestExample)
* category.text = "Diagnostic imaging procedure"
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
* endpoint[0] = Reference(MYRadiologyDicomWebEndpointExample)
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
* series[0].instance[0].uid = "1.2.840.113619.2.55.3.604688321.783.1456849848.469"
* series[0].instance[0].sopClass = $DICOMUID#1.2.840.10008.5.1.4.1.1.2 "CT Image Storage"



Instance: MYRadiologyDiagnosticReportExample
InstanceOf: MYRadiologyDiagnosticReport
Usage: #example
Description: "Example final radiology report linked to the imaging study and structured finding."
* id = "my-radiology-diagnostic-report-example"
* identifier[reportIdentifier].system = $MYRADREPORT
* identifier[reportIdentifier].value = "RAD-RPT-20260317-0001"
* status = #final
* basedOn[0] = Reference(MYRadiologyServiceRequestExample)
* category[0].coding[0] = $V20074#RAD "Radiology"
* category[0].text = "Radiology"
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
* presentedForm[0].contentType = #application/pdf
* presentedForm[0].data = "JVBERi0xLjQK"

Instance: MYRadiologyDocumentReferenceExample
InstanceOf: MYRadiologyDocumentReference
Usage: #example
* id = "my-radiology-document-reference-example"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:2.16.458.1.1.1.1.12345.10"
* identifier[0].system = $MYRADREPORT
* identifier[0].value = "RAD-RPT-20260317-0001"
* status = #current
* docStatus = #final
* type = $LNC#18748-4 "Diagnostic imaging study"
* category[0].coding[0] = MYRadiologyXDSClassCodeCS#imaging-report "Imaging Report"
* subject = Reference(MYPatientExample)
* subject.identifier.system = $MYKAD
* subject.identifier.value = "800412-08-5123"
* date = "2026-03-17T12:15:00+08:00"
* author[0] = Reference(MYPractitionerExample)
* securityLabel[0] = $V3Conf#N "Normal"
* description = "Packaged final radiology report document."
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.url = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Binary/my-radiology-mhd-report-binary-example"
* content[0].format = $IHEFormatCode#urn:ihe:rad:PDF "RAD PDF"
* context.encounter[0] = Reference(MYEncounterExample)
* context.facilityType = MYRadiologyXDSFacilityTypeCS#hospital "Hospital"
* context.practiceSetting = MYRadiologyXDSPracticeSettingCS#radiology "Radiology"
* context.sourcePatientInfo = Reference(MYPatientExample)
* context.related[0] = Reference(MYRadiologyServiceRequestExample)
* context.related[1] = Reference(MYRadiologyImagingStudyExample)
* context.event[0] = $DICOMONT#CT "Computed Tomography"

Instance: MYRadiologyOrderWorkflowBundleExample
InstanceOf: Bundle
Usage: #example
Description: "Example collection bundle showing the core order-to-report radiology workflow resources together with the supporting patient, practitioner, organisation, and location context required for internal references to resolve."
* id = "my-radiology-order-workflow-bundle-example"
* type = #collection
* entry[0].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Patient/my-patient-example"
* entry[0].resource = MYPatientExample
* entry[1].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Encounter/my-encounter-example"
* entry[1].resource = MYEncounterExample
* entry[2].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Organization/my-organisation-example"
* entry[2].resource = MYOrganisationExample
* entry[3].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Location/my-location-example"
* entry[3].resource = MYLocationExample
* entry[4].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Practitioner/my-practitioner-example"
* entry[4].resource = MYPractitionerExample
* entry[5].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/PractitionerRole/my-practitioner-role-example"
* entry[5].resource = MYPractitionerRoleExample
* entry[6].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/ServiceRequest/my-radiology-service-request-example"
* entry[6].resource = MYRadiologyServiceRequestExample
* entry[7].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Task/my-radiology-task-example"
* entry[7].resource = MYRadiologyTaskExample
* entry[8].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Appointment/my-radiology-appointment-example"
* entry[8].resource = MYRadiologyAppointmentExample
* entry[9].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Procedure/my-radiology-procedure-example"
* entry[9].resource = MYRadiologyProcedureExample
* entry[10].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Endpoint/my-radiology-dicomweb-endpoint-example"
* entry[10].resource = MYRadiologyDicomWebEndpointExample
* entry[11].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/ImagingStudy/my-radiology-imaging-study-example"
* entry[11].resource = MYRadiologyImagingStudyExample
* entry[12].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Observation/my-radiology-observation-example"
* entry[12].resource = MYRadiologyObservationExample
* entry[13].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/DiagnosticReport/my-radiology-diagnostic-report-example"
* entry[13].resource = MYRadiologyDiagnosticReportExample

Instance: MYRadiologyProvenanceExample
InstanceOf: MYRadiologyProvenance
Usage: #example
Description: "Example provenance resource recording the publication responsibility for a final radiology report."
* id = "my-radiology-provenance-example"
* target[0] = Reference(MYRadiologyDiagnosticReportExample)
* target[1] = Reference(MYRadiologyImagingStudyExample)
* recorded = "2026-03-17T12:16:00+08:00"
* activity.text = "Report publication"
* reason[0].text = "Final report released to requesting system"
* agent[0].type.text = "Author"
* agent[0].who = Reference(MYPractitionerExample)
* agent[1].type.text = "Custodian organisation"
* agent[1].who = Reference(MYOrganisationExample)

Instance: MYRadiologyOrderSubmissionTransactionExample
InstanceOf: Bundle
Usage: #example
Description: "Example transaction bundle showing a realistic sandbox order-submission pattern for onboarding and interface testing, including the supporting patient, practitioner, organisation, and location resources required by the order."
* id = "my-radiology-order-submission-transaction-example"
* type = #transaction
* entry[0].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Organization/my-organisation-example"
* entry[0].resource = MYOrganisationExample
* entry[0].request.method = #PUT
* entry[0].request.url = "Organization/my-organisation-example"
* entry[1].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Practitioner/my-practitioner-example"
* entry[1].resource = MYPractitionerExample
* entry[1].request.method = #PUT
* entry[1].request.url = "Practitioner/my-practitioner-example"
* entry[2].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/PractitionerRole/my-practitioner-role-example"
* entry[2].resource = MYPractitionerRoleExample
* entry[2].request.method = #PUT
* entry[2].request.url = "PractitionerRole/my-practitioner-role-example"
* entry[3].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Patient/my-patient-example"
* entry[3].resource = MYPatientExample
* entry[3].request.method = #PUT
* entry[3].request.url = "Patient/my-patient-example"
* entry[4].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Encounter/my-encounter-example"
* entry[4].resource = MYEncounterExample
* entry[4].request.method = #PUT
* entry[4].request.url = "Encounter/my-encounter-example"
* entry[5].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Location/my-location-example"
* entry[5].resource = MYLocationExample
* entry[5].request.method = #PUT
* entry[5].request.url = "Location/my-location-example"
* entry[6].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/ServiceRequest/my-radiology-service-request-example"
* entry[6].resource = MYRadiologyServiceRequestExample
* entry[6].request.method = #PUT
* entry[6].request.url = "ServiceRequest/my-radiology-service-request-example"

Instance: MYRadiologyInvalidServiceRequestOperationOutcomeExample
InstanceOf: OperationOutcome
Usage: #example
Description: "Example OperationOutcome returned when a radiology ServiceRequest omits a required imaging or radiology category."
* id = "my-radiology-invalid-service-request-operationoutcome-example"
* issue[0].severity = #error
* issue[0].code = #invalid
* issue[0].details.text = "ServiceRequest.category shall include an imaging or radiology category code recognised by the national guide."
* issue[0].diagnostics = "The submitted ServiceRequest did not include HL7 v2 RAD or SNOMED CT imaging category coding."
* issue[0].expression[0] = "ServiceRequest.category"

Instance: MYRadiologyProcedureCodeConceptMap
InstanceOf: ConceptMap
Usage: #definition
* id = "my-radiology-procedure-code-conceptmap"
* url = "https://myehr.kkmhub.moh.gov.my/fhir/ImplementationGuide/my-radiology/ConceptMap/my-radiology-procedure-code-conceptmap"
* version = "0.1.0"
* name = "MYRadiologyProcedureCodeConceptMap"
* title = "MY Radiology Procedure Code Concept Map"
* status = #draft
* experimental = false
* date = "2026-03-24"
* publisher = "Data Team, Digital Health Division, Ministry of Health Malaysia"
* description = "Starter ConceptMap aligning the provisional locally hosted RadLex mirror codes used by this guide to commonly consumed LOINC radiology procedure or report codes."
* sourceUri = $MYRADLEXPROC
* targetUri = $LNC
* group[0].source = $MYRADLEXPROC
* group[0].target = $LNC
* group[0].element[0].code = #RADLEX-CT-HEAD-WO
* group[0].element[0].display = "CT head without contrast"
* group[0].element[0].target[0].code = #24725-4
* group[0].element[0].target[0].display = "CT Head"
* group[0].element[0].target[0].equivalence = #equivalent
* group[0].element[1].code = #RADLEX-CT-CHEST-WO
* group[0].element[1].display = "CT chest without contrast"
* group[0].element[1].target[0].code = #24627-2
* group[0].element[1].target[0].display = "CT Chest"
* group[0].element[1].target[0].equivalence = #equivalent
* group[0].element[2].code = #RADLEX-XR-CHEST-2V
* group[0].element[2].display = "Chest radiography 2 views"
* group[0].element[2].target[0].code = #36643-5
* group[0].element[2].target[0].display = "XR Chest 2 Views"
* group[0].element[2].target[0].equivalence = #equivalent
* group[0].element[3].code = #RADLEX-MR-BRAIN-WO
* group[0].element[3].display = "MR brain without contrast"
* group[0].element[3].target[0].code = #58748-5
* group[0].element[3].target[0].display = "Functional MR Brain"
* group[0].element[3].target[0].equivalence = #wider
