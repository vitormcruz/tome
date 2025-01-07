Class {
	#name : #TomeScenarioErrorViewFragment,
	#superclass : #TomeScenarioWithMessageViewFragment,
	#category : #'Tome-Tools-WebApp-ViewFragment'
}

{ #category : #rendering }
TomeScenarioErrorViewFragment >> extractErrorStackTrace [

	^ String streamContents: [ :s | 
		scenario testFailureError messageError printOn: s. 
		s cr. 
		scenario testFailureError debugStackTraceText printOn: s 
	]			
]

{ #category : #rendering }
TomeScenarioErrorViewFragment >> messageCssBody [

	^ 'error-body'.
]

{ #category : #accessing }
TomeScenarioErrorViewFragment >> preformatedMessageText [

	^  self extractErrorStackTrace.
]
