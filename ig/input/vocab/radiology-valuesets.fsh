ValueSet: MYRadiologyWorkflowStateVS
Id: my-radiology-workflow-state-vs
Title: "MY Radiology Workflow State ValueSet"
Description: "Workflow state values for radiology task synchronisation."
* ^status = #draft
* ^experimental = false
* include codes from system MYRadiologyWorkflowStateCS

ValueSet: MYRadiologyAccessionPatternVS
Id: my-radiology-accession-pattern-vs
Title: "MY Radiology Accession Pattern ValueSet"
Description: "Candidate accession identifier patterns documented for sandbox and governance purposes."
* ^status = #draft
* ^experimental = false
* include codes from system MYRadiologyAccessionPatternCS

ValueSet: MYRadiologyProcedureCodeVS
Id: my-radiology-procedure-code-vs
Title: "MY Radiology Procedure Code ValueSet"
Description: "Preferred imaging procedure catalogue binding using a provisional locally hosted RadLex mirror strategy, with starter LOINC support retained for direct-RIS retrieval and synchronisation patterns."
* ^status = #draft
* ^experimental = false
* include codes from system $MYRADLEXPROC
* $LNC#24725-4 "CT Head"
* $LNC#24627-2 "CT Chest"
* $LNC#36643-5 "XR Chest 2 Views"
* $LNC#58748-5 "Functional MR Brain"

ValueSet: MYRadiologyClinicalIndicationVS
Id: my-radiology-clinical-indication-vs
Title: "MY Radiology Clinical Indication ValueSet"
Description: "Preferred coding envelope for clinical indication on radiology orders. This draft permits SNOMED CT and ICD-10 pending finer national curation."
* ^status = #draft
* ^experimental = false
* include codes from system $SCT
* include codes from system $ICD10

ValueSet: MYRadiologyModalityVS
Id: my-radiology-modality-vs
Title: "MY Radiology Modality ValueSet"
Description: "Example modality codes aligned to DICOM terminology."
* ^status = #draft
* ^experimental = false
* $DICOMONT#CT "Computed Tomography"
* $DICOMONT#MR "Magnetic Resonance"
* $DICOMONT#US "Ultrasound"
* $DICOMONT#DX "Digital Radiography"

ValueSet: MYRadiologyReportCodeVS
Id: my-radiology-report-code-vs
Title: "MY Radiology Report Code ValueSet"
Description: "Starter LOINC radiology report codes suitable for common report exchange scenarios. This draft starter set will be expanded through national curation."
* ^status = #draft
* ^experimental = false
* $LNC#18748-4 "Diagnostic imaging study"
* $LNC#18726-0 "Radiology studies (set)"
* $LNC#24627-2 "CT Chest"
* $LNC#24725-4 "CT Head"
* $LNC#24726-2 "CT Head WO and W contrast IV"
* $LNC#24727-0 "CT Head W contrast IV"
* $LNC#36952-0 "CT Abdomen and Pelvis WO contrast"
* $LNC#72254-6 "CT Chest and Abdomen and Pelvis W contrast IV"
* $LNC#36643-5 "XR Chest 2 Views"
* $LNC#36554-4 "XR Chest Single View"
* $LNC#58748-5 "Functional MR Brain"

ValueSet: MYRadiologyFindingCodeVS
Id: my-radiology-finding-code-vs
Title: "MY Radiology Finding Code ValueSet"
Description: "Placeholder binding envelope for structured radiology findings or measurements using SNOMED CT or LOINC."
* ^status = #draft
* ^experimental = false
* $SCT#118247008 "Radiologic finding"
* $LNC#18748-4 "Diagnostic imaging study"

ValueSet: MYRadiologyDocumentTypeVS
Id: my-radiology-document-type-vs
Title: "MY Radiology Document Type ValueSet"
Description: "Document types for packaged radiology report documents."
* ^status = #draft
* ^experimental = false
* $LNC#18748-4 "Diagnostic imaging study"

ValueSet: MYRadiologyTaskStatusReasonVS
Id: my-radiology-task-status-reason-vs
Title: "MY Radiology Task Status Reason ValueSet"
Description: "Starter operational reasons for rejection, suspension, rescheduling, or workflow exception handling."
* ^status = #draft
* ^experimental = false
* include codes from system MYRadiologyTaskStatusReasonCS

ValueSet: MYRadiologyPresentedFormContentTypeVS
Id: my-radiology-presented-form-content-type-vs
Title: "MY Radiology Presented Form Content Type ValueSet"
Description: "Permitted rendered-report content types for DiagnosticReport.presentedForm in this first draft."
* ^status = #draft
* ^experimental = false
* $MimeType#application/pdf "application/pdf"
* $MimeType#text/html "text/html"
