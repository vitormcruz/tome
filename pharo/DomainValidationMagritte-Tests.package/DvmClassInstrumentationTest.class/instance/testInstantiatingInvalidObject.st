tests
testInstantiatingInvalidObject

	self assertBlock: [ (DvmDescribedClassForTest withProp1: nil) isKindOf: NilObject].