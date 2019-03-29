tests scenario outline
test_scenario_created_should_return_a_collection

	self should: [FeatureSubclassForTest class compile: '
						scenarioOutlineTestCreation
						<scenarioOutline>
						<createdForTest>
						
						"Create no method, generating expected error"
					'.] 
		  raise: ScenarioOutlineGeneratedNoScenario.