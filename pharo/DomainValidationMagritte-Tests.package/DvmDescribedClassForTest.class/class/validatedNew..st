as yet unclassified
validatedNew: aInstanceCreationBlock

	| validationObserver newInstance |
	
	validationObserver := SimpleValidationObserver new.
	newInstance := aInstanceCreationBlock value.
	validationObserver isValidationSuccessful ifTrue: [ ^ newInstance  ] ifFalse: [ ^ NilObject new ].
	