tests
test_empty_validation_true_on_nil

	self using: (#empty -> false asValidationForParam: #param1 indexedAt: 1) 
		  validate: nil 
		  andExpect: (self expectedErrorForValidation: 'empty' andParameter: 'param1').