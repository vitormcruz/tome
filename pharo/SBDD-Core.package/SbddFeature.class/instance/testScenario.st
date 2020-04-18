parameterized tests
testScenario

	scenarioBuildStrategy validateInExecution.
	self scenarioBlock: self getContextualizedBlock.
	
	^ (SbddScenario withName: self scenarioName 
	 	 	          definition: self scenarioDefinition 
				       executionBlock: self scenarioBlock) run.
