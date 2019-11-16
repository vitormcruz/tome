scenario outline
scenarioOutline: scenarioName desc: scenarioDef examples: examples run: aBlock
	^ examples
		collect: [ :example | 
			Scenario withName: scenarioName
						definition: example
						executionBlock: aBlock ]