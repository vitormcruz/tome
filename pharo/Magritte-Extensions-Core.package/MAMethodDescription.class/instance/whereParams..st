description
whereParams: anOrderedCollection 
	
	anOrderedCollection ifEmpty: [ Error signal: 'You should define at least one parameter for a method description' ].
	self countBinaryParams: anOrderedCollection 
 		  ifMoreThanOneDo: [Error signal: 'You cannot define two params with a binary selector. ', 
											      'A binary selector must be defined for a method with only one parameter'  ].

	children := anOrderedCollection.
	children doWithIndex: [ :paramDesq :i | 
		paramDesq accessor: (MAMethodParamAccessor from: paramDesq accessor atIndex: i)
	]
	
