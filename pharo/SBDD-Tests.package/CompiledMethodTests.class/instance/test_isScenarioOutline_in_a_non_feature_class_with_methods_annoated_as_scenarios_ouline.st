tests - isScenarioOutline
test_isScenarioOutline_in_a_non_feature_class_with_methods_annoated_as_scenarios_ouline

	NonFeatureClassWithWroglyScenarioOutlineAnnotations compile: 'scenarioOutline1	<createdForTest> <scenarioOutline>'.
	NonFeatureClassWithWroglyScenarioOutlineAnnotations compile: 'scenarioOutline2	<createdForTest> <scenarioOutline>'.
	NonFeatureClassWithWroglyScenarioOutlineAnnotations compile: 'scenarioOutline3	<createdForTest> <scenarioOutline>'.

	self assert: NonFeatureClassWithWroglyScenarioOutlineAnnotations myMethodsOutlineSelectors isEmpty.
