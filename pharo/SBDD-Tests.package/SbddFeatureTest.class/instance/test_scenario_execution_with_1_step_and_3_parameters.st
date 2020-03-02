tests - scenarios execution
test_scenario_execution_with_1_step_and_3_parameters

    (SbddFeature new scenario: 'scenario_test' 
					def: 'Step with one parameter "param1", "param2" and "param3"' 
					run: [ :param1 :param2 :param3 | ^ {param1. param2. param3.} asSet == #('param1' 'param2' 'param3') asSet ]) run.
					
    self assert: false description: 'Should have executed the assertion block'