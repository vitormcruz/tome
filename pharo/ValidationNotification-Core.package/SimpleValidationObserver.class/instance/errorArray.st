accessing
errorArray
	"Return all current errors as an array in the following format: {errorMessage. issuer. context.} "
	
	validationNotifications ifEmpty: [ ^ {  } ].
	^ validationNotifications collect: #asValidationErrorRow.