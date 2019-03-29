tests scenario outline
test_scenario_created_should_return_an_array_of_symbols_of_methods_created

	self should: [FeatureSubclassForTest class compile: '
						scenarioOutlineTestCreation
						<scenarioOutline>
						<createdForTest>
						
						^#(''dummy'')
					'.] 
		  raise: ScenarioOutlineGeneratedNoScenario.