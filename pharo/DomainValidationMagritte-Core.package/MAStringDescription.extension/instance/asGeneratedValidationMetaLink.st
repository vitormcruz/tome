*DomainValidationMagritte-Core
asGeneratedValidationMetaLink
	^ MetaLink new metaObject: [ :instrumentedObject :parameter | 
										(self properties asGeneratedValidationsForParamNamed: accessor readSelector)
											inject: true
											into: [ :resultValidation :validation | 
														resultValidation | (validation validate: parameter for: instrumentedObject) ] ];
		selector: #value:value:;
		arguments: #(#object #arguments);
		control: #before