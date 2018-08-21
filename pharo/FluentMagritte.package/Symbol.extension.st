Extension { #name : #Symbol }

{ #category : #'*FluentMagritte' }
Symbol >> isA: aClass [ 
	^ aClass magritteDescriptionClass new.
]
