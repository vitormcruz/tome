tests - empty
test_empty_validation_true_on_filled_collection

	| validation |
	
	validation := DvmValidationPropertyMapper empty: true.
	self assert: (validation value: {'dummy'}).
