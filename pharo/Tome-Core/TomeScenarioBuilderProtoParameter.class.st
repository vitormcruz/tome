"
I am used to build an actual TomeScenario when the test case is created. I store the name of the method build, 
annotated with <scenario> pragma and the scenario example index to instantiate later into a TomeScenario. 

Use `TomeScenarioBuilderProtoParameter>>#convertInScenarioFor:` to make the convertion passing the instance of 
the aimed Test Case as argument.
"
Class {
	#name : #TomeScenarioBuilderProtoParameter,
	#superclass : #Object,
	#instVars : [
		'exampleIndex',
		'scenarioBuilderMethodName'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeScenarioBuilderProtoParameter class >> newForScenarioBuilderMethodName: aSelector andExampleIndex: anInteger [

	^ self new scenarioBuilderMethodName: aSelector exampleIndex: anInteger.
]

{ #category : #converting }
TomeScenarioBuilderProtoParameter >> convertInScenarioFor: aTomeFeature [

	^ (aTomeFeature perform: scenarioBuilderMethodName) at: exampleIndex.
]

{ #category : #'instance creation' }
TomeScenarioBuilderProtoParameter >> scenarioBuilderMethodName: aSelector exampleIndex: anInteger [

	scenarioBuilderMethodName := aSelector.
	exampleIndex := anInteger
]
