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
Description: "Preferred imaging procedure catalogue binding using a provisional locally hosted RadLex mirror strategy."
* ^status = #draft
* ^experimental = false
* include codes from system $MYRADLEXPROC

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
Description: "Representative LOINC document and report codes suitable for radiology report exchange."
* ^status = #draft
* ^experimental = false
* $LNC#18748-4 "Diagnostic imaging study"

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
