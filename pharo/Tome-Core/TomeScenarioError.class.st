Class {
	#name : #TomeScenarioError,
	#superclass : #Object,
	#instVars : [
		'messageError',
		'failure',
		'debugStackTraceText'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeScenarioError class >> newFrom: anError [

	^ self new error: anError.
	
]

{ #category : #accessing }
TomeScenarioError >> debugStackTraceText [

	^ debugStackTraceText
]

{ #category : #'error handling' }
TomeScenarioError >> error: anError [

	messageError := anError messageText.
	debugStackTraceText :=  String streamContents: [ :s | anError signalerContext printDebugStackOn: s ].
	failure := anError isKindOf: TestFailure.
]

{ #category : #testing }
TomeScenarioError >> isError [

	"If the error is not a TestFailure, then a generic error happened"

	^ failure not.
]

{ #category : #testing }
TomeScenarioError >> isTestFailure [

	^ failure.
]

{ #category : #accessing }
TomeScenarioError >> messageError [

	^ messageError
]
