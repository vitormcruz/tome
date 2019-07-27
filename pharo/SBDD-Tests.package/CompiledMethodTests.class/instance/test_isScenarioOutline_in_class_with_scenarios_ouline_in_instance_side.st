tests - isScenarioOutline
test_isScenarioOutline_in_class_with_scenarios_ouline_in_instance_side

	FeatureSubclassWithScenarioOutlineInstSide compile: 'scenarioOutline1	<createdForTest> <scenarioOutline>'.
	FeatureSubclassWithScenarioOutlineInstSide compile: 'scenarioOutline2	<createdForTest> <scenarioOutline>'.
	FeatureSubclassWithScenarioOutlineInstSide compile: 'scenarioOutline3	<createdForTest> <scenarioOutline>'.

	self assert: FeatureSubclassWithScenarioOutlineInstSide myMethodsOutlineSelectors isEmpty.
