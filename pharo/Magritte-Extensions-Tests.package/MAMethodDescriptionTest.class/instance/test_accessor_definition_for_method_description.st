tests
test_accessor_definition_for_method_description

	self should: [validMethodDescription accessor: #anything] 
		  raise: Error 
		  withExceptionDo: [ :ex | self 
		      assert: ex messageText equals: 'You must not define an accessor for a method description.' 
		  ].