test support
expectedErrorForValidation: errorString andParameter: aSymbol

	^ { { fakeObjectValidated class name, '.', fakeContext methodSelector, '.', aSymbol, '.', errorString. fakeObjectValidated. fakeContext } }.