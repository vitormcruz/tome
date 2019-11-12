tests - scenario outline processing
test_scenario_created_should_return_an_array_of_symbols_of_methods_created

	self should: [self addScenarioOutlineNamed: 'scenarioOutlineTestCreation' 
							 toFeatureSubclassWithTextBody: '^#(''dummy'')'
					 ] 
		  raise: ScenarioOutlineGeneratedNoScenario.