tests-registration
test_registered_but_unused_validation_observer

	TestObserver new.
	self assertUntilTrue: [ Smalltalk garbageCollect.
						  		   ValidationAnnouncement observers isEmpty ] forAtMost: 1 second asMilliSeconds.