Class {
	#name : #TomeDummyEmpytyFeature,
	#superclass : #TomeFeature,
	#category : #'Tome-Tests'
}

{ #category : #testing }
TomeDummyEmpytyFeature class >> isAbstract [

	^ true.
]

{ #category : #'as yet unclassified' }
TomeDummyEmpytyFeature >> Feature_Definition_without_pragma [

	self scenario: 'dummy' def: 'dummy' run: [ 'dummy' ].
]
