tests scenario outline
test_scenario_outline_execution_on_creation

	FeatureSubclassForTest class compile: '
	scenarioOutlineTestCreation
		<scenarioOutline>
		<createdForTest>
		
		^ {self compile: ''scenarioOutlineTestCreationOk <createdForTest> <scenarioGeneratedBy: #scenarioOutlineTestCreation>''}.
	'.

	self assertBlock: [FeatureSubclassForTest methods chain 
																	 collect: #selector; 
																	 includes: #scenarioOutlineTestCreationOk].