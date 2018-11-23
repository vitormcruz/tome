tests
test_generated_required_true_validation_execution_when_value_is_nil

	self using: (#required -> true asGeneratedValidationForParamNamed: #param1) 
		  validate: nil
		  andExpect: (self expectedErrorForValidation: 'required' andParameter: 'param1').		
		
