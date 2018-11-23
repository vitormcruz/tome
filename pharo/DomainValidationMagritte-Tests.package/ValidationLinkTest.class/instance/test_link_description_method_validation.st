tests
test_link_description_method_validation
								
	self applyLink: (MAMethodDescription new whereParams: { MAStringDescription new accessor: #p1; required: true.
	 																		 MANumberDescription new accessor: #p2; min: 20 }; asGeneratedValidationMetaLink) 
		  intoObject: DVM_ClassToLinkValidations new
		  andDoWithIt: [ :objectInstrumented : contextHolder |
				objectInstrumented p1: nil p2: 19.
 				self assertBlock: [ validationObserver isValidationSuccessful not ].
				self assertCollection: validationObserver errors asArrayOfRows 
				     hasSameElements: {
											    { DVM_ClassToLinkValidations name, '.p1.required'. objectInstrumented. contextHolder contents. }.
											    { DVM_ClassToLinkValidations name, '.p2.min'. objectInstrumented. contextHolder contents. } 
											}.
		  ]
