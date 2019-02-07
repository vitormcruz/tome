as yet unclassified
validateOperation: operation ofObject: instrumentedObject sentWith: arguments andRunningWithingContext: context
	""

	| validationObserver |
	validationObserver := SimpleValidationObserver new.
	magritteDescription executeValidationsOn: instrumentedObject 
							  for: (LinkedList newFrom: arguments) 
							  withingContext: context.
							
	validationObserver isValidationSuccessful ifTrue: [ ^ operation value ].
	^ instrumentedObject.
