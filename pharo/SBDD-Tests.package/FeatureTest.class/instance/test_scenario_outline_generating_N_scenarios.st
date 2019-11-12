tests - scenario - generation
test_scenario_outline_generating_N_scenarios
	
	| scenariosCreated |

	scenariosCreated := feature scenarioOutline: 'scenarioTest' 
			  							withSteps: { 'step1' } 
					 				   examples:  #( ( column1 )
								  						  ( value1 )
								  						  ( value2 )
							 						   ) 
			  							executeWithExtractedParams: [ :extractedParams |
									  		methodNames add: thisContext message name.
										].
									
	self assertCollection: scenariosCreated  hasSameElements: #( scenarioTest_1 scenarioTest_2 ).