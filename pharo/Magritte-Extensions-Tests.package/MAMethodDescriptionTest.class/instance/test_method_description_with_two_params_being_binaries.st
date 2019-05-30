tests
test_method_description_with_two_params_being_binaries
	
	self should: [ MAMethodDescription whereParams: {(MAStringDescription new accessor: #@). (MAStringDescription new accessor: #*).} ]
		  raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText 
												 equals: 'You cannot define two params with a binary selector. ', 
															'A binary selector must be defined for a method with only one parameter'].
