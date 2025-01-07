Extension { #name : #TomeScenario }

{ #category : #'*Tome-Tools-WebApp' }
TomeScenario >> asScenarioHtml [
	
	^ TomeScenarioViewFragment newFrom: self.
]
