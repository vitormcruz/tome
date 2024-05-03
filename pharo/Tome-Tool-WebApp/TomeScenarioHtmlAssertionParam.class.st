Class {
	#name : #TomeScenarioHtmlAssertionParam,
	#superclass : #TomeScenarioHtmlParam,
	#category : #'Tome-Tool-WebApp'
}

{ #category : #'instance creation' }
TomeScenarioHtmlAssertionParam >> configureUsed [

	param assertionError ifNotNil: [ :error |
		spanClass := 'scenario-param-assertion-failed'.
		title := error messageText.
		^ self.
	].

	spanClass := 'scenario-param-was-used'.		
	title := 'Assertion Successfull!'.
]

{ #category : #accessing }
TomeScenarioHtmlAssertionParam >> prettyParameter [

	^ param stringParam withoutPrefix: 'equals: '.
]
