Class {
	#name : #TomeParamFeatureAssertion,
	#superclass : #TomeParameter,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#instVars : [
		'assertBlock',
		'assertionActualValue'
	],
	#category : #'Tome-Core'
}

{ #category : #testing }
TomeParamFeatureAssertion class >> canBeCreatedFrom: aStringParam [

	^ aStringParam beginsWith: 'equals:'
]

{ #category : #converting }
TomeParamFeatureAssertion >> asString [ 

	^ 'Assertion parameter ("', self stringParam , '")'
]

{ #category : #'validate asserting' }
TomeParamFeatureAssertion >> assertSuccess [

    "Verify if the assertion is successful for an object.
     Raises an AssertionFailure if the assertion fails or if this method is never called."
    
    parameterUsed  := true.
    assertBlock value: self value: (assertionActualValue value).

]

{ #category : #'validate asserting' }
TomeParamFeatureAssertion >> assertSuccessFor: anObject [

	"Verify if the assertion is successful for an object.
	Raises an AssertionFailure if the assertion fails or if this method is never called."
	
	self assertionActualValue: anObject.
	self assertSuccess.

]

{ #category : #'validate asserting' }
TomeParamFeatureAssertion >> assertionActualValue: aValueOrBlock [

	" Register the actual value for the assertion represented by this className.
	If a block is provided, it's value will be fetched lazilly."
	
	assertionActualValue := aValueOrBlock.
	
]

{ #category : #printing }
TomeParamFeatureAssertion >> printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that
	identifies the receiver."

	stringParam printOn: aStream.
]

{ #category : #accessing }
TomeParamFeatureAssertion >> stringParam: aStringParam [

    stringParam := aStringParam.
    assertBlock := Smalltalk compiler evaluate: '[ :asserter :actualObject | asserter assert: (actualObject) ' , aStringParam , ' ]'.
]

{ #category : #tests }
TomeParamFeatureAssertion >> testFail [

	"Verify if the assertion fails for an object that can be converted to string before doing the actual assertion. 
	It is usefull to validate the state of the system before the tested action execution"
	
	| actualValue |
	
	actualValue := (assertionActualValue value).

	[ assertBlock value: self value: (assertionActualValue value) ] 
		on: TestFailure 
		do: [ ^ self "testFail Ok!" ] .

	TestFailure signal: 'Test for failure did not failed for "', self stringParam , 
								 '" and the value tested of "', actualValue asString , '" '
]

{ #category : #tests }
TomeParamFeatureAssertion >> testFailFor: anObject [

	"Verify if the assertion fails for an object that can be converted to string before doing the actual assertion. 
	It is usefull to validate the state of the system before the tested action execution"

	[ assertBlock value: self value: anObject ] on: TestFailure do: [ ^ self "testFailOk" ] .

	TestFailure signal: 'Test for failure did not failed for "', self stringParam , 
								 '" and the value tested of "', anObject asString , '" '
]

{ #category : #'validate asserting' }
TomeParamFeatureAssertion >> when: aBlock assertFor: aBlockReturningExpectedVal [

	(aBlock isBlock & aBlockReturningExpectedVal isBlock) 
		ifFalse: [ Error signal: 'wen:assertFor: needs both params to be blocks so that when is executed only after ',
											'testing current state, and the expected val to be reaclculated after when is executed' ].
										
	self assertionActualValue: aBlockReturningExpectedVal.
	self testFail.
	aBlock value.
	self assertSuccess.
	
]
