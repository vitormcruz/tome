scenario builder
scenario: aString def: aStringDefinition run: aBlock

	^ sbddFeatureInstance scenario: aString 
								def: aStringDefinition 
								contextSelector: thisContext sender sender selector.