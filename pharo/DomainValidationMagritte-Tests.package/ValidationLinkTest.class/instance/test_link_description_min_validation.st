tests
test_link_description_min_validation
	| validationMetaLink objectValidated |

	validationMetaLink := MANumberDescription new	accessor: #p1; min: 20; asGeneratedValidationMetaLink.
	(DVM_ClassToPlugValidations >> #p1:) ast link: validationMetaLink.
	objectValidated := DVM_ClassToPlugValidations new.	
	objectValidated p1: 19.
	self assertBlock: [ validationObserver isSuccessful not ].
	self assert: validationObserver errors equals: {('p1.min' -> {('issuer' -> objectValidated)} asDictionary)} asDictionary