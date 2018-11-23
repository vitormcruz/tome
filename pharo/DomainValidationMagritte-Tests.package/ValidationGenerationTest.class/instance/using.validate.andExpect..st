tests
using: aGeneratedValidation validate: anObjectToValidate andExpect: anErrorStruture

	validationObserver reset.
	aGeneratedValidation validate: anObjectToValidate for: fakeObjectValidated fromContext: fakeContext.
	self assertCollection: validationObserver errors asArrayOfRows asSet 
	     hasSameElements: anErrorStruture.