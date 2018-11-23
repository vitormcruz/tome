tests
test_link_description_min_validation
	self applyLink: (MANumberDescription new accessor: #p1; min: 20; asGeneratedValidationMetaLink) 
		  intoObject: DVM_ClassToLinkValidations new
		  andDoWithIt: [ :objectInstrumented : contextHolder |
		      objectInstrumented p1: 19.
 				self assertBlock: [ validationObserver isValidationSuccessful not ].
				self assertCollection: validationObserver errors asArrayOfRows 
				     hasSameElements: { { DVM_ClassToLinkValidations name, '.p1.min'. objectInstrumented. contextHolder contents. } }.
		  ]

