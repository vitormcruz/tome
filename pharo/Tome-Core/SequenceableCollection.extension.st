Extension { #name : #SequenceableCollection }

{ #category : #'*Tome-Core' }
SequenceableCollection >> asFormatParametersOf: exampleValues [ 

	" Use the list of example values received by parameter to create a dictionary of paramName -> paramValue.
	  The number in the exampleValues list must be the same as mine."

	(exampleValues isNil or: [ exampleValues isEmpty or: [ self size ~= exampleValues size ]]) 
		ifTrue: [ ^ 
			Error signal: 'There should be ', self size asString , ' parameters but found ', (exampleValues ifNil: [#()]) size asString 
		].
		

	^ Dictionary new in: [ :parametersWithValues |
	  		self paddedWith: exampleValues do: [ :header :value |
				parametersWithValues add: header -> value.
			]
		];
		yourself.
	

]

{ #category : #'*Tome-Core' }
SequenceableCollection >> asHeaderFor [

	^ TomeExampleTable withHeader: self.
]
