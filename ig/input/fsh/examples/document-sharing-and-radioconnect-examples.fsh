Instance: MYDocumentUniqueIdNamingSystem
InstanceOf: NamingSystem
Usage: #definition
* name = "MYDocumentUniqueIdNamingSystem"
* status = #draft
* kind = #identifier
* date = "2026-03-25"
* publisher = "Data Team, Digital Health Division, Ministry of Health Malaysia"
* responsible = "Ministry of Health Malaysia"
* description = "PROVISIONAL naming system for XDS or MHD document unique identifiers using an OID arc that remains TO BE CONFIRMED pending national governance approval."
* usage = "Use for sandbox and design alignment only. The production OID arc must be allocated by the national OID governance body before operational deployment."
* uniqueId[0].type = #oid
* uniqueId[0].value = "2.16.458.1.1.1.1"
* uniqueId[0].preferred = true
* uniqueId[0].comment = "PROVISIONAL placeholder only. The OID arc 2.16.458.1.1.1.1 remains subject to national allocation."
* uniqueId[1].type = #uri
* uniqueId[1].value = $MYDOCUMENTID
* uniqueId[1].preferred = false
* uniqueId[1].comment = "FHIR URI equivalent for document unique identifiers in FHIR-only contexts."

Instance: MYRadiologyMHDDocumentReferenceExample
InstanceOf: MYRadiologyDocumentReference
Usage: #example
Description: "Example radiology report document populated with MHD and XDS-aligned metadata."
* id = "my-radiology-mhd-document-reference-example"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:oid:2.16.458.1.1.1.1.12345.1"
* identifier[0].system = $MYRADREPORT
* identifier[0].value = "RAD-RPT-20260317-0002"
* status = #current
* docStatus = #final
* type = $LNC#18748-4 "Diagnostic imaging study"
* category[0].coding[0] = MYRadiologyXDSClassCodeCS#imaging-report "Imaging Report"
* subject = Reference(MYPatientExample)
* date = "2026-03-25T10:30:00+08:00"
* author[0] = Reference(MYPractitionerExample)
* securityLabel[0] = $V3Conf#N "Normal"
* description = "Final CT report packaged for document sharing."
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

Instance: MYRadiologyMHDSubmissionSetExample
InstanceOf: MYRadiologyMHDSubmissionSet
Usage: #example
Description: "Example SubmissionSet List used in an ITI-65 Provide Document Bundle."
* id = "my-radiology-mhd-submission-set-example"
* identifier[0].system = "urn:ietf:rfc:3986"
* identifier[0].value = "urn:oid:2.16.458.1.1.1.1.99999.1"
* extension[sourceId].valueIdentifier.system = "urn:ietf:rfc:3986"
* extension[sourceId].valueIdentifier.value = "urn:oid:2.16.458.1.1.1.1.1"
* status = #current
* mode = #working
* code = MYRadiologyXDSContentTypeCS#radiology-report-submission "Radiology Report Submission"
* subject = Reference(MYPatientExample)
* date = "2026-03-25T10:30:00+08:00"
* source = Reference(MYPractitionerRoleExample)
* entry[0].item = Reference(MYRadiologyMHDDocumentReferenceExample)

Instance: MYRadiologyMHDReportBinaryExample
InstanceOf: Binary
Usage: #example
Description: "Example Binary resource representing packaged report content for document sharing."
* id = "my-radiology-mhd-report-binary-example"
* contentType = #application/pdf
* data = "JVBERi0xLjQK"

Instance: MYRadiologyMHDProvideDocumentBundleExample
InstanceOf: Bundle
Usage: #example
Description: "Example ITI-65 Provide Document Bundle transaction containing a SubmissionSet, DocumentReference, and Binary payload."
* id = "my-radiology-mhd-provide-document-bundle-example"
* type = #transaction
* entry[0].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/List/my-radiology-mhd-submission-set-example"
* entry[0].resource = MYRadiologyMHDSubmissionSetExample
* entry[0].request.method = #POST
* entry[0].request.url = "List"
* entry[1].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/DocumentReference/my-radiology-mhd-document-reference-example"
* entry[1].resource = MYRadiologyMHDDocumentReferenceExample
* entry[1].request.method = #POST
* entry[1].request.url = "DocumentReference"
* entry[2].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Binary/my-radiology-mhd-report-binary-example"
* entry[2].resource = MYRadiologyMHDReportBinaryExample
* entry[2].request.method = #POST
* entry[2].request.url = "Binary"

