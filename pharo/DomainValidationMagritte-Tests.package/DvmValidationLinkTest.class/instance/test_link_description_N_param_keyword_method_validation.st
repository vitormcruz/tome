tests
test_link_description_N_param_keyword_method_validation

	| objectInstrumented contextHolder |
								
	contextHolder := self applyLink: (MAMethodDescription whereParams: { MAStringDescription new paramSelector: #p1; required: true.
	 																		 				 MANumberDescription new paramSelector: #p2; min: 20.
																							 MANumberDescription new paramSelector: #p3; min: 45
																							}) asGeneratedValidationMetaLink 
                         toSelectorAst: DvmClassToLinkValidations >> #p1:p2:p3:.
		  
	objectInstrumented := DvmClassToLinkValidations new.
	objectInstrumented p1: nil p2: 19 p3: 44.
	
 	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errorArray 
	     hasSameElements: {{ DvmClassToLinkValidations name, '.p1:p2:p3:.p1.required'. objectInstrumented. contextHolder contents. }.
								 { DvmClassToLinkValidations name, '.p1:p2:p3:.p2.min'. objectInstrumented. contextHolder contents. }. 
                          { DvmClassToLinkValidations name, '.p1:p2:p3:.p3.min'. objectInstrumented. contextHolder contents. }. 
								}.
