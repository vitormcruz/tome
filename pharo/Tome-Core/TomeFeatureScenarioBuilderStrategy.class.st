Class {
	#name : #TomeFeatureScenarioBuilderStrategy,
	#superclass : #Object,
	#instVars : [
		'sbddFeatureInstance'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeFeatureScenarioBuilderStrategy class >> newWith: aSbddFeatureScenario [

	^ super new sbddFeatureInstance: aSbddFeatureScenario.
]

{ #category : #accessing }
TomeFeatureScenarioBuilderStrategy >> sbddFeatureInstance: aSbddFeatureScenario [

	sbddFeatureInstance := aSbddFeatureScenario.
]

{ #category : #'scenario builder' }
TomeFeatureScenarioBuilderStrategy >> scenario: aString def: aStringDefinition run: aBlock [

	self subclassResponsibility.
]

{ #category : #'scenario builder' }
TomeFeatureScenarioBuilderStrategy >> scenarioOutline: aString def: aStringDescription examples: examples run: aBlock [

	self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
TomeFeatureScenarioBuilderStrategy >> validateInExecution [

	self subclassResponsibility.
]
