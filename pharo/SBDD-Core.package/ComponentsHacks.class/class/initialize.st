actions
initialize

	compiledMethodOriginalIsTestMethodImpl := (CompiledMethod >> #isTestMethod) sourceCode.
	CompiledMethod compile: 'isTestMethod
	^ self methodClass isTestMethod: self 
	'.

	ClySystemEnvironmentPlugin compile: 'isTestMethod: aMethod
	^ aMethod isTestMethod.'.

	clySUnitEnvironmentPluginIsTestMethodImpl := (ClySUnitEnvironmentPlugin >> #isTestMethod:) sourceCode.	
	ClySUnitEnvironmentPlugin compile: 'isTestMethod: aMethod
	^ aMethod isTestMethod.'.