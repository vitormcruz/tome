accessing
errors
	"Return all current errors"
	
	validationNotifications ifEmpty: [ ^ {  } ].
	^ validationNotifications collect: #asValidationErrorRow.