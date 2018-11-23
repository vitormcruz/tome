tests
using: aGeneratedValidation andExpectingSucessValidate: anObjectToValidate

	validationObserver reset.
	aGeneratedValidation validate: anObjectToValidate for: fakeObjectValidated fromContext: thisContext.
	self assert: validationObserver isValidationSuccessful.