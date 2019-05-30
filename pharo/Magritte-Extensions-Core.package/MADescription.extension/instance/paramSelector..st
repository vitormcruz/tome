*Magritte-Extensions-Core
paramSelector: aSymbol 
	
	accessor ifNotNil: [ 
		ParamDescriptionError signal: 'You should not define accessor and paramSelector on the same description.', 
							    			  ' Use accessor on normal description and paramSelector for descriptions of method parameters.' 
	].

	DvmParamDescription value at: self put: aSymbol.