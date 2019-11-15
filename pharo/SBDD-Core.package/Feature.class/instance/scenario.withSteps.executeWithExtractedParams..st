scenarioSpecification
scenario: scenarionName withSteps: aCollection executeWithExtractedParams: aBlockClosure 

	| parameters |
	
	parameters := aCollection collect: [ :step | (step allRegexMatches: '".*"') ].
	^ aBlockClosure valueWithArguments: (parameters flattened collect: [ :parameter | parameter copyWithoutAll: '"' ]).
