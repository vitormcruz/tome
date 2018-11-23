tests
using: aGeneratedValidation validate: anObjectToValidate andExpect: anErrorStruture

	validationObserver reset.
	aGeneratedValidation validate: anObjectToValidate for: fakeObjectValidated fromContext: thisContext.
	self assert: validationObserver errors equals: anErrorStruture.