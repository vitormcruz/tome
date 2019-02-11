tests
testNewWithNoErrors

	self should: [ NullObject newBecauseOfErrors: #() whileCreatingA: String ]
		  raise: Error
		  withExceptionDo: [:ex | ex messageText = 'Null objects should be created with at least one underlined error, but none was provided.'].
	