building suites
testParameters

	^ self myScenarios inject: ParametrizedTestMatrix new 
						    into: [ :testMatrix :aCase | testMatrix addCase: aCase ]
