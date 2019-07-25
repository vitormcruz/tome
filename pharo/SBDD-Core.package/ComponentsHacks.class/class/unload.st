cleanup
unload 

	CompiledMethod compile: compiledMethodOriginalIsTestMethodImpl.

	ClySystemEnvironmentPlugin removeSelector: #isTestMethod:.
	
	ClySUnitEnvironmentPlugin compile: clySUnitEnvironmentPluginIsTestMethodImpl.
	
	super unload.