Extension { #name : #SequenceableCollection }

{ #category : #'*Tome-Core' }
SequenceableCollection >> asFormatParametersOf: exampleValues [ 

	| formatParameters |
	
	formatParameters := Dictionary new.
	self paddedWith: exampleValues do: [ :header :value |
		formatParameters add: header -> value.
	].
	
	^ formatParameters. 
]

{ #category : #'*Tome-Core' }
SequenceableCollection >> asHeaderFor [

	^ TomeExampleTable withHeader: self.
]
