tests - isScenarioOutline
test_isScenarioOutline_in_class_with_some_valid_scenarios_ouline

	FeatureSubclassForTest class compile: 'notAScenarioOutline1 <createdForTest>'.
	FeatureSubclassForTest class compile: 'notAScenarioOutline2 <createdForTest>'.
	FeatureSubclassForTest class compile: 'notAScenarioOutline3 <createdForTest>'.
	
	self addScenarioOutlineNamed: 'scenarioOutline1' 
	     toFeatureSubclassWithTextBody: '
 		      ^ {self compile: ''
				   scenario1
				   <createdForTest> 
				   <scenarioGeneratedBy: #scenarioOutline1>''.
				}'.
				
	self addScenarioOutlineNamed: 'scenarioOutline2' 
	     toFeatureSubclassWithTextBody: '
 		      ^ {self compile: ''
				   scenario2
				   <createdForTest> 
				   <scenarioGeneratedBy: #scenarioOutline2>''.
				}'.
				
	self addScenarioOutlineNamed: 'scenarioOutline3' 
	     toFeatureSubclassWithTextBody: '
 		      ^ {self compile: ''
				   scenario3
				   <createdForTest> 
				   <scenarioGeneratedBy: #scenarioOutline3>''.
				}'.

	self assertCollection: FeatureSubclassForTest myMethodsOutlineSelectors
		  hasSameElements: #('scenarioOutline1' 'scenarioOutline2' 'scenarioOutline3').