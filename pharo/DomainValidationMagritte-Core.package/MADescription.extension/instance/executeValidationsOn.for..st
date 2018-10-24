*DomainValidationMagritte-Core
executeValidationsOn: instrumentedObject for: parameter
	^ (self properties asGeneratedValidationsForParamNamed: accessor readSelector)
		inject: true
		into: [ :resultValidation :validation | resultValidation & (validation validate: parameter for: instrumentedObject) ].