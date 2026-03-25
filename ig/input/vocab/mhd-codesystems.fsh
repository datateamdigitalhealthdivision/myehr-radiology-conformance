CodeSystem: MYRadiologyXDSClassCodeCS
Id: my-radiology-xds-class-code-cs
Title: "MY Radiology XDS Class Code CodeSystem"
Description: "Draft local classCode values used for radiology document sharing in MHD and XDS-aligned contexts."
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #imaging-report "Imaging Report"
* #imaging-report ^definition = "Radiology or other imaging diagnostic report."
* #imaging-order "Imaging Order"
* #imaging-order ^definition = "Request or order for an imaging procedure."
* #clinical-note "Clinical Note"
* #clinical-note ^definition = "Clinical narrative note associated with imaging."
* #admin-document "Administrative Document"
* #admin-document ^definition = "Administrative or operational imaging document."

CodeSystem: MYRadiologyXDSFacilityTypeCS
Id: my-radiology-xds-facility-type-cs
Title: "MY Radiology XDS Facility Type CodeSystem"
Description: "Draft local healthcare-facility-type values aligned to Malaysian deployment categories for document sharing."
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #hospital "Hospital"
* #hospital ^definition = "MOH or university hospital."
* #district-hospital "District Hospital"
* #district-hospital ^definition = "District-level hospital."
* #health-clinic "Health Clinic"
* #health-clinic ^definition = "Primary care health clinic (Klinik Kesihatan)."
* #specialist-centre "Specialist Centre"
* #specialist-centre ^definition = "Specialist medical centre or institute."
* #private-hospital "Private Hospital"
* #private-hospital ^definition = "Licensed private hospital."
* #private-clinic "Private Imaging Clinic"
* #private-clinic ^definition = "Private diagnostic imaging centre."
* #military-hospital "Military Hospital"
* #military-hospital ^definition = "Armed forces medical facility."
* #university-hospital "University Hospital"
* #university-hospital ^definition = "University teaching hospital."

CodeSystem: MYRadiologyXDSPracticeSettingCS
Id: my-radiology-xds-practice-setting-cs
Title: "MY Radiology XDS Practice Setting CodeSystem"
Description: "Draft local practice-setting values used for radiology document sharing."
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #radiology "Radiology"
* #interventional-radiology "Interventional Radiology"
* #nuclear-medicine "Nuclear Medicine"
* #radiation-oncology "Radiation Oncology"
* #neuroradiology "Neuroradiology"
* #paediatric-radiology "Paediatric Radiology"
* #breast-imaging "Breast Imaging"
* #emergency-radiology "Emergency Radiology"

CodeSystem: MYRadiologyXDSContentTypeCS
Id: my-radiology-xds-content-type-cs
Title: "MY Radiology XDS Content Type CodeSystem"
Description: "Draft local SubmissionSet content-type values used for MHD and XDS-aligned radiology exchange."
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* #radiology-report-submission "Radiology Report Submission"
* #radiology-report-submission ^definition = "Submission of one or more radiology reports."
* #imaging-order-submission "Imaging Order Submission"
* #imaging-order-submission ^definition = "Submission of imaging order documents."
* #clinical-update-submission "Clinical Update Submission"
* #clinical-update-submission ^definition = "Submission of updated clinical documentation."
