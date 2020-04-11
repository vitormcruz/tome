running
run
	| parameters |
	
	self validateScenario.
	
	parameters := definition chain
									allRegexMatches: '"[\w\d\s]*"';
									flattened;
									collect: [ :param | param copyWithoutAll: '"' ];
									collect: [ :param | [ param asNumber ] on: Exception do: [ :err | param ] ];
									subject.
	testObject setUp.
	[ ^ executionBlock valueWithPossibleArgs: parameters ] ensure: [ testObject tearDown ].
	testObject tearDown.