Instance: MYRadiologyMHDAuditEventExample
InstanceOf: MYRadiologyMHDAuditEvent
Usage: #example
Description: "Example audit record for a successful ITI-65 Provide Document Bundle transaction."
* id = "my-radiology-mhd-audit-event-example"
* type = $DICOMONT#110106 "Export"
* subtype[0] = $IHEMHDEventType#ITI-65 "Provide Document Bundle"
* action = #C
* recorded = "2026-03-25T10:30:05+08:00"
* outcome = #0
* agent[0].requestor = true
* agent[0].who.display = "Hospital Sultan Abdul Halim RIS"
* agent[0].network.address = "ris.hospital.moh.gov.my"
* agent[1].requestor = false
* agent[1].who.display = "National MHD Gateway"
* agent[1].network.address = "gateway.myehr.kkmhub.moh.gov.my"
* source.observer.display = "National MHD Gateway"
* entity[0].what = Reference(MYPatientExample)
* entity[1].what = Reference(MYRadiologyMHDSubmissionSetExample)
* entity[2].what = Reference(MYRadiologyMHDDocumentReferenceExample)

Instance: MYRadiologyRadioConnectSyncBundleExample
InstanceOf: Bundle
Usage: #example
Description: "Example direct-RIS searchset bundle returned by the optional impacs-ris-sync operation."
* id = "my-radiology-radioconnect-sync-bundle-example"
* type = #searchset
* total = 3
* link[0].relation = "self"
* link[0].url = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/$impacs-ris-sync?from=2026-03-22T00:00:00Z&to=2026-03-22T02:00:00Z&_count=50&_page=1&patientId=RIS-12345"
* entry[0].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Patient/my-patient-example"
* entry[0].resource = MYPatientExample
* entry[0].search.mode = #include
* entry[1].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Practitioner/my-practitioner-example"
* entry[1].resource = MYPractitionerExample
* entry[1].search.mode = #include
* entry[2].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/PractitionerRole/my-practitioner-role-example"
* entry[2].resource = MYPractitionerRoleExample
* entry[2].search.mode = #include
* entry[3].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Organization/my-organisation-example"
* entry[3].resource = MYOrganisationExample
* entry[3].search.mode = #include
* entry[4].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Location/my-location-example"
* entry[4].resource = MYLocationExample
* entry[4].search.mode = #include
* entry[5].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Encounter/my-encounter-example"
* entry[5].resource = MYEncounterExample
* entry[5].search.mode = #include
* entry[6].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Endpoint/my-radiology-dicomweb-endpoint-example"
* entry[6].resource = MYRadiologyDicomWebEndpointExample
* entry[6].search.mode = #include
* entry[7].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/ServiceRequest/my-radiology-service-request-example"
* entry[7].resource = MYRadiologyServiceRequestExample
* entry[7].search.mode = #match
* entry[8].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Procedure/my-radiology-procedure-example"
* entry[8].resource = MYRadiologyProcedureExample
* entry[8].search.mode = #include
* entry[9].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/ImagingStudy/my-radiology-imaging-study-example"
* entry[9].resource = MYRadiologyImagingStudyExample
* entry[9].search.mode = #match
* entry[10].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/Observation/my-radiology-observation-example"
* entry[10].resource = MYRadiologyObservationExample
* entry[10].search.mode = #include
* entry[11].fullUrl = "https://sandbox.myehr.kkmhub.moh.gov.my/fhir/DiagnosticReport/my-radiology-diagnostic-report-example"
* entry[11].resource = MYRadiologyDiagnosticReportExample
* entry[11].search.mode = #match

Instance: MYRadiologyRadioConnectAccessionMismatchOOExample
InstanceOf: OperationOutcome
Usage: #example
Description: "Example invariant failure response for a direct-RIS payload where study and order accession linkage is missing or inconsistent."
* id = "my-radiology-radioconnect-accession-mismatch-oo-example"
* issue[0].severity = #error
* issue[0].code = #invariant
* issue[0].details.text = "Accession match rule failed: ImagingStudy.identifier[ACSN] does not match ServiceRequest.identifier[ACSN]."
* issue[0].diagnostics = "The receiving consumer could not reconcile the study to the originating order because the accession identifier was missing or inconsistent."
* issue[0].expression[0] = "ImagingStudy.identifier"

