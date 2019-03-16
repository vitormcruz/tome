tests scenario outline
test_scenario_outline_identification

	self assertCollection: (FeatureSubclassForTest class methods chain select: [ :method | method isAScenarioOutline ]; collect: #selector)
		  hasSameElements: #('scenarioOutline1' 'scenarioOutline2' 'scenarioOutline3').