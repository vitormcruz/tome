instance creation
fromPropertyDescription: anAssociation andParamNamed: aSymbol indexedAt: anInteger

	^ super new descriptionProperty: anAssociation; 
					validatedParamName: aSymbol; 
					paramNumber: anInteger.
	