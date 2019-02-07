tests
test_link_description_N_param_keyword_method_validation

	| objectInstrumented contextHolder |
								
	contextHolder := self applyLink: (MAMethodDescription new whereParams: { MAStringDescription new accessor: #p1; required: true.
	 																		 					  MANumberDescription new accessor: #p2; min: 20.
																								  MANumberDescription new accessor: #p3; min: 45
																								 }; asGeneratedValidationMetaLink) 
                         toSelector: #p1:p2:p3:																
                         ofClass: DvmClassToLinkValidations.
		  
	objectInstrumented := DvmClassToLinkValidations new.
	objectInstrumented p1: nil p2: 19 p3: 44.
	
 	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errors 
	     hasSameElements: {{ DvmClassToLinkValidations name, '.p1.required'. objectInstrumented. contextHolder contents. }.
								 { DvmClassToLinkValidations name, '.p2.min'. objectInstrumented. contextHolder contents. }. 
                          { DvmClassToLinkValidations name, '.p3.min'. objectInstrumented. contextHolder contents. }. 
								}.
