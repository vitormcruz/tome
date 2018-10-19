tests
test_generated_min_validation_success_common_case
	
	self using: (#min -> 20	asGeneratedValidationForParamNamed: #param1) 
		  andExpectingSucessValidate: 21.