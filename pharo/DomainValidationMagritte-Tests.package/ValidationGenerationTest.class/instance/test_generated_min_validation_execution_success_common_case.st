tests
test_generated_min_validation_execution_success_common_case
	
	self using: (#min -> 20	asGeneratedValidationForParamNamed: #param1) 
		  validateExpectingSucess: 21.