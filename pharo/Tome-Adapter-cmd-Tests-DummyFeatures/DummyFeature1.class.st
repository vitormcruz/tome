Class {
	#name : #DummyFeature1,
	#superclass : #TomeFeature,
	#category : #'Tome-Adapter-cmd-Tests-DummyFeatures'
}

{ #category : #'scenario definition' }
DummyFeature1 >> dummyScenarioPassing [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | self assert: pass = 'pass'	]
]
