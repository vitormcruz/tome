Extension { #name : #TomeScenario }

{ #category : #'*Tome-Tools-WebApp' }
TomeScenario >> asErrorScenarioHtml [

	^ TomeScenarioHtml withErrorFrom: self.
]

{ #category : #'*Tome-Tools-WebApp' }
TomeScenario >> asScenarioHtml [

	^ TomeScenarioHtml passedFrom: self.
]
