Class {
	#name : #TomeParamFeatureAssertion,
	#superclass : #TomeParameter,
	#traits : 'TAssertable',
	#classTraits : 'TAssertable classTrait',
	#instVars : [
		'assertBlock'
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
TomeParamFeatureAssertion >> assertSuccessFor: anObject [

    "Verify if the assertion is successful for an object.
     Raises an AssertionFailure if the assertion fails or if this method is never called."
    
    parameterUsed  := true.
    assertBlock value: self value: anObject.

]

{ #category : #accessing }
TomeParamFeatureAssertion >> stringParam: aStringParam [

    stringParam := aStringParam.
    assertBlock := Smalltalk compiler evaluate: '[ :asserter :actualObject | asserter assert: (actualObject) ' , aStringParam , ' ]'.
]

{ #category : #tests }
TomeParamFeatureAssertion >> testFailFor: anObject [

    "Verify if the assertion fails for an object that can be converted to string before doing the actual assertion. 
     It is usefull to validate the state of the system before the tested action execution"

    assertBlock value: self.
]
