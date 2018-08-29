accessing
testSelectors
	^(self selectors select: [ :each | ((each beginsWith: 'test') or: [each endsWith: 'Scenario']) and: [each numArgs isZero]]).
	