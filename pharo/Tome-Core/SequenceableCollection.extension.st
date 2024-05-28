Extension { #name : #SequenceableCollection }

{ #category : #'*Tome-Core' }
SequenceableCollection >> asFormatParametersOf: exampleValues [ 

	" Use the list of example values received by parameter to create a dictionary of paramName -> paramValue.
	  The number in the exampleValues list must be the same as mine."

	(exampleValues isNil or: [ self size ~= exampleValues size ]) 
		ifTrue: [ ^ 
			Error signal: 'There should be ', self size asString , ' parameters but found ', 
			              (exampleValues ifNil: [#()]) size asString 
		].
		

	^ (self paddedWith: exampleValues collect: [ :header :value | header -> value ]) asDictionary .
	

]

{ #category : #'*Tome-Core' }
SequenceableCollection >> asHeaderFor [

	^ TomeExampleTable withHeader: self.
]

{ #category : #'*Tome-Core' }
SequenceableCollection >> paddedWith: otherCollection collect: twoArgBlock [

	| collected |
	
	collected :=OrderedCollection new.

	1 to: (self size max: otherCollection size) do:
		[:index | 
			collected add: (twoArgBlock value: (self at: index ifAbsent: [])
			                           value: (otherCollection at: index ifAbsent: []))].
		
	^ collected.
]
