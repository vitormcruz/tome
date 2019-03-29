tests
test_whereParams_with_params_defining_accessors

	self should: [MAMethodDescription new whereParams: { MAStringDescription new accessor: #p1.
				 													    MANumberDescription new accessor: #p2}]
        raise: ParamDescriptionError
		  withExceptionDo: [ :ex | 
		      self assert: ex messageText 
					  equals: 'Params description of a Method description should not define an accessor. Use paramSelector instead.'
		  ].
