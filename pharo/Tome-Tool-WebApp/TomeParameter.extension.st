Extension { #name : #TomeParameter }

{ #category : #'*Tome-Tool-WebApp' }
TomeParameter >> asHtmlParam [
	
	^ TomeScenarioHtmlParam on: self.
]
