CodeSystem: MYRadiologyWorkflowStateCS
Id: my-radiology-workflow-state-cs
Title: "MY Radiology Workflow State CodeSystem"
Description: "Technical workflow state codes for radiology Task.businessStatus in sandbox and conformance testing scenarios."
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #received "Received"
* #accepted "Accepted"
* #scheduled "Scheduled"
* #in-progress "In Progress"
* #completed "Completed"
* #cancelled "Cancelled"
* #rejected "Rejected"
* #amended "Amended"

CodeSystem: MYRadiologyAccessionPatternCS
Id: my-radiology-accession-pattern-cs
Title: "MY Radiology Accession Pattern CodeSystem"
Description: "Draft policy options for accession identifier patterns. These codes describe candidate strategies rather than final national production policy."
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #facility-date-sequence "Facility-Date-Sequence"
* #facility-date-sequence ^definition = "Pattern FACILITYCODE-YYYYMMDD-SEQUENCE."
* #facility-modality-date-sequence "Facility-Modality-Date-Sequence"
* #facility-modality-date-sequence ^definition = "Pattern FACILITYCODE-MODALITY-YYYYMMDD-SEQUENCE."
* #uuid-with-alias "UUID With Alias"
* #uuid-with-alias ^definition = "Pattern using a centrally minted UUID with a human-readable alias."

CodeSystem: MYRadLexProcedureMirror
Id: my-radlex-procedure-mirror
Title: "MY RadLex Procedure Mirror Placeholder"
Description: "PROVISIONAL canonical placeholder for a locally hosted mirror of the RadLex imaging procedure catalogue."
* ^url = "https://terminology.kkmhub.moh.gov.my/CodeSystem/radlex-imaging-procedures"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = false
* ^content = #fragment
* #RADLEX-CT-HEAD-WO "CT head without contrast"
* #RADLEX-CT-HEAD-WO ^definition = "EXAMPLE ONLY placeholder code carried in this repository so the sample radiology workflow instances can validate before the full RadLex mirror is hosted locally."
