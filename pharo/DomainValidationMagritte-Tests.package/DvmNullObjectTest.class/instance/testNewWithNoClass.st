tests
testNewWithNoClass

	self should: [ NullObject newBecauseOfErrors: #('Error A') whileCreatingA: nil ]
		  raise: Error
		  withExceptionDo: [:ex | ex messageText = 'Null objects should be a representation of a Class whose creation has failed,',
																' but you do not provided this information.'].
	