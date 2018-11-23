tests
test_link_description_method_validation
	| validationMetaLink objectValidated |

	validationMetaLink := MAMethodDescription new	whereParams: { MAStringDescription new accessor: #p1; required: true.
																					MANumberDescription new accessor: #p2; min: 20 }; asGeneratedValidationMetaLink.
																					
	(DVM_ClassToLinkValidations >> #p1:p2:) ast link: validationMetaLink.
	objectValidated := DVM_ClassToLinkValidations new.	
	objectValidated p1: nil p2: 19.
	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errors asArrayOfRows 
		  hasSameElements: { {'p1.required'. objectValidated. nil.}.
								  {'p2.min'.       objectValidated. nil.} }.
