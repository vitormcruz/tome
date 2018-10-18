validation
validate: parameter for: instrumentedObject
	
	^ (valueExpectedInValidation perform: validationSelector with: parameter) 
		ifFalse: [ instrumentedObject issueError: validatedParamName , '.mandatory'. ]; 
		yourself.
