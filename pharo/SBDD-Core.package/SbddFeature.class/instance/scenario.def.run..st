scenario builder
scenario: aString def: aStringDefinition run: aBlock

	^ {SbddScenario withName: aString 
	 	            definition: aStringDefinition 
				      executionBlock: aBlock}
