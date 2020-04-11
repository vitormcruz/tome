building suites
myScenarios

	^ self chain methods;
				  	 select: [ :method | (method pragmas collect: #selector) includes: 'scenarioOutline' ]; 
					 collect: [ :scenarioOutline | scenarioOutline valueWithReceiver: self new arguments: #() ];
					 flattened.