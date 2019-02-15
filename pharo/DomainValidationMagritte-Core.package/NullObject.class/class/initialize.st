class initialization
initialize 

	self initializeValidationInstrumentation.
	errorKeyMap := { 'NullObject.derivedClass.required' -> 
                    'Null objects should be a representation of a Class whose creation has failed, but you do not provided this information.'. 
						
						
												
						} asDictionary.
