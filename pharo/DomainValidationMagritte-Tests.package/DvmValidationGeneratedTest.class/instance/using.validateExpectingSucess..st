tests
using: aGeneratedValidation validateExpectingSucess: anObjectToValidate

	validationObserver reset.
	aGeneratedValidation validate: anObjectToValidate for: fakeObjectValidated fromContext: fakeContext. 
	self assert: validationObserver isValidationSuccessful.