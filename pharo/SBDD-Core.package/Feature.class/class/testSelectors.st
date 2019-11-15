accessing
testSelectors
	^ (self selectors select: [ :each | ((each beginsWithSubCollection: 'test') 
						   or: [ each endsWithSubCollection: 'Scenario' ] ) 
							and: [ each numArgs isZero ] ]).
	