tests
test_description_with_accessor_defined_after_paramSelector

	self skip: 'I think I am going to implement this using my implementation of validation with magritte and 
			 		slots, but first I must implement that, and to do so paramSelector is necessary, so this test is 
					the long triangulation of many of what I am experimenting.'.

	self should: [MADescription basicNew paramSelector: #p1:; accessor: #p1:]
        raise: ParamDescriptionError
		  withExceptionDo: [ :ex | 
		      self assert: ex messageText 
					  equals: 'You should not define accessor and paramSelector on the same description.', 
							    ' Use accessor on normal description and paramSelector for descriptions of method parameters.'
		  ].
