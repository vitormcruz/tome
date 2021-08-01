Extension { #name : #SequenceableCollection }

{ #category : #'*Tome-Core' }
SequenceableCollection >> asHeaderFor [

	^ TomeExampleRepository withHeader: self.
]
