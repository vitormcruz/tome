as yet unclassified
validatedNew: aInstanceCreationBlock

	| validationObserver newInstance |
	
	validationObserver := SimpleValidationObserver new.
	newInstance := aInstanceCreationBlock value.
	validationObserver onValidationSucess: [ ^ newInstance  ] 
							 onValidationError: [ :errors | ^ DvmNullObject newBecauseOfErrors: errors  whileCreatingA: self class ].
	