scenario outline
scenarioOutline: scenarioName def: description examples: examples run: aBlock
	^ examples
		collect: [ :example | 
			SbddScenario withName: scenarioName
						definition: (description format: example)
						executionBlock: aBlock ]