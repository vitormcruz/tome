Class {
	#name : #SbddFeatureTest,
	#superclass : #TestCase,
	#category : 'Tome-Tests'
}

{ #category : #'as yet unclassified' }
SbddFeatureTest >> buildScenarioTestExecutionNamed: aStringName described: aStringDescription andWithExecution: aBlock [

   | testCase |

	testCase := (SbddFeature new 
									 scenario: aStringName  
								 	 def: aStringDescription  
					 				 run: aBlock) asDictionary.
									
	^ SbddScenario withName: (testCase at: #scenarioDefinition)
					   definition: (testCase at: #scenarioName) 
						executionBlock: aBlock.
									
								
]

{ #category : #'tests - scenarios execution' }
SbddFeatureTest >> test_scenario_execution_with_1_parameter [


	| scenario paramObtained |
	
	scenario := SbddScenario withName: 'scenario_test'
								   definition: 'Step with one parameter "param1"'
									executionBlock: [ :param | 
										paramObtained := param
									].
		
	scenario run.
	
   self assert: 'param1' equals: paramObtained.
]

{ #category : #'tests - scenarios execution' }
SbddFeatureTest >> test_scenario_execution_with_1_parameter_using_examples [

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
]

{ #category : #'tests - scenarios execution' }
SbddFeatureTest >> test_scenario_execution_with_2_parameters_using_examples [

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
]

{ #category : #'tests - scenarios execution' }
SbddFeatureTest >> test_scenario_execution_with_3_parameters [

	| scenario paramsObtained |
	
	scenario := SbddScenario withName: 'scenario_test'
								   definition: 'Step with one parameter "param1", "param2" and "param3"'
									executionBlock: [ :param1 :param2 :param3 | 
										paramsObtained := {param1. param2. param3}
									].
		
	scenario run.
	
	self assertCollection: paramsObtained hasSameElements: #('param1' 'param2' 'param3').
]

{ #category : #'tests - scenarios execution' }
SbddFeatureTest >> test_scenario_execution_with_N_parameters_mixing_examples_with_fixed [

	| paramsObtained steps |

	paramsObtained := OrderedCollection new.
   steps := SbddFeature new scenarioOutline: 'scenario_test' 
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
