Class {
	#name : #TomeFeatureTest,
	#superclass : #TestCase,
	#category : #'Tome-Tests'
}

{ #category : #'tests - scenarios execution' }
TomeFeatureTest >> test_scenario_execution_with_1_parameter [


	| scenario paramObtained |
	
	scenario := TomeScenario withName: 'scenario_test'
								   definition: 'Step with one parameter "param1"'
									executionBlock: [ :param | 
										paramObtained := param
									].
		
	scenario run.
	
   self assert: 'param1' equals: paramObtained.
]

{ #category : #'tests - scenarios execution' }
TomeFeatureTest >> test_scenario_execution_with_1_parameter_using_examples [

	| paramsObtained steps |

	paramsObtained := OrderedCollection new.
   steps := TomeFeature new scenarioOutline: 'scenario_test' 
			   	            def: 'Step with one parameter "{param1}"'
					         examples: #( param1 ) asHeaderFor 
						 		           - #('value1') 
								           - #('value2') 
								           - #('value3')
					         run: [ :param1 | paramsObtained add: param1 ].
	steps do: #run.
   self assertCollection: paramsObtained hasSameElements: #('value1' 'value2' 'value3').
]

{ #category : #'tests - scenarios execution' }
TomeFeatureTest >> test_scenario_execution_with_2_parameters [

	| scenario paramsObtained |
	
	scenario := TomeScenario withName: 'scenario_test'
								   definition: 'Step with two parameters: "param1" and "param2"'
									executionBlock: [ :param1 :param2 | 
										paramsObtained := {param1. param2}
									].
		
	scenario run.
	
	self assertCollection: paramsObtained hasSameElements: #('param1' 'param2').
]

{ #category : #'tests - scenarios execution' }
TomeFeatureTest >> test_scenario_execution_with_2_parameters_using_examples [

	| paramsObtained steps |

	paramsObtained := OrderedCollection new.
   steps := TomeFeature new scenarioOutline: 'scenario_test' 
			   	            def: 'Step with two parameters: "{param1}" and "{param2}"' 
					         examples: #( param1    param2 ) asHeaderFor 
						 		        - #('value1'     1    ) 
								        - #('value2'     2    ) 
								        - #('value3'     3    )
					         run: [ :param1 :param2 | 
									paramsObtained add: {param1. param2} 
							   ].
						
	steps do: #run.
					
   self assertCollection: paramsObtained hasSameElements: #(#('value1' 1) #('value2' 2) #('value3' 3)).
]

{ #category : #'tests - scenarios execution' }
TomeFeatureTest >> test_scenario_execution_with_3_parameters [

	| scenario paramsObtained |
	
	scenario := TomeScenario withName: 'scenario_test'
								   definition: 'Step with three parameters "param1", "param2" and "param3"'
									executionBlock: [ :param1 :param2 :param3 | 
										paramsObtained := {param1. param2. param3}
									].
		
	scenario run.
	
	self assertCollection: paramsObtained hasSameElements: #('param1' 'param2' 'param3').
]

{ #category : #'tests - scenarios execution' }
TomeFeatureTest >> test_scenario_execution_with_3_parameters_using_examples [

	| paramsObtained steps |

	paramsObtained := OrderedCollection new.
   steps := TomeFeature new scenarioOutline: 'scenario_test' 
			   	            def: 'Step with three parameters: "{param1}", "{param2}" and "{param3}"' 
					         examples: #( param1    param2  param3 ) asHeaderFor 
						 		        - #('value1'     1      true  ) 
								        - #('value2'     2      false ) 
								        - #('value3'     3      true  )
					         run: [ :param1 :param2 :param3| 
									paramsObtained add: {param1. param2. param3 = 'true' } 
							   ].
						
	steps do: #run.
					
   self assertCollection: paramsObtained hasSameElements: #(#('value1' 1 true) #('value2' 2 false) #('value3' 3 true)).
]

{ #category : #'tests - scenarios execution' }
TomeFeatureTest >> test_scenario_execution_with_N_parameters_mixing_examples_and_fixed_values [

	| paramsObtained steps |

	paramsObtained := OrderedCollection new.
   steps := TomeFeature new scenarioOutline: 'scenario_test' 
			   	            def: 'Step with N parameters "Fixed Param1" "Fixed Param2" "{exampleParam1}" "{exampleParam2}"'
					         examples: #(       exampleParam1              exampleParam2           ) asHeaderFor 
						 		           - #('exampleParam1Value1'      'exampleParam2Value1'       ) 
								           - #('exampleParam1Value2'      'exampleParam2Value2'       ) 
								           - #('exampleParam1Value3'      'exampleParam2Value3'       )
					         run: [ :fix1 :fix2 :exampleParam1 :exampleParam2 | 
										paramsObtained add: fix1; add: fix2; add:exampleParam1; add: exampleParam2.
								].
	steps do: #run.
   self assert: paramsObtained asOrderedCollection
		  equals: #('Fixed Param1' 'Fixed Param2' 'exampleParam1Value1' 'exampleParam2Value1' 
						'Fixed Param1' 'Fixed Param2' 'exampleParam1Value2' 'exampleParam2Value2'
						'Fixed Param1' 'Fixed Param2' 'exampleParam1Value3' 'exampleParam2Value3') asOrderedCollection.
]
