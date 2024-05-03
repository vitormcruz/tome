Extension { #name : #TomeScenario }

{ #category : #'*Tome-Tool-WebApp' }
TomeScenario >> asErrorScenarioHtml [

	^ TomeScenarioHtml withErrorFrom: self.
]

{ #category : #'*Tome-Tool-WebApp' }
TomeScenario >> asScenarioHtml [

	^ TomeScenarioHtml passedFrom: self.
]
