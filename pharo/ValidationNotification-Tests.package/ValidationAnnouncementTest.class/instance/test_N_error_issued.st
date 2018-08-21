tests-issue-error
test_N_error_issued

	| validationObserver |

	validationObserver := TestObserver new.
	self issueError: 'Test error 1'.
	self issueError: 'Test error 2'.
	self issueError: 'Test error 3'.
	self assertBlock: [ validationObserver isSuccessful not ].
	self assert:  [ validationObserver errors = { 
															  'Test error 1' -> {'issuer' -> self } asDictionary.
															  'Test error 2' -> {'issuer' -> self } asDictionary.
															  'Test error 3' -> {'issuer' -> self } asDictionary.
														    } asDictionary ]
		  description: 'The list of errors with contexts expected were not found'.
															

	
	
	

	