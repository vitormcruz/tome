Class {
	#name : #DummyFeature3,
	#superclass : #TomeFeature,
	#category : #'Tome-Adapter-cmd-Tests-DummyFeatures'
}

{ #category : #'scenario definition' }
DummyFeature3 >> dummyScenarioError [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | Error signal: 'error.'	]
]
