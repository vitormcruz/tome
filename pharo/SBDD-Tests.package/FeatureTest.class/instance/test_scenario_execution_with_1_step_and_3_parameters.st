tests
test_scenario_execution_with_1_step_and_3_parameters

    Feature new scenario: 'scenario_test' 
					withSteps: {'Step with one parameter "param1", "param2" and "param3"'} 
					executeWithExtractedParams: [ :parameters | ^parameters asSet == #('param1' 'param2' 'param3') asSet ].
					
    self assert: false description: 'Should have executed the assertion block'