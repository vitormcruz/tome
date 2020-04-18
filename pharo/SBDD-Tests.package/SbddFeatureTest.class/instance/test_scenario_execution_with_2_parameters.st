tests - scenarios execution
test_scenario_execution_with_2_parameters

    (self buildScenarioTestExecutionNamed: 'scenario_test' 
			 described: 'Step with one parameter "param1" and "param2"' 
			 andWithExecution: [ :param1 :param2 | 
					^ {param1. param2} asSet == #('param1' 'param2') asSet 
			 ]
	  ) run.
					
    self assert: false description: 'Should have executed the assertion block'