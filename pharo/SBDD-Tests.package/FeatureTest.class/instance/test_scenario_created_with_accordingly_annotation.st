tests - scenario outline processing
test_scenario_created_with_accordingly_annotation

	self addScenarioOutlineNamed: 'scenarioOutlineCreateScenarioAnnotatedAccordingly' 
 		  toFeatureSubclassWithTextBody: '
							^ {self compile: ''
							scenarioCreatedWithCorrectAnnotation
						   <createdForTest> 
						   <scenarioGeneratedBy: #scenarioOutlineCreateScenarioAnnotatedAccordingly>''.
						  }'.
					
	self assertBlock: [ FeatureSubclassForTest methods chain
													  				  collect: #selector;
				                                          includes: #scenarioCreatedWithCorrectAnnotation ]