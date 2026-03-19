# Terminology And Identifiers

## Terminology policy position

The first draft adopts existing international terminology systems wherever practical and avoids introducing local Ministry of Health code systems before national approval. RadLex is the preferred current basis for the imaging procedure catalogue, while SNOMED CT, LOINC, UCUM, ICD families, and DICOM terminology remain in scope.

## Terminology use by domain

| Domain | Preferred basis in this draft | Published artefact or note |
| --- | --- | --- |
| Imaging procedure catalogue | RadLex local mirror strategy | [MY Radiology Procedure Code ValueSet](ValueSet-my-radiology-procedure-code-vs.html), [RadLex mirror placeholder](CodeSystem-my-radlex-procedure-mirror.html) |
| Modality representation | DICOM terminology | [MY Radiology Modality ValueSet](ValueSet-my-radiology-modality-vs.html) |
| Report typing | LOINC | [MY Radiology Report Code ValueSet](ValueSet-my-radiology-report-code-vs.html) |
| Structured findings | SNOMED CT and LOINC envelope | [MY Radiology Finding Code ValueSet](ValueSet-my-radiology-finding-code-vs.html) |
| Quantitative units | UCUM | Referenced by policy; not yet constrained in a dedicated value set |
| Diagnosis and problem coding | ICD-10, ICD-11, SNOMED CT | Policy guidance only in this draft |
| Procedure and intervention coding beyond orderables | ICD-10-PCS, ICD-9-CM, ICHI | Policy guidance only in this draft |

## Hosting assumptions

- primary on-premise terminology root: `https://terminology.kkmhub.moh.gov.my`
- ICD-11 remains resolved through the WHO API
- RadLex local hosting remains a `PROVISIONAL` mirror strategy until the national hosting arrangement is approved
- no local Ministry of Health code systems are defined in this first draft

## Identifier publication model

Identifier resources in this guide are published as `NamingSystem` artefacts so that partners can distinguish:

- the identifier system URI
- the identifier value format
- the issuing authority
- the display or presentation rules

The published placeholder naming systems are:

- [Patient Identifier Naming System](NamingSystem-MYPatientIdentifierNamingSystem.html)
- [Facility Identifier Naming System](NamingSystem-MYFacilityIdentifierNamingSystem.html)
- [Healthcare Worker Identifier Naming System](NamingSystem-MYHealthcareWorkerIdentifierNamingSystem.html)
- [Accession Identifier Naming System](NamingSystem-MYAccessionIdentifierNamingSystem.html)
- [Radiology Order Identifier Naming System](NamingSystem-MYRadiologyOrderIdentifierNamingSystem.html)

## Accession identifier policy

The accession identifier system is not yet nationally fixed. This guide keeps multiple candidate patterns visible for governance purposes and recommends `FACILITYCODE-YYYYMMDD-SEQUENCE` as the pragmatic sandbox option because it supports local generation, traceability, and operational uniqueness.

The published accession policy artefacts are:

- [MY Radiology Accession Pattern CodeSystem](CodeSystem-my-radiology-accession-pattern-cs.html)
- [MY Radiology Accession Pattern ValueSet](ValueSet-my-radiology-accession-pattern-vs.html)

## Additional repository notes

- [Identifier strategy mapping note](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/mappings/identifiers.md)
- [Order identifier and accession note](https://github.com/datateamdigitalhealthdivision/myehr-radiology-conformance/blob/main/mappings/order-id-and-accession.md)
