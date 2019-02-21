tests
testNewWithNoErrors

	self should: [ DvmNullObject newBecauseOfErrors: #() whileCreatingA: String ]
		  raise: Error
		  withExceptionDo: [:ex | self assert: ex messageText
										      equals: 'Null objects should be created with at least one underlined error, but none was provided.'].