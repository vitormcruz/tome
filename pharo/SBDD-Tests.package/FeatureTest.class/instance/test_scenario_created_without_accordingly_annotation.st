tests - scenario outline processing
test_scenario_created_without_accordingly_annotation

	self should: [self addScenarioOutlineNamed: 'scenarioOutlineTestCreation' 
							toFeatureSubclassWithTextBody: '^ {self compile: ''scenarioCreatedWithoutCorrectAnnotation <createdForTest>''}'] 
		  raise: ScenarioGeneratedWithoutCorrectAnnotation.