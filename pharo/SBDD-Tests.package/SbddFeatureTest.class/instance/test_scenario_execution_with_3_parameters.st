tests - scenarios execution
test_scenario_execution_with_3_parameters

	| scenario paramsObtained |
	
	scenario := SbddScenario withName: 'scenario_test'
								   definition: 'Step with one parameter "param1", "param2" and "param3"'
									executionBlock: [ :param1 :param2 :param3 | 
										paramsObtained := {param1. param2. param3}
									].
		
	scenario run.
	
	self assertCollection: paramsObtained hasSameElements: #('param1' 'param2' 'param3').