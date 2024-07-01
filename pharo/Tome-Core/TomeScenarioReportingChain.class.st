"
Base handle for Tome Reporting
"
Class {
	#name : #TomeScenarioReportingChain,
	#superclass : #Object,
	#instVars : [
		'nextHandler'
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

{ #category : #accessing }
TomeScenarioReportingChain >> handle: aTestResult [

	nextHandler ifNil: [ ^ self ].
	self handleNext: aTestResult.
	
]

{ #category : #chaining }
TomeScenarioReportingChain >> handleNext: aTestResult [

	nextHandler handle: aTestResult.
	
]

{ #category : #accessing }
TomeScenarioReportingChain >> nextHandler [

	^ nextHandler
]

{ #category : #accessing }
TomeScenarioReportingChain >> nextHandler: anObject [

	nextHandler := anObject
]
