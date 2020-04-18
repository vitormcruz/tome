tests - scenarios execution
test_scenario_execution_with_1_parameter

    (self buildScenarioTestExecutionNamed: 'scenario_test'
			 described: 'Step with one parameter "param1"' 
			 andWithExecution: [ :parameters | ^ parameters == #('param1') ]) run.
					
    self assert: false description: 'Should have executed the assertion block'