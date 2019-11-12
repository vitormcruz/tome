tests - scenario - generation
test_scenario_outline_generating_one_scenario
	
	| scenariosCreated |

	scenariosCreated := feature scenarioOutline: 'scenarioOutlineTest' 
			  							withSteps: { 'step1' } 
					 				   examples:  #( ( column1 )
								  						  ( value1 )
							 						   ) 
			  							executeWithExtractedParams: [ :extractedParams |
									  		methodNames add: thisContext message name.
										].
									
	self assertCollection: scenariosCreated  hasSameElements: #( scenarioTest_1 ).