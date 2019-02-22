tests - required
test_required_false_validation_on_undefined_object

	| validation |
	
	validation := DvmValidationPropertyMapper required: false.
	self assert: (validation value: nil).		