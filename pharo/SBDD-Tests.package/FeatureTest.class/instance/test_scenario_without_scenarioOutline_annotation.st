tests scenario outline
test_scenario_without_scenarioOutline_annotation

	FeatureSubclassForTest class compile: '
	methodWithoutCorrectAnnotation
		<createdForTest>
		
		self compile: ''shouldNotBeCreatedMethod <createdForTest>''
	'.

	self assertBlock: [FeatureSubclassForTest methods chain 
																	 collect: #selector; 
																	 includes: #shouldNotBeCreatedMethod; 
																	 not].