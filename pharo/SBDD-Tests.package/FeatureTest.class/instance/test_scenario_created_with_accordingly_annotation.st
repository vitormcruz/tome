tests scenario outline
test_scenario_created_with_accordingly_annotation

	FeatureSubclassForTest class compile:'
						scenarioOutlineCreateScenarioAnnotatedAccordingly
						<scenarioOutline>
						<createdForTest>
						
						^ {self compile: ''
							scenarioCreatedWithCorrectAnnotation
						   <createdForTest> 
						   <scenarioGeneratedBy: #scenarioOutlineCreateScenarioAnnotatedAccordingly>''.
						  }
					'.
					
	self assertBlock: [ FeatureSubclassForTest methods chain
													  				  collect: #selector;
				                                          includes: #scenarioCreatedWithCorrectAnnotation ]