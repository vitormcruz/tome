tests - min
test_min_validation_on_same_value

	| validation |
	
	validation := DvmValidationPropertyMapper min: 20.
	self assert: (validation value: 20).