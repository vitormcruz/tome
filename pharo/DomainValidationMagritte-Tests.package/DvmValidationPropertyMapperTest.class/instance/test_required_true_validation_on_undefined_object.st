tests - required
test_required_true_validation_on_undefined_object

	| validation |
	
	validation := DvmValidationPropertyMapper required: true.
	self deny: (validation value: nil).		