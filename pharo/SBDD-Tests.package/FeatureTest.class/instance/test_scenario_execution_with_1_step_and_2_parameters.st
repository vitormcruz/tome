tests - scenarios execution
test_scenario_execution_with_1_step_and_2_parameters

    Feature new scenario: 'scenario_test' 
					withSteps: {'Step with one parameter "param1" and "param2"'} 
					executeWithExtractedParams: [ :parameters | ^parameters asSet == #('param1' 'param2') asSet ].
					
    self assert: false description: 'Should have executed the assertion block'