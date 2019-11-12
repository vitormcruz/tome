tests - scenario outline derivation
test_scenario_created_should_return_a_collection

	self should: [self addScenarioOutlineNamed: 'scenarioOutlineTestCreation' 
							 toFeatureSubclassWithTextBody: '"Create no method, generating expected error"'] 
		  raise: ScenarioOutlineGeneratedNoScenario.