Invariant: my-radiology-servicerequest-order-intent
Description: "ServiceRequest.intent shall be order for this implementation guide."
* severity = #error
* expression = "intent = 'order'"

Invariant: my-radiology-servicerequest-category-imaging
Description: "A radiology ServiceRequest shall declare an imaging or radiology category code."
* severity = #error
* expression = "category.coding.where((system = 'http://terminology.hl7.org/CodeSystem/v2-0074' and code = 'RAD') or (system = 'http://snomed.info/sct' and code = '363679005')).exists()"

Invariant: my-radiology-task-completed-requires-output
Description: "A completed workflow task shall expose at least one output reference."
* severity = #error
* expression = "status = 'completed' implies output.exists()"

Invariant: my-radiology-imagingstudy-available-requires-series
Description: "An available imaging study shall publish series detail."
* severity = #error
* expression = "status = 'available' implies series.exists()"

Invariant: my-radiology-imagingstudy-available-requires-endpoint
Description: "An available imaging study shall publish at least one DICOMweb retrieval endpoint."
* severity = #error
* expression = "status = 'available' implies endpoint.exists()"

Invariant: my-radiology-imagingstudy-numberofseries-matches
Description: "When numberOfSeries is populated it shall equal the number of series elements carried in the resource."
* severity = #error
* expression = "numberOfSeries.exists() implies numberOfSeries = series.count()"

Invariant: my-radiology-urn-oid
Description: "Identifiers that carry nationally governed OID values shall use the urn:oid prefix."
* severity = #error
* expression = "$this.matches('^urn:oid:[0-2](\\\\.\\\\d+)+$')"

Invariant: my-radiology-dicom-urn-oid
Description: "DICOM UID identifiers published in FHIR shall use the urn:oid prefix."
* severity = #error
* expression = "$this.matches('^urn:oid:[0-2](\\\\.\\\\d+)+$')"

Invariant: my-radiology-dicom-oid
Description: "DICOM Series Instance UID and SOP Instance UID values shall be encoded directly as dotted numeric OIDs."
* severity = #error
* expression = "$this.matches('^[0-2](\\\\.\\\\d+)+$')"

Invariant: my-radiology-report-category-rad
Description: "DiagnosticReport.category shall include the HL7 v2 RAD category code."
* severity = #error
* expression = "category.coding.where(system = 'http://terminology.hl7.org/CodeSystem/v2-0074' and code = 'RAD').exists()"

Invariant: my-radiology-report-final-requires-conclusion-and-times
Description: "A final radiology report shall include a conclusion, effective time, and issued time."
* severity = #error
* expression = "status = 'final' implies conclusion.exists() and effective.exists() and issued.exists()"

Invariant: my-radiology-report-final-requires-pdf-presentedform
Description: "A final radiology report shall expose at least one PDF rendered form."
* severity = #error
* expression = "status = 'final' implies presentedForm.where(contentType = 'application/pdf').exists()"

Invariant: my-radiology-documentreference-masteridentifier-oid
Description: "DocumentReference.masterIdentifier shall carry an OID-based XDS document unique identifier using urn:ietf:rfc:3986 and a urn:oid value."
* severity = #error
* expression = "masterIdentifier.system = 'urn:ietf:rfc:3986' and masterIdentifier.value.matches('^urn:oid:[0-2](\\\\.\\\\d+)+$')"

Invariant: my-radiology-mhd-submissionset-identifier-oid
Description: "An MHD SubmissionSet shall contain at least one identifier using system urn:ietf:rfc:3986 and a urn:oid value."
* severity = #error
* expression = "identifier.where(system = 'urn:ietf:rfc:3986' and value.matches('^urn:oid:[0-2](\\\\.\\\\d+)+$')).exists()"
