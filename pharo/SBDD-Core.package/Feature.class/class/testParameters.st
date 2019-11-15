tests
testParameters
	| parameterizedMatrix |

	parameterizedMatrix := ParametrizedTestMatrix new forSelector: #scenarioExample 
																	 addOptions: self myScenarios.							
	^ parameterizedMatrix.