tests
test_create_from_a_binary_selector_accessor_at_index_1
	| methodAccessor |
	
	methodAccessor := MAMethodParamAccessor from: (MASelectorAccessor selector: #@) atIndex: 1.
	
	self assert: methodAccessor selector equals: #@.
	self assert: methodAccessor index equals: 1.