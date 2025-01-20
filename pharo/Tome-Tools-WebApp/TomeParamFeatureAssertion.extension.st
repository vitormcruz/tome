Extension { #name : #TomeParamFeatureAssertion }

{ #category : #'*Tome-Tools-WebApp' }
TomeParamFeatureAssertion >> asHtmlParam [

	^ TomeScenarioAssertionParamViewFragment on: self.
]

{ #category : #'*Tome-Tools-WebApp' }
TomeParamFeatureAssertion >> assertionErrorMessage [

	^ assertionErrorMessage
]
