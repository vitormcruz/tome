tests - scenario outline processing
test_scenario_outline_execution_on_creation

	self addScenarioOutlineNamed: 'scenarioOutlineTestCreation' 
		  toFeatureSubclassWithTextBody: '^ {self compile: ''scenarioOutlineTestCreationOk <createdForTest> <scenarioGeneratedBy: #scenarioOutlineTestCreation>''}.'.

	self assertBlock: [FeatureSubclassForTest methods chain 
																	 collect: #selector; 
																	 includes: #scenarioOutlineTestCreationOk].