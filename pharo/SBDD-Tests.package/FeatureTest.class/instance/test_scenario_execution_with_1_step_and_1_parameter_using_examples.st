tests
test_scenario_execution_with_1_step_and_1_parameter_using_examples

	| executions |

	executions := OrderedCollection new.
   Feature new scenario: 'scenario_test' 
			   	   withSteps: {'Step with one parameter {param1}'} 
					examples: #(( param1 )
									('value1') 
									('value2') 
									('value3'))
					executeWithExtractedParams: [ :param1 | executions add: param1 ].
	
	
   self assertBlock: [ executions asSet = #('value1' 'value2' 'value3') asSet ].