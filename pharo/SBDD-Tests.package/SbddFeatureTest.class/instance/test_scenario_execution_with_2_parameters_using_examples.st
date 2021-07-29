tests - scenarios execution
test_scenario_execution_with_2_parameters_using_examples

	| paramsObtained steps |

	paramsObtained := OrderedCollection new.
   steps := SbddFeature new scenarioOutline: 'scenario_test' 
			   	            def: 'Step with tow parameters: "{param1}" and "{param2}"' 
					         examples: #( param1    param2 ) asHeaderFor 
						 		        - #('value1'     1    ) 
								        - #('value2'     2    ) 
								        - #('value3'     3    )
					         run: [ :param1 :param2 | 
									paramsObtained add: {param1. param2} 
							   ].
						
	steps do: #run.
					
   self assertCollection: paramsObtained hasSameElements: #(#('value1' 1) #('value2' 2) #('value3' 3)).