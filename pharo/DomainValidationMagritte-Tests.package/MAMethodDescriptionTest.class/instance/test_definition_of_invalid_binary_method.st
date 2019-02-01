tests
test_definition_of_invalid_binary_method

	self should: [ 	MAMethodDescription new whereParams: { MANumberDescription new accessor: #a; min: 20. } ]
		  raise: Error 
	     withExceptionDo: [:ex | self assert: ex messageText 
												equals: 'You cannot define a param for an unary message and a binary message',
 														  ' must defined with a special character, such as "+-/\*~<>=@,%|&?!"'].