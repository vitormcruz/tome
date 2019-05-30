tests
test_method_description_with_one_param_being_a_keyword
	| methodDescription |
	
	methodDescription := MAMethodDescription whereParams: {(MAStringDescription new accessor: #p1:)}.
	self assertCollection: (self paramsSelectorsAndIndexes: methodDescription)
		  equals: {#p1: -> 1}