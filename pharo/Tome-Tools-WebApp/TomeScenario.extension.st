Extension { #name : #TomeScenario }

{ #category : #'*Tome-Tools-WebApp' }
TomeScenario >> asErrorScenarioHtml [

	^ TomeScenarioViewFragment withErrorFrom: self.
]

{ #category : #'*Tome-Tools-WebApp' }
TomeScenario >> asScenarioHtml [

	^ TomeScenarioViewFragment passedFrom: self.
]
