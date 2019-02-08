tests
test_generated_min_validation_execution_success_boundary
	| generatedValidation |

	
	generatedValidation := #min -> 20	asValidationForParam: #param1 indexedAt: 1.
	self using: generatedValidation validateExpectingSucess: 20.