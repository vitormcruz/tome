tests
using: aGeneratedValidation validate: anObjectToValidate andExpect: anErrorStruture

	validationObserver reset.
	aGeneratedValidation validate: anObjectToValidate for: fakeObjectValidated.
	self assert: validationObserver errors equals: anErrorStruture.