tests
test_registered_and_still_used_validation_observer

	| validationObserver |
	
	validationObserver := TestObserver new. "Hold instance so that GC cannot reclaim it."
	ApplicationValidationNotifier addValidationObserver: TestObserver new.
	self assertBlock: [ ApplicationValidationNotifier observers isNotEmpty ].