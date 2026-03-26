ValueSet: MYRadiologyXDSClassCodeVS
Id: my-radiology-xds-class-code-vs
Title: "MY Radiology XDS Class Code ValueSet"
Description: "Required classCode values for radiology document classification in MHD and XDS-aligned exchange."
* ^status = #draft
* ^experimental = false
* include codes from system MYRadiologyXDSClassCodeCS

ValueSet: MYRadiologyXDSFormatCodeVS
Id: my-radiology-xds-format-code-vs
Title: "MY Radiology XDS Format Code ValueSet"
Description: "Required IHE formatCode values for packaged radiology documents."
* ^status = #draft
* ^experimental = false
* $IHEFormatCode#urn:ihe:rad:TEXT "RAD TEXT"
* $IHEFormatCode#urn:ihe:rad:PDF "RAD PDF"
* $IHEFormatCode#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* $IHEFormatCode#urn:ihe:iti:xds-sd:pdf:2008 "ITI XDS-SD PDF"
* $IHEFormatCode#urn:ihe:rad:CDA:ImagingReportStructuredHeadings:2013 "RAD CDA"

ValueSet: MYRadiologyXDSFacilityTypeVS
Id: my-radiology-xds-facility-type-vs
Title: "MY Radiology XDS Facility Type ValueSet"
Description: "Required facility-type values for radiology document sharing metadata."
* ^status = #draft
* ^experimental = false
* include codes from system MYRadiologyXDSFacilityTypeCS

ValueSet: MYRadiologyXDSPracticeSettingVS
Id: my-radiology-xds-practice-setting-vs
Title: "MY Radiology XDS Practice Setting ValueSet"
Description: "Required practice-setting values for radiology document sharing metadata."
* ^status = #draft
* ^experimental = false
* include codes from system MYRadiologyXDSPracticeSettingCS

ValueSet: MYRadiologyXDSConfidentialityVS
Id: my-radiology-xds-confidentiality-vs
Title: "MY Radiology XDS Confidentiality ValueSet"
Description: "Required confidentiality codes for radiology document sharing metadata."
* ^status = #draft
* ^experimental = false
* $V3Conf#N "Normal"
* $V3Conf#R "Restricted"
* $V3Conf#V "Very Restricted"

ValueSet: MYRadiologyXDSContentTypeVS
Id: my-radiology-xds-content-type-vs
Title: "MY Radiology XDS Content Type ValueSet"
Description: "Required SubmissionSet content-type values for radiology document sharing."
* ^status = #draft
* ^experimental = false
* include codes from system MYRadiologyXDSContentTypeCS

ValueSet: MYRadiologyXDSEventCodeVS
Id: my-radiology-xds-event-code-vs
Title: "MY Radiology XDS Event Code ValueSet"
Description: "Extensible eventCode values for radiology document sharing, reusing the modality vocabulary so consumers can filter by modality or imaging event type."
* ^status = #draft
* ^experimental = false
* $DICOMONT#CT "Computed Tomography"
* $DICOMONT#MR "Magnetic Resonance"
* $DICOMONT#US "Ultrasound"
* $DICOMONT#DX "Digital Radiography"
