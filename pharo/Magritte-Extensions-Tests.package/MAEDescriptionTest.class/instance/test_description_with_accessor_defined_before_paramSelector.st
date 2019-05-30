tests
test_description_with_accessor_defined_before_paramSelector

	self should: [MADescription basicNew accessor: #p1:; paramSelector: #p1:]
        raise: ParamDescriptionError
		  withExceptionDo: [ :ex | 
		      self assert: ex messageText 
					  equals: 'You should not define accessor and paramSelector on the same description.', 
							    ' Use accessor on normal description and paramSelector for descriptions of method parameters.'
		  ].
