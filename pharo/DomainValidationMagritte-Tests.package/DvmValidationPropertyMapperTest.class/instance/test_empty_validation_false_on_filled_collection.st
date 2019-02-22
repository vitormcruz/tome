tests - empty
test_empty_validation_false_on_filled_collection

	| validation |
	
	validation := DvmValidationPropertyMapper empty: false.
	self assert: (validation value: {'dummy'}).