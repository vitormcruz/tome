accessing
errors

	validationNotifications ifEmpty: [ ^ DataFrame new ].
	
	^ DataFrame fromTable: (validationNotifications chain 
																  collect: #asValidationErrorRow; 
																  ifNotEmpty: [:it | it addFirst: #(errorName issuer context); yourself ]).