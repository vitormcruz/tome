tests - scenario outline derivation
test_scenario_outline_derivation_on_change

	self addScenarioOutlineNamed: 'scenarioOutlineTestChange' 
		  toFeatureSubclassWithTextBody: '^ {self compile: ''dummy <createdForTest> <scenarioGeneratedBy: #scenarioOutlineTestChange>''}'.

	self addScenarioOutlineNamed: 'scenarioOutlineTestChange' 
		  toFeatureSubclassWithTextBody: '^ {self compile: ''scenarioOutlineTestChangeOk <createdForTest> <scenarioGeneratedBy: #scenarioOutlineTestChange>''}'.

	self assertBlock: [FeatureSubclassForTest methods chain 
																	 collect: #selector; 
																	 includes: #scenarioOutlineTestChangeOk].