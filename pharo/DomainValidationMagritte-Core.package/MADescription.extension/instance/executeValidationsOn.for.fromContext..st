*DomainValidationMagritte-Core
executeValidationsOn: instrumentedObject for: parameters fromContext: context

	^ (self properties asGeneratedValidationsForParamNamed: accessor readSelector)
		inject: true
		into: [ :resultValidation :validation | 
					resultValidation & (validation validate: (parameters at: 1) for: instrumentedObject fromContext: context) 
		].