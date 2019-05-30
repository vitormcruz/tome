tests
test_create_from_a_keyword_selector_accessor_at_index_more_than_1
	| methodAccessor |
	
	methodAccessor := MAMethodParamAccessor from: (MASelectorAccessor selector: #s1:) atIndex: 20.
	
	self assert: methodAccessor selector equals: #s1:.
	self assert: methodAccessor index equals: 20.