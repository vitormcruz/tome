building suites
myScenarios

	^ self class 
			 chain methods;
				  	 select: [ :method | (method pragmas collect: #selector) includes: 'scenarioOutline' ]; 
					 collect: [ :scenarioOutline | scenarioOutline valueWithReceiver: self arguments: #() ];
					 flattened.