Class {
	#name : #TomeHTMLReportingChain,
	#superclass : #TomeScenarioReportingChain,
	#instVars : [
		'reportingFolder'
	],
	#category : #'Tome-Tools-WebApp-SUnit-Reporting'
}

{ #category : #accessing }
TomeHTMLReportingChain >> handle: aTestResult [

	<todo: 'add tests to this' >

	| featureClass featureFile |
	
	aTestResult classesTested ifEmpty: [ ^ self ]. "nothing to do"
	aTestResult classesTested size > 1
		ifTrue: [ Error signal: 'Feature reporting handling should process a test result',
					                'with only one Class Tested, which is the class that represents the Feature' ].
		
	featureClass := aTestResult classesTested asOrderedCollection first.
	
	reportingFolder ensureDeleteAll. 
	featureFile := reportingFolder / (featureClass name, '.html').
	featureFile ensureCreateFile.
	featureFile writeStreamDo: [ :stream |
		TomeFeatureView new 
			testResult: aTestResult; 
			selectedFeatureClass: featureClass; 
			generateSimplePageOnStream: stream 
	].
	
]

{ #category : #accessing }
TomeHTMLReportingChain >> reportingFolder: aPathString [

	reportingFolder := aPathString asFileReference.
]
