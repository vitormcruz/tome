Class {
	#name : #DummyFeature2,
	#superclass : #TomeFeature,
	#category : #'Tome-Adapter-cmd-Tests-DummyFeatures'
}

{ #category : #'scenario definition' }
DummyFeature2 >> dummyScenarioFailing [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | self assert: pass = 'fail'	]
]
