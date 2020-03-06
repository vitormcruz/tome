instance creation
forObject: anObject withErrors: aCollection 

	^ super new objectInError: anObject; 
					errors: aCollection.