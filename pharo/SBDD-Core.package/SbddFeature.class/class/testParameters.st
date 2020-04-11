building suites
testParameters
	| parameterizedMatrix |

	parameterizedMatrix := ParametrizedTestMatrix new forSelector: #scenario
																	 addOptions: self myScenarios.							
	^ parameterizedMatrix.