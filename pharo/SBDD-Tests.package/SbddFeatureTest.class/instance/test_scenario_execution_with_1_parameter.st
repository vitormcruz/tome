tests - scenarios execution
test_scenario_execution_with_1_parameter


	| scenario paramObtained |
	
	scenario := SbddScenario withName: 'scenario_test'
								   definition: 'Step with one parameter "param1"'
									executionBlock: [ :param | 
										paramObtained := param
									].
		
	scenario run.
	
   self assert: 'param1' equals: paramObtained.