scenario outline
scenarioOutline: scenarioName desc: description examples: examples run: aBlock
	^ examples
		collect: [ :example | 
			Scenario withName: scenarioName
						definition: (description format: example)
						executionBlock: aBlock ]