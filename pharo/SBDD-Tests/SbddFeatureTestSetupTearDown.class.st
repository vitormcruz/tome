Class {
	#name : #SbddFeatureTestSetupTearDown,
	#superclass : #SbddFeature,
	#classVars : [
		'setUpCollection',
		'tearDownCollection'
	],
	#category : 'SBDD-Tests'
}

{ #category : #'private-initialization' }
SbddFeatureTestSetupTearDown class >> initialize [ 

	setUpCollection := OrderedCollection new.
	tearDownCollection  := OrderedCollection new.
]

{ #category : #'scenario definition' }
SbddFeatureTestSetupTearDown >> Test_Setup_And_TearDown [

	<scenario>

	^ self scenarioOutline: 'Test if Setup and TearDown are working correctly'
			 def: 'Execute the {execution}th time' 
			examples: #(execution) asHeaderFor 
					  - #(1)
					  - #(2)
					  - #(3)
			run: [ :execution |
				self assert: setUpCollection isEmpty.
				self assert: tearDownCollection isEmpty.
				setUpCollection add: execution.
				tearDownCollection add: execution.
			] 

]

{ #category : #running }
SbddFeatureTestSetupTearDown >> setUp [

	super setUp.
	setUpCollection removeAll.

]

{ #category : #running }
SbddFeatureTestSetupTearDown >> tearDown [

	super tearDown.
	tearDownCollection removeAll.

]
