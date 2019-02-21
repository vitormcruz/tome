tests-issue-error
test_N_error_issued

	| validationObserver |

	validationObserver := TestObserver new.
	self issueError: 'Test error 1'.
	self issueError: 'Test error 2'.
	self issueError: 'Test error 3'.
	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errorArray 
		  hasSameElements: { {'Test error 1'. self.  thisContext}.
 								   {'Test error 2'. self.  thisContext}.
								   {'Test error 3'. self.  thisContext} }.

															

	
	
	

	