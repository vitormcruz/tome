tests
test_accessor_writter

	self should: [MAMethodDescription new accessor: #anything] 
		  raise: Error 
		  withExceptionDo: [ :ex | self 
		      assert: ex messageText equals: 'You must not define an accessor for a method description.' 
		  ].