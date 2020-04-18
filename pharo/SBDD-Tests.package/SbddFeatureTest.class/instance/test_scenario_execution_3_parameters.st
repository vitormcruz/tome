tests - scenarios execution
test_scenario_execution_3_parameters

	(self buildScenarioTestExecutionNamed: 'scenario_test' 
		  described: 'Step with one parameter "param1", "param2" and "param3"' 
		  andWithExecution: [ :param1 :param2 :param3 | 
				^ {param1. param2. param3.} asSet == #('param1' 'param2' 'param3') asSet 
		  ]
	 ) run.
					
    self assert: false description: 'Should have executed the assertion block'