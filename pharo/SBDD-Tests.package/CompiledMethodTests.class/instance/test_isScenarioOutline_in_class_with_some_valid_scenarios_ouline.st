tests - isScenarioOutline
test_isScenarioOutline_in_class_with_some_valid_scenarios_ouline

	self assertCollection: FeatureSubclassForTest myMethodsOutlineSelectors
		  hasSameElements: #('scenarioOutline1' 'scenarioOutline2' 'scenarioOutline3').