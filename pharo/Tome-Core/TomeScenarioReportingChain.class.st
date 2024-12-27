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

{ #category : #chaining }
TomeScenarioReportingChain >> clear [ 

	nextHandler := nil.
]

{ #category : #utils }
TomeScenarioReportingChain >> extractFeatureClassesFrom: aTestResult [

	aTestResult classesTested ifEmpty: [ ^ self ]. "nothing to do"
	^ aTestResult classesTested asOrderedCollection select: #isFeature.
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
TomeScenarioReportingChain >> reportingFileFor: featureClass [

	| featureFile |
	featureFile := reportingFolder / (featureClass featureName , '.html').
	featureFile ensureDelete.
	featureFile ensureCreateFile.
	self traceCr: 'Generated Reporting File for class ', featureClass name, 'at: ', featureFile fullName.
	^ featureFile
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
