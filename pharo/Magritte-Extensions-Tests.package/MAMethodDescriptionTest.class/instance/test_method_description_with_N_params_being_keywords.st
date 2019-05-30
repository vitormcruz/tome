tests
test_method_description_with_N_params_being_keywords
	| methodDescription |
	
	methodDescription := MAMethodDescription whereParams: {MAStringDescription new accessor: #p1:.
																		   MAStringDescription new accessor: #p2:.
																		   MAStringDescription new accessor: #p3:.}.

	self assertCollection: (self paramsSelectorsAndIndexes: methodDescription)
		  equals: {#p1: -> 1.
				  	 #p2: -> 2.
					 #p3: -> 3.}