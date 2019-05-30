tests
test_method_description_with_one_param_being_a_binary
	| methodDescription |
	
	methodDescription := MAMethodDescription whereParams: {(MAStringDescription new accessor: #@)}.
	self assertCollection: (self paramsSelectorsAndIndexes: methodDescription)
		  equals: {(#@ -> 1)}