tests
test_link_description_required_validation

	| objectInstrumented contextHolder |
	
	contextHolder := self applyLink: (MAStringDescription new accessor: #p1; required: true; asGeneratedValidationMetaLink)
	                      toSelector: #p1:
		                   ofClass: DvmClassToLinkValidations.
		
	objectInstrumented := DvmClassToLinkValidations new.
   objectInstrumented p1: nil.

	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errorArray  
        hasSameElements: { { DvmClassToLinkValidations name, '.p1:.p1.required'. objectInstrumented. contextHolder contents. } }.