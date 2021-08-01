Extension { #name : #SequenceableCollection }

{ #category : #'*Tome-Core' }
SequenceableCollection >> asHeaderFor [

	^ SbddExampleRepository withHeader: self.
]
