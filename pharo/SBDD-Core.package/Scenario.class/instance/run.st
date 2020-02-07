running
run

	| parameters |
	
	parameters := definition chain allRegexMatches: '"[\w\d\s]*"';  
											flattened;
											collect: [ :param | param copyWithoutAll: '"' ]; 
										   collect: [ :param | [ param asNumber ] on: Exception do: [ param ] ];
										   subject.
													
	^ executionBlock valueWithArguments: parameters.