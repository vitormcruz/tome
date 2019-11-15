scenario outline
scenarioOutline: scenarioName desc: scenarioDef examples: examples run: aBlock
	^ examples
		collect: [ :example | 
			Scenario withName: scenarioName
						definition: (example applyTo: scenarioDef)
						executionBlock: aBlock ]