Class {
	#name : #TomeScenarioAssertionParamViewFragment,
	#superclass : #TomeScenarioParamViewFragment,
	#category : #'Tome-Tools-WebApp-ViewFragment'
}

{ #category : #'instance creation' }
TomeScenarioAssertionParamViewFragment >> configureUsed [

	param assertionErrorMessage ifNotNil: [ :errorMessage |
		spanClass := 'scenario-param-assertion-failed'.
		title := errorMessage.
		^ self.
	].

	spanClass := 'scenario-param-was-used'.		
	title := 'Assertion Successfull!'.
]

{ #category : #accessing }
TomeScenarioAssertionParamViewFragment >> prettyParameter [

	^ param stringParam withoutPrefix: 'equals: '.
]
