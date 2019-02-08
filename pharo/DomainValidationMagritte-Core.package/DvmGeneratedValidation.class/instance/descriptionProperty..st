accessors
descriptionProperty: anAssociation 

	validationName := anAssociation key.
	validationSelector := ('isAValid', validationName asCamelCase , 'ValidationPremisseFor:') asSymbol. 
	valueExpectedInValidation := anAssociation value.
	
