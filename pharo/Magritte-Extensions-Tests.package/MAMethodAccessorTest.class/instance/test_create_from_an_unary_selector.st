tests
test_create_from_an_unary_selector
	
	self should: [ 	MAMethodParamAccessor from: (MASelectorAccessor selector: #unary) atIndex: 1 ] 
	     raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You cannot define a param for an unary message' ].
	
	self should: [ 	MAMethodParamAccessor from: (MASelectorAccessor selector: #unary) atIndex: 2 ] 
	     raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You cannot define a param for an unary message' ].
		
	self should: [ 	MAMethodParamAccessor from: (MASelectorAccessor selector: #unary) atIndex: 15 ] 
	     raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You cannot define a param for an unary message' ].


	
