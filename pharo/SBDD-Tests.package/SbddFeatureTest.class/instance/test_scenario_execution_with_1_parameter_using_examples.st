tests - scenarios execution
test_scenario_execution_with_1_parameter_using_examples

	| paramsObtained steps |

	paramsObtained := OrderedCollection new.
   steps := SbddFeature new scenarioOutline: 'scenario_test' 
			   	            def: 'Step with one parameter "{param1}"'
					         examples: #( param1 ) asHeaderFor 
						 		           - #('value1') 
								           - #('value2') 
								           - #('value3')
					         run: [ :param1 | paramsObtained add: param1 ].
	steps do: #run.
   self assertCollection: paramsObtained hasSameElements: #('value1' 'value2' 'value3').