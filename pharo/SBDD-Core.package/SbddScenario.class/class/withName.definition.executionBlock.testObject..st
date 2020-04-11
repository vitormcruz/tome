instance creation
withName: scenarioName definition: scenarioDef executionBlock: aBlock testObject: testObject

	^ self new
		name: scenarioName;
		definition: scenarioDef;
		executionBlock: aBlock;
		testObject: testObject.