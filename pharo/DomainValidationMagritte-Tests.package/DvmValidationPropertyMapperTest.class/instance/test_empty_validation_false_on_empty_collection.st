tests - empty
test_empty_validation_false_on_empty_collection

	| validation |
	
	validation := DvmValidationPropertyMapper empty: false.
	self deny: (validation value: { }).