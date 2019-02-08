link api
validateOperation: operation ofObject: instrumentedObject sentWith: parameters andRunningWithingContext: context
	""

	| validationObserver |
	validationObserver := SimpleValidationObserver new.
	
	validations do: [: validation | 
		validation validateFor: instrumentedObject 
		 		     withParamsProvided: parameters
		           fromContext: context
	].
		
	validationObserver isValidationSuccessful ifTrue: [ ^ operation value ].
	^ instrumentedObject