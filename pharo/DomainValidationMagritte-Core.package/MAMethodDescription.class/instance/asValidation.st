*DomainValidationMagritte-Core
asValidation

	^ paramsDescriptions chain collectWithIndex: [:description : index | 
			description properties asValidationsForParam: description accessor readSelector indexedAt: index.
	  ]; flattened.