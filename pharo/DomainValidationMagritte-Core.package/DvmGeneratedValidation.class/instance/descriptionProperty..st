accessors
descriptionProperty: anAssociation 

	validationName := anAssociation key.
	validationPremisse := anAssociation value.
	validation := DvmValidationPropertyMapper perform: (validationName , ':') asSymbol
														  with: validationPremisse. 
	
