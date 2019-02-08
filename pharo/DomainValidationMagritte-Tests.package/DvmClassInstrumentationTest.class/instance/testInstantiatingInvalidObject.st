tests
testInstantiatingInvalidObject

	self assertBlock: [ (DvmDescribedClassForInstrumentation withProp1: nil) isKindOf: NilObject].