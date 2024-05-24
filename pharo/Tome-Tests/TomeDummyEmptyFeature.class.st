Class {
	#name : #TomeDummyEmptyFeature,
	#superclass : #TomeFeature,
	#category : #'Tome-Tests'
}

{ #category : #testing }
TomeDummyEmptyFeature class >> isAbstract [

	^ true.
]

{ #category : #'as yet unclassified' }
TomeDummyEmptyFeature >> Feature_Definition_without_pragma [

	self scenario: 'dummy' def: 'dummy' run: [ 'dummy' ].
]
