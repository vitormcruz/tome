Class {
	#name : #TomeParameter,
	#superclass : #Object,
	#instVars : [
		'stringParam',
		'parameterUsed'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeParameter class >> createParameterFor: aStringParam [

	"maybe apply chain of responsability?"
	(TomeParamFeatureAssertion canBeCreatedFrom: aStringParam) ifTrue: [ ^ TomeParamFeatureAssertion newForDef: aStringParam ].
	^ TomeDelegatedParamHandler newForDef: aStringParam.
]

{ #category : #'instance creation' }
TomeParameter class >> newForDef: aStringParam [

	self = TomeParameter ifTrue: [ 
		self error: 'Use ''createparameterFor:'' instead. I am an abstract method for suclasses reuse.' 
	].

	^ self new stringParam: aStringParam.
]

{ #category : #converting }
TomeParameter >> asString [ 

	^ 'TomeParameter ("', self stringParam , '")'
]

{ #category : #initialization }
TomeParameter >> initialize [ 

	parameterUsed := false
]

{ #category : #accessing }
TomeParameter >> stringParam [

	^ stringParam
]

{ #category : #accessing }
TomeParameter >> stringParam: aStringParam [

    stringParam := aStringParam.
]

{ #category : #validation }
TomeParameter >> wasUsed [
	
	"All parameters must be used in a feature for it to be considered properly tested. "
	
	^ parameterUsed.
]
