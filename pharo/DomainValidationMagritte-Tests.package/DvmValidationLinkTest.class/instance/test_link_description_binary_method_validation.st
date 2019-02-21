tests
test_link_description_binary_method_validation

	| objectInstrumented contextHolder |
								
	contextHolder := self applyLink: (MAMethodDescription new whereParams: { MANumberDescription new accessor: #@; min: 20. }; asGeneratedValidationMetaLink) 
                         toSelector: #@																
                         ofClass: DvmClassToLinkValidations.
		  
	objectInstrumented := DvmClassToLinkValidations new.
	objectInstrumented @ 19.
	
 	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errorArray  
	     hasSameElements: {{ DvmClassToLinkValidations name, '.@.@.min'. objectInstrumented. contextHolder contents. }}.
