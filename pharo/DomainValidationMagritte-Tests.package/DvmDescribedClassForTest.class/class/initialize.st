class initialization
initialize 

	self magritteDescription do: [ :desc | 
		(self >> desc accessor writeSelector) ast link: desc asGeneratedValidationMetaLink.
	].