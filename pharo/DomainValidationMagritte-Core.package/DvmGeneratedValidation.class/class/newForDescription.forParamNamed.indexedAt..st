instance creation
newForDescription: anAssociation forParamNamed: aSymbol indexedAt: anInteger

	^ super new descriptionOfProperty: anAssociation; 
					validatedParamName: aSymbol; 
					paramNumber: anInteger.
	