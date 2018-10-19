tests
test_generated_min_validation_success_boundary
	| generatedValidation |

	
	generatedValidation := #min -> 20	asGeneratedValidationForParamNamed: #param1.
	self using: generatedValidation andExpectingSucessValidate: 20.