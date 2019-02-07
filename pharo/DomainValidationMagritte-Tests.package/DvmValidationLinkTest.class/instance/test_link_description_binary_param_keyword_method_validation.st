tests
test_link_description_binary_param_keyword_method_validation

	| objectInstrumented contextHolder |
								
	contextHolder := self applyLink: (MAMethodDescription new whereParams: { MAStringDescription new accessor: #p1; required: true.
	 																		 					  MANumberDescription new accessor: #p2; min: 20 
																								 }; asGeneratedValidationMetaLink) 
                         toSelector: #p1:p2:																
                         ofClass: DvmClassToLinkValidations.
		  
	objectInstrumented := DvmClassToLinkValidations new.
	objectInstrumented p1: nil p2: 19.
	
 	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errors 
	     hasSameElements: {{ DvmClassToLinkValidations name, '.p1.required'. objectInstrumented. contextHolder contents. }.
								  { DvmClassToLinkValidations name, '.p2.min'. objectInstrumented. contextHolder contents. } }.
