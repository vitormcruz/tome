*DomainValidationMagritte-Core
installDerivedValidationsInto: aClass

	self do: [ :desc | 
		(aClass >> desc accessor writeSelector) ast link: desc asGeneratedValidationMetaLink.
	].