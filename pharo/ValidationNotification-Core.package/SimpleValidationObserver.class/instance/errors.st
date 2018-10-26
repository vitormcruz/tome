accessing
errors
	"Return all current errors in a DataFrame object"
	
	validationNotifications ifEmpty: [ ^ DataFrame new ].
	
	^ DataFrame fromTable: (validationNotifications chain 
																  collect: #asValidationErrorRow; 
																  ifNotEmpty: [:it | it addFirst: #(errorName issuer context); yourself ]).