tests - scenario - generation
test_scenario_outline_generating_no_scenario
	
	| scenariosCreated |

	scenariosCreated := feature scenarioOutline: 'scenarioOutlineTest' 
			  							withSteps: { 'step1' } 
					 				   examples:  #( ( column1 )
							 						   ) 
			  							executeWithExtractedParams: [ :extractedParams |
									  		methodNames add: thisContext message name.
										].
									
	self assert: scenariosCreated isEmpty.