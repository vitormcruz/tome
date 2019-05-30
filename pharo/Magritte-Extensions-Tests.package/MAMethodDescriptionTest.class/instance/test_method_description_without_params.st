tests
test_method_description_without_params

	self should: [ MAMethodDescription whereParams: { }  ]
		  raise: Error
		  withExceptionDo: [ :ex  |
		     self assert: ex messageText equals: 'You should define at least one parameter for a method description'
		  ]
