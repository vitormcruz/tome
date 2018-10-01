testing
isTestMethod: aMethod

	^ (super isTestMethod: aMethod) | (aMethod selector endsWith: 'Scenario').