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

	(((TomeParameter methods, TomeDelegatedParam methods) collect: #selector) includes: aMessage selector) 
		ifTrue: [ ^ aMessage sendTo: self ].
		
	((aMessage selector = #perform:) & (((TomeParameter methods, TomeDelegatedParam methods) collect: #selector) includes: aMessage argument))
		ifTrue: [ ^ aMessage sendTo: self ].
		
    parameterUsed := true.
    ^ aMessage sendTo: anObject.

]

{ #category : #setting }
TomeDelegatedParam >> markUsed [

	"Typically can be used to mark assignments as uses of this parameter.
	Assignments is the only use case that cannot be instrumented to change
	parameter used state."
	
	parameterUsed := true.
]
