tests
test_link_description_empty_validation

	| objectInstrumented contextHolder |
	
	contextHolder := self applyLink: (MAMagnitudeDescription new accessor: #p1; empty: false; asGeneratedValidationMetaLink) 
	                      toSelector: #p1:
		                   ofClass: DvmClassToLinkValidations.
		
	objectInstrumented := DvmClassToLinkValidations new.
	objectInstrumented p1: {}.
	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errorArray 
	     hasSameElements: { { DvmClassToLinkValidations name, '.p1:.p1.empty'. objectInstrumented. contextHolder contents. } }.


