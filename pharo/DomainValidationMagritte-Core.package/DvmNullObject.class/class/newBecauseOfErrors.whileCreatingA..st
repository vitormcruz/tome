instance creation
newBecauseOfErrors: aCollection whileCreatingA: aClass 
	
	^ SimpleValidationObserver new execute: [ super new errors: aCollection; derivedClass: aClass.	]
 		 							      onValidationError: [:errors | 
												Error signal: (Character cr join: (self extractErrorMessagesFrom: errors))
											].