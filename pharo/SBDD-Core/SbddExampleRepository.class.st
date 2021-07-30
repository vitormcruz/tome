Class {
	#name : #SbddExampleRepository,
	#superclass : #Object,
	#instVars : [
		'header',
		'examples'
	],
	#category : 'SBDD-Core'
}

{ #category : #'instance creation' }
SbddExampleRepository class >> withHeader: exampleHeader [

	^ super new withHeader: exampleHeader.
]

{ #category : #'var accessors' }
SbddExampleRepository >> - aCollection [ 

	examples add: (header asFormatParametersOf: aCollection).

]

{ #category : #enumerating }
SbddExampleRepository >> collect: aBlockClosure [ 
	^ examples collect: aBlockClosure .
]

{ #category : #enumeration }
SbddExampleRepository >> do: aBlockClosure [ 
	examples do: aBlockClosure.
]

{ #category : #initialization }
SbddExampleRepository >> initialize [ 

	examples := OrderedCollection new.
]

{ #category : #'var accessors' }
SbddExampleRepository >> withHeader: exampleHeader [

	header := exampleHeader.
]
