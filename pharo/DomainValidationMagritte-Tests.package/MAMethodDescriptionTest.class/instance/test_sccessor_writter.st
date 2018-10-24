tests
test_sccessor_writter

	self should: [MAMethodDescription new accessor: #anything] 
		  raise: Error 
		  withExceptionDo: [ :ex | ex messageText = 'You must not define an accessor for a method description, which is the composition of accessors of defined params. The result is the message.' ].