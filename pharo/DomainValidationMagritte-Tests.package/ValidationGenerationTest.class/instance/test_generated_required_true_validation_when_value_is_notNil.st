tests
test_generated_required_true_validation_when_value_is_notNil

	self using: (#required -> true asGeneratedValidationForParamNamed: #param1) 
		  andExpectingSucessValidate: 10.
		
