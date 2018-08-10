tests
test_registered_but_unused_validation_observer

	ApplicationValidationNotifier addValidationObserver: TestObserver new.
	
	self assertUntilTrue: [ Smalltalk garbageCollect.
						  		   ApplicationValidationNotifier observers isEmpty ] forAtMost: 1 second asMilliSeconds.