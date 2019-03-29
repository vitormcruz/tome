tests scenario outline
test_scenario_created_without_accordingly_annotation

	self should: [FeatureSubclassForTest class compile: '
						scenarioOutlineTestCreation
						<scenarioOutline>
						<createdForTest>
						
						^ {self compile: ''scenarioCreatedWithoutCorrectAnnotation <createdForTest>''}
					'.] 
		  raise: ScenarioGeneratedWithoutCorrectAnnotation.