Class {
	#name : #TomeScenarioViewFragment,
	#superclass : #Object,
	#instVars : [
		'scenario',
		'testCase'
	],
	#category : #'Tome-Tools-WebApp-ViewFragment'
}

{ #category : #'instance creation' }
TomeScenarioViewFragment class >> buildClassFrom: aTomeScenario [

	aTomeScenario passed ifTrue: [ ^ TomeScenarioViewFragment ].
	aTomeScenario hasFailed ifTrue: [ ^ TomeScenarioFailureViewFragment ].
	^ TomeScenarioErrorViewFragment.

]

{ #category : #'instance creation' }
TomeScenarioViewFragment class >> newFrom: aTomeScenario [

	^ (self buildClassFrom: aTomeScenario) new scenario: aTomeScenario.
]

{ #category : #'rendering-scenarios' }
TomeScenarioViewFragment >> body: html [

	| htmlLines htmlParamsStream |
	htmlLines := scenario definition lines collect: [ :line | TomeScenarioLineViewFragment on: line ].
	htmlParamsStream := ReadStream on: (scenario parameters collect: [ :param | param asHtmlParam ]).
	^ htmlLines do: [ :htmlLine | htmlLine renderOn: html usingHtmlParamsStream: htmlParamsStream ]
]

{ #category : #accessing }
TomeScenarioViewFragment >> header: html [

	html text: scenario name.
]

{ #category : #'rendering-scenarios' }
TomeScenarioViewFragment >> renderOn: html [

	html span
		class: 'scenario-header';
		with: [ self header: html ].

	html div
		class: 'definition-body';
		with: [ self body: html ].
]

{ #category : #accessing }
TomeScenarioViewFragment >> scenario: aScenario [

	scenario := aScenario.
]

{ #category : #accessing }
TomeScenarioViewFragment >> testCase: aTestCase [

	testCase := aTestCase.
]
