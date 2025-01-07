Class {
	#name : #TomeScenarioFailureViewFragment,
	#superclass : #TomeScenarioWithMessageViewFragment,
	#category : #'Tome-Tools-WebApp-ViewFragment'
}

{ #category : #rendering }
TomeScenarioFailureViewFragment >> messageCssBody [

	^ 'failure-body'.
]

{ #category : #accessing }
TomeScenarioFailureViewFragment >> preformatedMessageText [

	^ 'An assertion not linked to the specification failed: 

	', scenario testFailureError messageError.
]
