tests
test_notification_with_one_observer

	| validationObserver |
	
	validationObserver := TestObserver new.
	ApplicationValidationNotifier addValidationObserver: TestObserver new.
	
	
	
	self assertBlock: [ ApplicationValidationNotifier observers isNotEmpty ].