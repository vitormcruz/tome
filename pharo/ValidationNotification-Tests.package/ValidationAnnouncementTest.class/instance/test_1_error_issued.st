tests-issue-error
test_1_error_issued

	| validationObserver |

	validationObserver := TestObserver new.
	self issueError: 'Test error 1'.
	self assertBlock: [ validationObserver isSuccessful not ].
	self assertBlock: [ validationObserver errors = { 'Test error 1' -> {'issuer' -> self } asDictionary } asDictionary ].
	
	
	

	