scenarioSpecification
scenarioOutline: scenarionTempleteName withSteps: aStepCollection examples: orderedCollectionOfExamples executeWithExtractedParams: aBlockClosure
	
	^ orderedCollectionOfExamples allButFirst withIndexCollect: [ :example : i| 
		scenarionTempleteName , '_', i asString.
	].