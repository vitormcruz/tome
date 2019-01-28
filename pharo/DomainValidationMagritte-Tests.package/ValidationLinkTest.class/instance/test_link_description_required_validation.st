tests
test_link_description_required_validation

	| objectInstrumented contextHolder |
	
	contextHolder := self applyLink: (MAStringDescription new accessor: #p1; required: true; asGeneratedValidationMetaLink)
	                      toSelector: #p1:
		                   ofClass: DVM_ClassToLinkValidations.
		
	objectInstrumented := DVM_ClassToLinkValidations new.
   objectInstrumented p1: nil.

	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errors asArrayOfRows  
        hasSameElements: { { DVM_ClassToLinkValidations name, '.p1.required'. objectInstrumented. contextHolder contents. } }.