tests - min
test_min_validation_on_lesser_value

	| validation |
	
	validation := DvmValidationPropertyMapper min: 20.
	self deny: (validation value: 19).