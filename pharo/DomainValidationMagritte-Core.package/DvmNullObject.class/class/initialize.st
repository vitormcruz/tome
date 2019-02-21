class initialization
initialize 

	self initializeValidationInstrumentation.
	errorKeyMap := { 'DvmNullObject.derivedClass:.derivedClass.required' -> 
                    'Null objects should be a representation of a Class whose creation has failed, but you do not provided this information.'. 

						  'DvmNullObject.errors:.errors.empty' -> 
                     'Null objects should be created with at least one underlined error, but none was provided.'. 
												
						} asDictionary.
