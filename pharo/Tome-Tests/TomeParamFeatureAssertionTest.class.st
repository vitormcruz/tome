Class {
	#name : #TomeParamFeatureAssertionTest,
	#superclass : #TestCase,
	#category : #'Tome-Tests'
}

{ #category : #tests }
TomeParamFeatureAssertionTest >> testFailFor_failing [

	| param actualValueAsserted |
	param := TomeParamFeatureAssertion newForDef: 'equals: 1'.
	actualValueAsserted := 2.
	self should: [ param testFailFor: actualValueAsserted. true ] description: 'Should have run the test without error'.

	

]

{ #category : #tests }
TomeParamFeatureAssertionTest >> testFailFor_passing [

	| param actualValueAsserted |
	param := TomeParamFeatureAssertion newForDef: 'equals: 1'.
	actualValueAsserted := 1.
	self	should: [ param testFailFor: actualValueAsserted. true ] 
			raise: TestFailure 
			withExceptionDo: [ :ex | self assert: ex messageText 
	                                    equals: 'Test for failure did not failed for "equals: 1" and the value tested of "1" ']

	

]

{ #category : #tests }
TomeParamFeatureAssertionTest >> test_validate_when_parameter_assertion_fails [

    | param |
    param := TomeParamFeatureAssertion newForDef: 'equals: 1'.
    param assertSuccessFor: 1.
    self assert: (param wasUsed).

	

]

{ #category : #tests }
TomeParamFeatureAssertionTest >> test_validate_when_parameter_assertion_was_not_used [

    | param |
    param := TomeParamFeatureAssertion newForDef: 'equals: 1'.
    self deny: (param wasUsed).

	

]

{ #category : #tests }
TomeParamFeatureAssertionTest >> test_validate_when_parameter_ok_assertion_was_used [

    | param |
    param := TomeParamFeatureAssertion newForDef: 'equals: 1'.
    param assertSuccessFor: 1.
    self assert: (param wasUsed).

	

]
