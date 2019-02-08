tests
test_generated_min_validation_execution_fail

	self using: (#min -> 20	asValidationForParam: #param1 indexedAt: 1) 
		  validate: 19 
		  andExpect: (self expectedErrorForValidation: 'min' andParameter: 'param1').