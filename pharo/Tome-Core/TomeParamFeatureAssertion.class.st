Class {
	#name : #TomeParamFeatureAssertion,
	#superclass : #TomeParameter,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#instVars : [
		'assertBlock',
		'assertionActualValue',
		'assertionError'
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
	[ assertBlock value: self value: (assertionActualValue value) ] 
		on: TestFailure 
		do: [ :exception | 
			assertionError := exception.
			exception signal.
		].

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

{ #category : #accessing }
TomeParamFeatureAssertion >> assertionError [

	^ assertionError
]

{ #category : #printing }
TomeParamFeatureAssertion >> printOn: aStream [

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
