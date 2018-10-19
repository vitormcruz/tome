tests
test_generated_required_false_validation

	self using: (#required -> false asGeneratedValidationForParamNamed: #param1) 
		  andExpectingSucessValidate: nil.
