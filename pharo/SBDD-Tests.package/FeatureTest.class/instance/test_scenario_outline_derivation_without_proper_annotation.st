tests - scenario outline derivation
test_scenario_outline_derivation_without_proper_annotation

	self addACommonMessageNamed: 'methodWithoutCorrectAnnotation' 
		  toFeatureSubclassWithTextBody: 'self compile: ''shouldNotBeCreatedMethod <createdForTest>'' '.

	self assertBlock: [FeatureSubclassForTest methods chain 
																	 collect: #selector; 
																	 includes: #shouldNotBeCreatedMethod; 
																	 not].