tests
test_generated_validation_failure

	self using: (#required -> true asValidationForParam: #param1 indexedAt: 1) 
		  validate: nil
		  andExpect: (self expectedErrorForValidation: 'required' andParameter: 'param1').		
		
