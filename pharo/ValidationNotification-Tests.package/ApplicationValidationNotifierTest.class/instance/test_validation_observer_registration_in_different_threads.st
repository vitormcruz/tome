tests
test_validation_observer_registration_in_different_threads

	| validationObserver result |
	
	validationObserver := TestObserver new.
	ApplicationValidationNotifier addValidationObserver: validationObserver.
	
	[ result := ApplicationValidationNotifier observers isEmpty ] forkAndWait.

	
   self assert: result description: 'Observers should be different across processes, but the new process do not have an empty list of observers'.
	self assert: (ApplicationValidationNotifier observers includes: validationObserver) 
		  description: 'The expected validation observer was not found in the current process'.