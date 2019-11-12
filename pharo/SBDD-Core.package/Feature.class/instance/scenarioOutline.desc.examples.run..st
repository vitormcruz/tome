scenario outline
scenarioOutline: aStringName desc: aStringDescription examples: examples run: aBlock

	examples
		do: [ :example | 
			Transcript show: (example asScenarioNamed: aStringName
											 describedAs: aStringDescription
											 andRunWith: aBlock) asString; cr.
		]