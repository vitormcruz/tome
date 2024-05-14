Extension { #name : #TomeParameter }

{ #category : #'*Tome-Tools-WebApp' }
TomeParameter >> asHtmlParam [
	
	^ TomeScenarioParamViewFragment on: self.
]
