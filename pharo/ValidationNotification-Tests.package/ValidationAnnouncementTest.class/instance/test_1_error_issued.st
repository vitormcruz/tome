tests-issue-error
test_1_error_issued

	| validationObserver |

	validationObserver := TestObserver new.
	self issueError: 'Test error 1'.
	self assertBlock: [ validationObserver isValidationSuccessful not ].
	self assertCollection: validationObserver errors asArrayOfRows 
		  hasSameElements: { {'Test error 1'. self. thisContext } }.
	
	
	

	