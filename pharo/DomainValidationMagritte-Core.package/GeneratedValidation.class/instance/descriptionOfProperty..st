accessors
descriptionOfProperty: anAssociation 

	validationSelector := ('isAValid{1}ValidationPremisseFor:' format: {anAssociation key asCamelCase.}) asSymbol. 
	valueExpectedInValidation := anAssociation value.
	
