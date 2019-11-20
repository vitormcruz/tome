scenarioSpecification
scenario: scenarioNameString def: scenarioDefinition run: aBlock

	| parameters |
	
	parameters := scenarioDefinition chain allRegexMatches: '"[\w\d\s]*"';  
													  flattened;
													  collect: [ :param | param copyWithoutAll: '"' ]; 
													  collect: [ :param | [ param asNumber ] on: Exception do: [ param ] ];
													  subject.
													
	^ aBlock valueWithArguments: parameters.