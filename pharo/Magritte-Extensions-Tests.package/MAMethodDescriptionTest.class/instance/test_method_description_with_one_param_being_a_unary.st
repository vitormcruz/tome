tests
test_method_description_with_one_param_being_a_unary

	self should: [ MAMethodDescription whereParams: {(MAStringDescription new accessor: #unary)} ] 
	     raise: Error
		  withExceptionDo: [ :ex | ex messageText = 'You cannot define a param for an unary message' ].
