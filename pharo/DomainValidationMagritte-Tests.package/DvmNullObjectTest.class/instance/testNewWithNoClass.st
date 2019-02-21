tests
testNewWithNoClass

	self should: [ DvmNullObject newBecauseOfErrors: #('Error A') whileCreatingA: nil ]
		  raise: Error
		  withExceptionDo: [:ex | self assert: ex messageText
												equals: ('Null objects should be a representation of a Class whose creation has failed,',
															' but you do not provided this information.')].
	