"
Base handle for Tome Reporting
"
Class {
	#name : #TomeScenarioReportingChain,
	#superclass : #Object,
	#instVars : [
		'nextHandler',
		'reportingFolder'
	],
	#category : #'Tome-Core'
}

{ #category : #chaining }
TomeScenarioReportingChain >> addNewHandler: aScenarioReportingChain [

	| currentHandler |
	
	currentHandler := self.
	[ currentHandler nextHandler isNotNil ]
		whileTrue: [ currentHandler := currentHandler nextHandler ].
		
	currentHandler nextHandler: aScenarioReportingChain.
]

{ #category : #public }
TomeScenarioReportingChain >> clear [ 

	nextHandler := nil.
]

{ #category : #utils }
TomeScenarioReportingChain >> extractFeatureClassFrom: aTestResult [

	aTestResult classesTested ifEmpty: [ ^ self ]. "nothing to do"
	aTestResult classesTested size > 1
		ifTrue: [ Error signal: 'Feature reporting handling should process a test result ',
					                'with only one Class Tested, which is the class that represents the Feature' ].
		
	^ aTestResult classesTested asOrderedCollection first.
]

{ #category : #chaining }
TomeScenarioReportingChain >> handle: aTestResult [
	
	"Handle the test result"
	
]

{ #category : #chaining }
TomeScenarioReportingChain >> handleNext: aTestResult [

	nextHandler ifNil: [ ^ self ].
	nextHandler templateHandle: aTestResult.
	
]

{ #category : #accessing }
TomeScenarioReportingChain >> nextHandler [

	^ nextHandler
]

{ #category : #accessing }
TomeScenarioReportingChain >> nextHandler: anObject [

	nextHandler := anObject
]

{ #category : #accessing }
TomeScenarioReportingChain >> reportingFolder: aPathString [

	reportingFolder := aPathString asFileReference.
]

{ #category : #chaining }
TomeScenarioReportingChain >> startChainFor: aTestResult [

	self templateHandle: aTestResult.
]

{ #category : #accessing }
TomeScenarioReportingChain >> templateHandle: aTestResult [
	
	"Template call to the chain of responsability. 
	The HotSpot method is the #handle: method, implement it while subclassing this object."

	self handle: aTestResult.
	self handleNext: aTestResult.
	
]
