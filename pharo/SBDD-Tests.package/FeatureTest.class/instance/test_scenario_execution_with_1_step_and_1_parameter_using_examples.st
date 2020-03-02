tests - scenarios execution
test_scenario_execution_with_1_step_and_1_parameter_using_examples

	| executions steps |

	executions := OrderedCollection new.
   steps := Feature new scenarioOutline: 'scenario_test' 
			   	            def: 'Step with one parameter "{param1}"'
					         examples: #( param1 ) asHeaderFor 
						 		           - #('value1') 
								           - #('value2') 
								           - #('value3')
					         run: [ :param1 | executions add: param1 ].
	steps do: #run.
   self assertBlock: [ executions asSet = #('value1' 'value2' 'value3') asSet ].