tests - scenarios execution
test_scenario_execution_with_no_parameter

	Feature new scenario: 'scenario_1' withSteps: { } executeWithExtractedParams: [ ^ self assert: true ].
	self assert: false description: 'Should have executed the assertion block'.