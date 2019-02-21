tests
using: aGeneratedValidation validate: anObjectToValidate andExpect: anErrorStruture

	validationObserver reset.
	aGeneratedValidation validateFor: fakeObjectValidated
								withParamsProvided: {anObjectToValidate}
								fromContext: fakeContext.
								
	self assertCollection: validationObserver errorArray asSet
		  hasSameElements: anErrorStruture