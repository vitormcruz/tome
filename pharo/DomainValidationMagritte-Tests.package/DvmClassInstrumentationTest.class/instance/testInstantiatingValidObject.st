tests
testInstantiatingValidObject

	self assertBlock: [ (DvmDescribedClassForTest withProp1: 'valid') prop1 = 'valid'].