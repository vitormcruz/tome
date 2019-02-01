accessors
descriptionOfProperty: anAssociation 

	validationName := anAssociation key.
	validationSelector := ('isAValid{1}ValidationPremisseFor:' format: {validationName asCamelCase}) asSymbol. 
	valueExpectedInValidation := anAssociation value.
	
