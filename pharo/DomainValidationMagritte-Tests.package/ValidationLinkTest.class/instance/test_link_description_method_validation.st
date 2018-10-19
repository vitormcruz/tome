tests
test_link_description_method_validation
	| validationMetaLink objectValidated |

	validationMetaLink := MAMethodDescription new	whereParams: { MAStringDescription new accessor: #p1; required: true.
																					MANumberDescription new accessor: #p2; min: 20 }; asGeneratedValidationMetaLink.
																					
	(DVM_ClassToPlugValidations >> #p1:p2:) ast link: validationMetaLink.
	objectValidated := DVM_ClassToPlugValidations new.	
	objectValidated p1: nil p2: 20.
	self assertBlock: [ validationObserver isSuccessful not ].
	self assert: validationObserver errors equals: {('p1.required' -> {('issuer' -> objectValidated)} asDictionary)} asDictionary