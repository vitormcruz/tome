as yet unclassified
onValidationSucess: aSucessBlockClosure onValidationError: anErrorBlockClosure

	^ self isValidationSuccessful ifTrue: aSucessBlockClosure
			   							  ifFalse: [anErrorBlockClosure cull: self errors].