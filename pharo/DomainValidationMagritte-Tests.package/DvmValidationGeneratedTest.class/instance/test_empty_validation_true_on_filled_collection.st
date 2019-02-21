tests
test_empty_validation_true_on_filled_collection

	self using: (#empty -> false asValidationForParam: #param1 indexedAt: 1) 
		  validateExpectingSucess: {'dummy'}.