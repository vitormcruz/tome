Class {
	#name : #TomeHTMLReportingChain,
	#superclass : #TomeScenarioReportingChain,
	#category : #'Tome-Tools-WebApp-SUnit-Reporting'
}

{ #category : #accessing }
TomeHTMLReportingChain >> handle: aTestResult [

	<todo: 'add tests to this' >

	| featureClass featureFile |
		
	featureClass := self extractFeatureClassFrom: aTestResult.
	featureFile := reportingFolder / (featureClass name, '.html').
	featureFile ensureDelete.
	featureFile ensureCreateFile.
	featureFile writeStreamDo: [ :stream |
		TomeFeatureView new 
			testResult: aTestResult; 
			selectedFeatureClass: featureClass; 
			generateSimplePageOnStream: stream 
	].
	
]
