Class {
	#name : #TomeFeatureSuite,
	#superclass : #TestSuite,
	#instVars : [
		'featureClass'
	],
	#classVars : [
		'reportingChainObject'
	],
	#category : #'Tome-Core'
}

{ #category : #'as yet unclassified' }
TomeFeatureSuite class >> addReporting: aTomeScenarioReportingChain [

	reportingChainObject addNewHandler: aTomeScenarioReportingChain.

	
]

{ #category : #'as yet unclassified' }
TomeFeatureSuite class >> clearReporting [

	reportingChainObject clear.
]

{ #category : #helpers }
TomeFeatureSuite class >> forClass: aFeatureClass [
	
	^ self new
		featureClass: aFeatureClass; 
		name: aFeatureClass name.
]

{ #category : #'as yet unclassified' }
TomeFeatureSuite class >> initialize [

	reportingChainObject := TomeScenarioReportingChain new.
]

{ #category : #accessing }
TomeFeatureSuite >> featureClass: aFeatureClass [

	featureClass := aFeatureClass.
	
]

{ #category : #running }
TomeFeatureSuite >> run: aResult [

	[ super run: aResult ] ensure: [ reportingChainObject handle: aResult ].
]

{ #category : #running }
TomeFeatureSuite >> runUnmanaged: aResult [

	[ super runUnmanaged: aResult ] ensure: [ reportingChainObject handle: aResult ].
	
]
