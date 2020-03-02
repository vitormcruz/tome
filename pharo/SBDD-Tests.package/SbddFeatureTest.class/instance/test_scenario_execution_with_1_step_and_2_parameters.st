tests - scenarios execution
test_scenario_execution_with_1_step_and_2_parameters

    (SbddFeature new scenario: 'scenario_test' 
					def: 'Step with one parameter "param1" and "param2"' 
					run: [ :param1 :param2 | ^ {param1. param2} asSet == #('param1' 'param2') asSet ]) run.
					
    self assert: false description: 'Should have executed the assertion block'