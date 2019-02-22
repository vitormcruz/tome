tests
test_generated_validation_success

	self using: (#required -> false asValidationForParam: #param1 indexedAt: 1) 
		  validateExpectingSucess: nil.
		
	self using: (#required -> false asValidationForParam: #param1 indexedAt: 1) 
		  validateExpectingSucess: 1.		
