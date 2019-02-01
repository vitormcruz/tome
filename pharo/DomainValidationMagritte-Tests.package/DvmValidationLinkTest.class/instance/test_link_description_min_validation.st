tests
test_link_description_min_validation

	| objectInstrumented contextHolder |
	
	contextHolder := self applyLink: (MANumberDescription new accessor: #p1; min: 20; asGeneratedValidationMetaLink) 
	                      toSelector: #p1:
		                   ofClass: DvmClassToLinkValidations.
		
	objectInstrumented := DvmClassToLinkValidations new.
	objectInstrumented p1: 19.
	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errors asArrayOfRows 
	     hasSameElements: { { DvmClassToLinkValidations name, '.p1.min'. objectInstrumented. contextHolder contents. } }.


