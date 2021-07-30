Extension { #name : #SequenceableCollection }

{ #category : #'*SBDD-Core' }
SequenceableCollection >> asHeaderFor [

	^ SbddExampleRepository withHeader: self.
]
