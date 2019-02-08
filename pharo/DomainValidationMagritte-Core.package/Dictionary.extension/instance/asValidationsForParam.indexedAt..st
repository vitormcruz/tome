*DomainValidationMagritte-Core
asValidationsForParam: aSymbol indexedAt: anInteger

	^ self associations collect: [:descriptionOfParam | 
		descriptionOfParam asValidationForParam: aSymbol indexedAt: anInteger
	].