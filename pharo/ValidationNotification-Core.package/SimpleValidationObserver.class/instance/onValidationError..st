as yet unclassified
onValidationError: aBlockClosure

	self isValidationSuccessful ifFalse: [aBlockClosure value: self errors].

