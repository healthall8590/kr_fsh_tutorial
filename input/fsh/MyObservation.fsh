Profile: MyObservation
Parent: Observation
Id: profilingtutorial-myobservation
Title: "MyObservation"
Description: "Profiling Tutorial을 위해 작성한 Observation Profile"

* code ^short = "생체징후 측정 코드"
* code from MyObsValueSet (extensible)
* code ^binding.description = "Observation Codes for Tutorial"
* code.coding ^short = "정의된 코드"
* code.coding.system 1..
* code.coding.system ^short = "코드체계 식별자"
* code.coding.code 1..
* code.coding.code ^short = "코드값"
* code.coding.display ^short = "코드명칭"

* component 1..
* component ^short = "혈압 측정 결과."
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code.coding.code"
* component ^slicing.rules = #open
* component contains
    Systolic 0..1 and
    Diastolic 0..1
//  Systolic: 수축기
* component[Systolic] ^short = "수축기 혈압 측정."
* component[Systolic].code.coding.system = "http://loinc.org" (exactly)
* component[Systolic].code.coding.code 1..1
* component[Systolic].code.coding.code = #8480-6 (exactly)
* component[Systolic].value[x] only Quantity
* component[Systolic].value[x].value 1..1
* component[Systolic].value[x].system 1..1
* component[Systolic].value[x].system = "http://unitsofmeasure.org" (exactly)
* component[Systolic].value[x].code 1..1
* component[Systolic].value[x].code = #mm[Hg] (exactly)
//  Diastolic: 이완기
* component[Diastolic] ^short = "이완기 혈압 측정."
* component[Diastolic].code.coding.system = "http://loinc.org" (exactly)
* component[Diastolic].code.coding.code 1..1
* component[Diastolic].code.coding.code = #8462-4 (exactly)
* component[Diastolic].value[x] only Quantity
* component[Diastolic].value[x].value 1..1
* component[Diastolic].value[x].system 1..1
* component[Diastolic].value[x].system = "http://unitsofmeasure.org" (exactly)
* component[Diastolic].value[x].code 1..1
* component[Diastolic].value[x].code = #mm[Hg] (exactly)