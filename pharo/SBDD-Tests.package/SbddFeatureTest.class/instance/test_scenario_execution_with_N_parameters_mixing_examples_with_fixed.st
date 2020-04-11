tests - scenarios execution
test_scenario_execution_with_N_parameters_mixing_examples_with_fixed

	| executions steps |

	executions := OrderedCollection new.
   steps := SbddFeature new scenarioOutline: 'scenario_test' 
			   	            def: 'Step with N parameters "Fixed Param1" "Fixed Param2" "{exampleParam1}" "{exampleParam2}"'
					         examples: #(       exampleParam1              exampleParam2           ) asHeaderFor 
						 		           - #('exampleParam1Value1'      'exampleParam2Value1'       ) 
								           - #('exampleParam1Value2'      'exampleParam2Value2'       ) 
								           - #('exampleParam1Value3'      'exampleParam2Value3'       )
					         run: [ :fix1 :fix2 :exampleParam1 :exampleParam2 | 
										executions add: fix1; add: fix2; add:exampleParam1; add: exampleParam2.
								].
	steps do: #run.
   self assert: executions asOrderedCollection
		  equals: #('Fixed Param1' 'Fixed Param2' 'exampleParam1Value1' 'exampleParam2Value1' 
						'Fixed Param1' 'Fixed Param2' 'exampleParam1Value2' 'exampleParam2Value2'
						'Fixed Param1' 'Fixed Param2' 'exampleParam1Value3' 'exampleParam2Value3') asOrderedCollection.