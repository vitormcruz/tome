*DomainValidationMagritte-Core
asGeneratedValidationsForParamNamed: aSymbol

	^ self associations collect: [:descriptionOfParam | descriptionOfParam asGeneratedValidationForParamNamed: aSymbol].