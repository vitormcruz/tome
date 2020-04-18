instance creation
withName: scenarioName definition: scenarioDef executionBlock: aBlock

	^ self new
		name: scenarioName;
		definition: scenarioDef;
		executionBlock: aBlock.