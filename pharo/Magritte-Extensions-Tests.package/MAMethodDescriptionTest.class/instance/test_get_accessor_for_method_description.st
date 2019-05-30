tests
test_get_accessor_for_method_description

	self should: [validMethodDescription accessor] 
		  raise: Error 
		  withExceptionDo: [ :ex | self 
		      assert: ex messageText equals: 'A method description do not have an accessor, it behaves more like a container' .
		  ].