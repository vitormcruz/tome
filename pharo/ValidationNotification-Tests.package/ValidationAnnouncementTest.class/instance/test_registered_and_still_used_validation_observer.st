tests-registration
test_registered_and_still_used_validation_observer

	| validationObserver |
	
	validationObserver := TestObserver new. "Hold instance so that GC cannot reclaim it."
	self assertBlock: [ ValidationAnnouncement observers isNotEmpty ].