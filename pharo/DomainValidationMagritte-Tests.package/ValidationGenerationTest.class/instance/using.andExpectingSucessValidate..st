tests
using: aGeneratedValidation andExpectingSucessValidate: anObjectToValidate

	validationObserver reset.
	aGeneratedValidation validate: anObjectToValidate for: fakeObjectValidated.
	self assert: validationObserver isSuccessful.