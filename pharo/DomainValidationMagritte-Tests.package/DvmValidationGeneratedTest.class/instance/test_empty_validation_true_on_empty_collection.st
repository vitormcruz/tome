tests
test_empty_validation_true_on_empty_collection

	self using: (#empty -> false asValidationForParam: #param1 indexedAt: 1) 
		  validate: {} 
		  andExpect: (self expectedErrorForValidation: 'empty' andParameter: 'param1').