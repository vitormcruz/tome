Extension { #name : #TomeFeature }

{ #category : #'*Tome-Adapter-Web' }
TomeFeature class >> printOnAsHtml: aStream [

	| aTomeFeature |
	aTomeFeature := self new.

	aStream
		nextPutAll: ' Feature: ';
		nextPutAll: '<b>';
		nextPutAll: (aTomeFeature class prettyName ifNil: [ aTomeFeature class name ]);
		nextPutAll: '</b>';
		nextPut: Character cr
]
