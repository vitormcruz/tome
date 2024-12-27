Class {
	#name : #TomeHTMLReportingChain,
	#superclass : #TomeScenarioReportingChain,
	#category : #'Tome-Tools-WebApp-SUnit-Reporting'
}

{ #category : #accessing }
TomeHTMLReportingChain >> handle: aTestResult [

	<todo: 'add tests to this'>
	
	(self extractFeatureClassesFrom: aTestResult)
		do: [ :featureClass |
			TomeFeatureView new
				testResult: aTestResult;
				selectedFeatureClass: featureClass;
				generateSimplePageOnStream: (self reportingFileFor: featureClass)
		]
]
