as yet unclassified
execute: aBlockClosureUnderValidation onValidationError: aBlockClosure 

	| result |
	
	result := aBlockClosureUnderValidation value.
	self onValidationSucess: [^ result ] 
		  onValidationError: [aBlockClosure value: self errors]