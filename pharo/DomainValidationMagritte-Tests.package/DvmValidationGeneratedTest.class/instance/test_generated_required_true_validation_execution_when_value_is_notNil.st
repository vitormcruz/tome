tests
test_generated_required_true_validation_execution_when_value_is_notNil

	self using: (#required -> true asGeneratedValidationForParamNamed: #param1) 
		  validateExpectingSucess: 10.
		
