tests
test_required_false_validation_generation

	| fakeObjectValidated generatedValidation |
	fakeObjectValidated := Object new.
	generatedValidation := (#required -> false) asGeneratedValidationForParamNamed: #param1.
	generatedValidation validate: nil for: fakeObjectValidated.
	self assert: validationObserver isSuccessful. 