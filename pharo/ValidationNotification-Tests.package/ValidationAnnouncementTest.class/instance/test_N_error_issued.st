tests-issue-error
test_N_error_issued

	| validationObserver |

	validationObserver := TestObserver new.
	self issueError: 'Test error 1'.
	self issueError: 'Test error 2'.
	self issueError: 'Test error 3'.
	self assertBlock: [ validationObserver isSuccessful not ].
	self assertCollection: validationObserver errors asArrayOfRows 
		  hasSameElements: { {'Test error 1'. self.  nil}.
 								   {'Test error 2'. self.  nil}.
								   {'Test error 3'. self.  nil} }.

															

	
	
	

	