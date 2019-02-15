tests
testAsStringWithThreeErrors

	| nullObjectDescription |
	
	nullObjectDescription := (NullObject newBecauseOfErrors: #('Error A' 'Error B' 'Error C') whileCreatingA: String) asString.
	self assert: nullObjectDescription equals: 'A NullObject of a String generated because of the following errors: Error A, Error B, Error C'.