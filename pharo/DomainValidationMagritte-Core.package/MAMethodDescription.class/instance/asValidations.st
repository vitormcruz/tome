*DomainValidationMagritte-Core
asValidations

	^ paramsDescriptions chain collectWithIndex: [:description : index | 
			description properties asValidationsForParam: description accessor readSelector indexedAt: index.
	  ]; flattened.