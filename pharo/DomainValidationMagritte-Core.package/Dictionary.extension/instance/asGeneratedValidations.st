*DomainValidationMagritte-Core
asGeneratedValidations

	^ { [ :objectUnderValidation :objectDescribed | objectDescribed issueError: 'p1.mandatory' ] }.