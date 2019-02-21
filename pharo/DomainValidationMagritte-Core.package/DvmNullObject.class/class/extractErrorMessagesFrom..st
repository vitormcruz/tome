as yet unclassified
extractErrorMessagesFrom: errors

	^ errors collect: [ :error | errorKeyMap at: error errorMessage ].