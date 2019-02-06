tests
test_create_scenario_without_mandatory_params

	self should: [ Feature new scenario: nil withSteps: nil executeWithExtractedParams: nil ] 
		  raise: Error 
		  withExceptionDo: [ :ex | self assert: ex message 
												 equals: 'Following errors found while creating a new Feature: scenario mandatory_name, ', 
															'mandatory_step_declaration and mandatory_scenarioBlock_for_execution']