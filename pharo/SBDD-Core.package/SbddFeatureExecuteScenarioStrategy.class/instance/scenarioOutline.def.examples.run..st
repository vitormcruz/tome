scenario builder
scenarioOutline: aString def: aStringDescription examples: examples run: aBlock

	"Just return the block contextualized into the SbddFeature instance used to execute the scenario"

	^ aBlock. 