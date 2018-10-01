actions
initialize

	CompiledMethod compile: 'isTestMethod
	^ self methodClass isTestMethod: self 
	'.

	ClySystemEnvironmentPlugin compile: 'isTestMethod: aMethod
	^ aMethod isTestMethod.'