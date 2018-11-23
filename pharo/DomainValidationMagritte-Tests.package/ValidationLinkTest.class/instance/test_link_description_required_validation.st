tests
test_link_description_required_validation

	self applyLink: (MAStringDescription new	accessor: #p1; required: true; asGeneratedValidationMetaLink)
		  intoObject: DVM_ClassToLinkValidations new 
		  andDoWithIt: [ :objectInstrumented : contextHolder |
            objectInstrumented p1: nil.
				self assertBlock: [ validationObserver isValidationSuccessful not ].
				self assertCollection: validationObserver errors asArrayOfRows  
				     hasSameElements: { { DVM_ClassToLinkValidations name, '.p1.required'. objectInstrumented. contextHolder contents. } }.		      
		  ]

