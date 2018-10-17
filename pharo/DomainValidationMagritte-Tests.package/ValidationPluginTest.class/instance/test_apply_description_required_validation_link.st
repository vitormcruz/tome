tests
test_apply_description_required_validation_link

	| validationMetaLink validationObserver objectValidated |
	
	validationMetaLink := MAStringDescription new accessor: #p1:; required: true; asGeneratedValidationMetaLink.
	validationObserver := TestObserver new.
	(DVM_ClassToPlugValidations >> #p1:) ast link: validationMetaLink.
	
	objectValidated := DVM_ClassToPlugValidations new.
	objectValidated p1: nil.

	self assertBlock: [ validationObserver isSuccessful not ].
	self assertBlock: [ validationObserver errors = { 'p1.mandatory' -> {'issuer' -> objectValidated } asDictionary } asDictionary ].
	
	
	
