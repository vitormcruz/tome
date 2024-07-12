Class {
	#name : #TomeDelegatedParamHandler,
	#superclass : #TomeParameter,
	#instVars : [
		'proxiedObject'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeDelegatedParamHandler class >> newForDef: aStringParam [

	| convertedObject |
	
	convertedObject := [ aStringParam asNumber ] on: Error do: [ aStringParam ].
	^ AvForwardingProxy target: convertedObject handler: ((super newForDef: aStringParam) proxiedObject: convertedObject).
]

{ #category : #'reflective operations' }
TomeDelegatedParamHandler >> handleMessage: aMessage toTarget: anObject [

	(((TomeParameter methods, TomeDelegatedParamHandler methods) collect: #selector) includes: aMessage selector) 
		ifTrue: [ ^ aMessage sendTo: self ].
		
    parameterUsed := true.
    ^ aMessage sendTo: anObject.

]

{ #category : #testing }
TomeDelegatedParamHandler >> isParamProxy [

	^ true
]

{ #category : #setting }
TomeDelegatedParamHandler >> markUsed [

	"Typically can be used to mark assignments as uses of this parameter.
	Assignments is the only use case that cannot be instrumented to change
	parameter used state."
	
	parameterUsed := true.
]

{ #category : #accessing }
TomeDelegatedParamHandler >> proxiedObject [

	^ proxiedObject.
]

{ #category : #accessing }
TomeDelegatedParamHandler >> proxiedObject: anObject [

	proxiedObject := anObject.
]

{ #category : #converting }
TomeDelegatedParamHandler >> proxyHandler [

	^ self.
]
