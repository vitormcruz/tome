tests - required
test_required_true_validation_on_defined_object

	| validation |
	
	validation := DvmValidationPropertyMapper required: true.
	self assert: (validation value: 'Some Object').		