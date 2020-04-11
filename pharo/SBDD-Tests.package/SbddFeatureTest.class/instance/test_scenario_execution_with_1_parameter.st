tests - scenarios execution
test_scenario_execution_with_1_parameter

    (SbddFeature new scenario: 'scenario_test' 
					  	   def: 'Step with one parameter "param1"' 
					  		run: [ :parameters | ^ parameters == #('param1') ]) run.
					
    self assert: false description: 'Should have executed the assertion block'