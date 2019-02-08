tests
using: aGeneratedValidation validateExpectingSucess: anObjectToValidate

	validationObserver reset.
	
	aGeneratedValidation validateFor: fakeObjectValidated
					 		   withParamsProvided: {anObjectToValidate}
		                  fromContext: fakeContext.
		
	self assert: validationObserver isValidationSuccessful