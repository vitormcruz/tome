Class {
	#name : #TomeDelegatedParam,
	#superclass : #TomeParameter,
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeDelegatedParam class >> newForDef: aStringParam [

	| convertedObject |
	
	convertedObject := [ aStringParam asNumber ] on: Error do: [ aStringParam ].
	^ AvForwardingProxy target: convertedObject handler: (super newForDef: aStringParam).
]

{ #category : #'reflective operations' }
TomeDelegatedParam >> handleMessage: aMessage toTarget: anObject [

    ((TomeParameter methods collect: #selector) includes: aMessage selector) ifTrue: [ ^ aMessage sendTo: self ].
    parameterUsed := true.
    ^ aMessage sendTo: anObject.

]
