Class {
	#name : #DummyFeature4,
	#superclass : #TomeFeature,
	#category : #'Tome-Adapter-cmd-Tests-DummyFeatures'
}

{ #category : #'scenario definition' }
DummyFeature4 >> dummyScenarioError [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | Error signal: 'error.'	]
]

{ #category : #'scenario definition' }
DummyFeature4 >> dummyScenarioError2 [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | Error signal: 'error.'	]
]

{ #category : #'scenario definition' }
DummyFeature4 >> dummyScenarioError3 [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | Error signal: 'error.'	]
]

{ #category : #'scenario definition' }
DummyFeature4 >> dummyScenarioFailing [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | self assert: pass = 'fail'	]
]

{ #category : #'scenario definition' }
DummyFeature4 >> dummyScenarioFailing2 [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | self assert: pass = 'fail'	]
]

{ #category : #'scenario definition' }
DummyFeature4 >> dummyScenarioFailing3 [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | self assert: pass = 'fail'	]
]

{ #category : #'scenario definition' }
DummyFeature4 >> dummyScenarioPassing [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | self assert: pass = 'pass'	]
]

{ #category : #'scenario definition' }
DummyFeature4 >> dummyScenarioPassing2 [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | self assert: pass = 'pass'	]
]

{ #category : #'scenario definition' }
DummyFeature4 >> dummyScenarioPassing3 [

	<scenario>
	^ self	
		scenario: 'Dummy Scenario Passing'
		def: '"pass"'
		run: [ :pass | self assert: pass = 'pass'	]
]
