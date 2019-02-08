tests
testInstantiatingValidObject

	self assertBlock: [ (DvmDescribedClassForInstrumentation withProp1: 'valid') prop1 = 'valid'].