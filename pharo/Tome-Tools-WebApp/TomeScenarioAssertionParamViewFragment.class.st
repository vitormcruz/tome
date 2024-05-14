Class {
	#name : #TomeScenarioAssertionParamViewFragment,
	#superclass : #TomeScenarioParamViewFragment,
	#category : #'Tome-Tools-WebApp'
}

{ #category : #'instance creation' }
TomeScenarioAssertionParamViewFragment >> configureUsed [

	param assertionError ifNotNil: [ :error |
		spanClass := 'scenario-param-assertion-failed'.
		title := error messageText.
		^ self.
	].

	spanClass := 'scenario-param-was-used'.		
	title := 'Assertion Successfull!'.
]

{ #category : #accessing }
TomeScenarioAssertionParamViewFragment >> prettyParameter [

	^ param stringParam withoutPrefix: 'equals: '.
]
