tests
test_required_validation_generation

	| fakeObjectValidated generatedValidation |
	fakeObjectValidated := Object new.
	generatedValidation := (#required -> true) asGeneratedValidationForParamNamed: #param1.
	generatedValidation validate: nil for: fakeObjectValidated.
	self assert: validationObserver errors equals: { 'param1.mandatory' -> {'issuer' -> fakeObjectValidated } asDictionary } asDictionary.