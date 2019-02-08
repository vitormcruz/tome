tests
test_generated_min_validation_execution_success_common_case
	
	self using: (#min -> 20	asValidationForParam: #param1 indexedAt: 1) 
		  validateExpectingSucess: 21.