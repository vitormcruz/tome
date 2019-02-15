as yet unclassified
execute: aBlockClosureUnderValidation onValidationSuccess: aSuccessBlockClosure onValidationError: anErrorBlockClosure

	| result |
	
	result := aBlockClosureUnderValidation value.
	self onValidationSucess: [aSuccessBlockClosure cull: result] onValidationError: anErrorBlockClosure 