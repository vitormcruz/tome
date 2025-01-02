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

{ #category : #reporting }
TomeFeatureSuite class >> addReporting: aTomeScenarioReportingChain [

	reportingChainObject addNewHandler: aTomeScenarioReportingChain.

	
]

{ #category : #reporting }
TomeFeatureSuite class >> clearReporting [

	reportingChainObject clear.
]

{ #category : #helpers }
TomeFeatureSuite class >> forClass: aFeatureClass [
	
	^ self new
		featureClass: aFeatureClass; 
		name: aFeatureClass name.
]

{ #category : #initialization }
TomeFeatureSuite class >> initialize [

	reportingChainObject := TomeScenarioReportingChain new.
]

{ #category : #accessing }
TomeFeatureSuite >> featureClass: aFeatureClass [

	featureClass := aFeatureClass.
	
]

{ #category : #running }
TomeFeatureSuite >> runUnmanaged: aResult [

	[ super runUnmanaged: aResult ] ensure: [ reportingChainObject startChainFor: aResult ].
	
]
