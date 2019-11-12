tests - scenario outline processing
test_scenario_without_scenarioOutline_annotation

	self addACommonMessageNamed: 'methodWithoutCorrectAnnotation' 
		  toFeatureSubclassWithTextBody: 'self compile: ''shouldNotBeCreatedMethod <createdForTest>'' '.

	self assertBlock: [FeatureSubclassForTest methods chain 
																	 collect: #selector; 
																	 includes: #shouldNotBeCreatedMethod; 
																	 not].