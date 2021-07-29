building suites
myScenarios

	^ self chain methods;
				  	 select: [ :method | (method pragmas collect: #selector) includes: 'scenario' ]; 
					 inject: OrderedCollection new into: [ :finalCollection :scenarioBuilderMethod | 
						finalCollection addAll: ((1 to: ((scenarioBuilderMethod valueWithReceiver: self new arguments: #()) size )) collect: [ :exampleIndex | {#scenarioBuilderMethod -> scenarioBuilderMethod selector. 
					  #exampleIndex -> exampleIndex}]);
						yourself 
						 
					 ].