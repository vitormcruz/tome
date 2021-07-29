scenario builder
scenarioOutline: aString def: aStringDescription examples: examples run: aBlock

	^ examples chain 
				  collect: [ :example | 
				  		self scenario: aString 
						     def: (aStringDescription format: example)
						     run: aBlock
				  ]; 
				  flattened.