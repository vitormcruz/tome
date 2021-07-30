Class {
	#name : #SbddFeatureScenarioBuilderStrategy,
	#superclass : #Object,
	#instVars : [
		'sbddFeatureInstance'
	],
	#category : 'SBDD-Core'
}

{ #category : #'instance creation' }
SbddFeatureScenarioBuilderStrategy class >> newWith: aSbddFeatureScenario [

	^ super new sbddFeatureInstance: aSbddFeatureScenario.
]

{ #category : #accessing }
SbddFeatureScenarioBuilderStrategy >> sbddFeatureInstance: aSbddFeatureScenario [

	sbddFeatureInstance := aSbddFeatureScenario.
]

{ #category : #'scenario builder' }
SbddFeatureScenarioBuilderStrategy >> scenario: aString def: aStringDefinition run: aBlock [

	self subclassResponsibility.
]

{ #category : #'scenario builder' }
SbddFeatureScenarioBuilderStrategy >> scenarioOutline: aString def: aStringDescription examples: examples run: aBlock [

	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
SbddFeatureScenarioBuilderStrategy >> validateInExecution [

	self subclassResponsibility.
]
