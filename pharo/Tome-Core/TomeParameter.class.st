"
I am a parameter in a Tome Scenario implementation. For example:

```
	scenario: 'Some Scenario'
	     def: 'defines a ""parameter"" delimited by quotation marks, wich will be passed into the implemention block 
	     run: [ :param | self assert: param = 'parameter' ]
	
```

The `param` will be an instance of myself with the contents enclosed by the quatation marks from the scenario definition.

I am a superclass to common behavior used by my subclasses, see them for details on how parameters are managed on Tome.
"
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
