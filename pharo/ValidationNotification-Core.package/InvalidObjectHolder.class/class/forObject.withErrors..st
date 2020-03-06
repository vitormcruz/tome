instance creation
forObject: anObject withErrors: aCollection 

	^ super new invalidObject: anObject; 
					errors: aCollection.