tests - scenarios execution
test_scenario_execution_with_1_step_and_1_parameter

    Feature new scenario: 'scenario_test' 
					withSteps: {'Step with one parameter "param1"'} 
					executeWithExtractedParams: [ :parameters | ^parameters == #('param1')].
					
    self assert: false description: 'Should have executed the assertion block'