tests
test_link_description_required_validation
	| validationMetaLink objectValidated |

	validationMetaLink := MAStringDescription new	accessor: #p1; required: true; asGeneratedValidationMetaLink.
	(DVM_ClassToLinkValidations >> #p1:) ast link: validationMetaLink.
	objectValidated := DVM_ClassToLinkValidations new.	
	objectValidated p1: nil.
	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assert: validationObserver errors equals: {('p1.required' -> {('issuer' -> objectValidated)} asDictionary)} asDictionary