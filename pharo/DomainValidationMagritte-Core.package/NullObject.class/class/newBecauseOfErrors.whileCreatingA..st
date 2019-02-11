instance creation
newBecauseOfErrors: aCollection whileCreatingA: aClass 
	
	^ super new errors: aCollection; derivedClass: aClass.