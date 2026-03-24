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

CodeSystem: MYRadiologyTaskStatusReasonCS
Id: my-radiology-task-status-reason-cs
Title: "MY Radiology Task Status Reason CodeSystem"
Description: "Starter operational reasons for rejection, suspension, rescheduling, or workflow exception handling."
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #patient-not-available "Patient Not Available"
* #contraindication "Contraindication"
* #equipment-failure "Equipment Failure"
* #patient-declined "Patient Declined"
* #rescheduled "Rescheduled"
* #incorrect-order "Incorrect Order"
* #not-fasted "Not Fasted"

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
* #RADLEX-CT-CHEST-WO "CT chest without contrast"
* #RADLEX-CT-CHEST-WO ^definition = "EXAMPLE ONLY placeholder code included to support starter ConceptMap publication."
* #RADLEX-XR-CHEST-2V "Chest radiography 2 views"
* #RADLEX-XR-CHEST-2V ^definition = "EXAMPLE ONLY placeholder code included to support starter ConceptMap publication."
* #RADLEX-MR-BRAIN-WO "MR brain without contrast"
* #RADLEX-MR-BRAIN-WO ^definition = "EXAMPLE ONLY placeholder code included to support starter ConceptMap publication."
