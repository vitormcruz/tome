scenario outline
scenarioOutline: scenarioName desc: scenarioDef examples: examples run: aBlock
	^ examples
		collect: [ :example | 
			Scenario withName: scenarioName
						definition: (scenarioDef format: example)
						executionBlock: aBlock ]