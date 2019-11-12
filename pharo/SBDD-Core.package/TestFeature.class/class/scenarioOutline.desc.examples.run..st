as yet unclassified
scenarioOutline: scenarioName desc: scenarioDef examples: examples run: aBlock
	^ examples
		collect: [ :example | 
			Scenario new
				withName: scenarioName
				definition: (examples applyAsExampleTo: scenarioDef)
				executionBlock: aBlock ]