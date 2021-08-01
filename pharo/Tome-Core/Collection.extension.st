Extension { #name : #Collection }

{ #category : #'*Tome-Core' }
Collection >> asFormatParametersOf: exampleValues [ 

	| formatParameters |
	
	formatParameters := Dictionary new.
	self paddedWith: exampleValues do: [ :header :value |
		formatParameters add: header -> value.
	].
	
	^ formatParameters. 
]
