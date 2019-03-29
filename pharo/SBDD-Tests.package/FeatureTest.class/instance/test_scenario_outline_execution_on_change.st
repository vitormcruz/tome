tests scenario outline
test_scenario_outline_execution_on_change

	FeatureSubclassForTest class compile: '
	scenarioOutlineTestChange
		<scenarioOutline>
		<createdForTest>
		
		^ {self compile: ''dummy <createdForTest> <scenarioGeneratedBy: #scenarioOutlineTestChange>''}
	'.
	
	FeatureSubclassForTest class compile: '
	scenarioOutlineTestChange
		<scenarioOutline>
		<createdForTest>
		
		^ {self compile: ''scenarioOutlineTestChangeOk <createdForTest> <scenarioGeneratedBy: #scenarioOutlineTestChange>''}
	'.

	self assertBlock: [FeatureSubclassForTest methods chain 
																	 collect: #selector; 
																	 includes: #scenarioOutlineTestChangeOk].