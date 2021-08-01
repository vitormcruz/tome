Class {
	#name : #TomeExampleRepository,
	#superclass : #Object,
	#instVars : [
		'header',
		'examples'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeExampleRepository class >> withHeader: exampleHeader [

	^ super new withHeader: exampleHeader.
]

{ #category : #'var accessors' }
TomeExampleRepository >> - aCollection [ 

	examples add: (header asFormatParametersOf: aCollection).

]

{ #category : #enumerating }
TomeExampleRepository >> collect: aBlockClosure [ 
	^ examples collect: aBlockClosure .
]

{ #category : #enumeration }
TomeExampleRepository >> do: aBlockClosure [ 
	examples do: aBlockClosure.
]

{ #category : #initialization }
TomeExampleRepository >> initialize [ 

	examples := OrderedCollection new.
]

{ #category : #'var accessors' }
TomeExampleRepository >> withHeader: exampleHeader [

	header := exampleHeader.
]
