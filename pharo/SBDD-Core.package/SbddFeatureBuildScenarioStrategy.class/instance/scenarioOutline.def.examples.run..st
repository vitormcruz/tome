scenario builder
scenarioOutline: aString def: aStringDescription examples: examples run: aBlock

	| contextSelector |
	
	contextSelector := thisContext sender sender selector.
	
	^ examples collect: [ :example | 
	  		sbddFeatureInstance scenario: aString 
									  def: (aStringDescription format: example)
									  contextSelector: contextSelector
	  ].