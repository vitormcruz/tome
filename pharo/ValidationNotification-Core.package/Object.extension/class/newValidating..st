*ValidationNotification-Core
newValidating: aBlockClosure 

	| validationObserver blockResult |
	
	validationObserver := SimpleValidationObserver new.
	blockResult := aBlockClosure value.
	validationObserver onValidationSucess: [ ^ blockResult ] 
							 onValidationError: [ :errors | ErrorObject forObject: blockResult withErrors: errors ].