*DomainValidationMagritte-Core
executeValidationsOn: instrumentedObject for: parameter fromContext: context

	^ (self properties asGeneratedValidationsForParamNamed: accessor readSelector)
		inject: true
		into: [ :resultValidation :validation | 
					resultValidation & (validation validate: parameter for: instrumentedObject fromContext: context) 
		].