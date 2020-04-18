building suites
myScenarios

	^ self chain methods;
				  	 select: [ :method | (method pragmas collect: #selector) includes: 'scenarioOutline' ]; 
					 inject: OrderedCollection new into: [ :finalCollection :scenarioBuilderMethod | 
						finalCollection addAll: (scenarioBuilderMethod valueWithReceiver: self newForScenarioBuilding arguments: #()) 
					 ].