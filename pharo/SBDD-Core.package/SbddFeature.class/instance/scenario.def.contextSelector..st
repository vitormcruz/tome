scenario builder
scenario: aString def: aStringDefinition contextSelector: aSelector
	^ {#scenarioName -> aString.
		#scenarioDefinition -> aStringDefinition.
		#scenarioSelectorOriginator -> aSelector. }.