as yet unclassified
buildScenarioTestExecutionNamed: aStringName described: aStringDescription andWithExecution: aBlock

   | testCase |

	testCase := (SbddFeature new 
									 scenario: aStringName  
								 	 def: aStringDescription  
					 				 run: aBlock) asDictionary.
									
	^ SbddScenario withName: (testCase at: #scenarioDefinition)
					   definition: (testCase at: #scenarioName) 
						executionBlock: aBlock.
									
								