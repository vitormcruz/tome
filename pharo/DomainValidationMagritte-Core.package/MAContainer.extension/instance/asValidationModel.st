*DomainValidationMagritte-Core
asValidationModel

	^ self collect: [ :magritteModel |  
		magritteModel asValidationModel
	].