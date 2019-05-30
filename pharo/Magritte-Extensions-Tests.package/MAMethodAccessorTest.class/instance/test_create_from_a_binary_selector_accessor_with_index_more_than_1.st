tests
test_create_from_a_binary_selector_accessor_with_index_more_than_1
	
	self should: [ 	MAMethodParamAccessor from: (MASelectorAccessor selector: #@) atIndex: 2 ] 
	     raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You cannot define more than one param for a binary message' ].
		
	
	self should: [ 	MAMethodParamAccessor from: (MASelectorAccessor selector: #@) atIndex: 15 ] 
	     raise: Error
		  withExceptionDo: [ :ex | self assert: ex messageText equals: 'You cannot define more than one param for a binary message' ].

	
