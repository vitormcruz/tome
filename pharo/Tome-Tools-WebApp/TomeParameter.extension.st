Extension { #name : #TomeParameter }

{ #category : #'*Tome-Tools-WebApp' }
TomeParameter >> asHtmlParam [
	
	^ TomeScenarioHtmlParam on: self.
]
