scenario builder
scenario: aString def: aStringDefinition run: aBlock
	
	"Just return the block contextualized into the SbddFeature instance used to execute the scenario"

	^ aBlock. 