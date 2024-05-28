Class {
	#name : #TomeScenarioViewFragment,
	#superclass : #Object,
	#instVars : [
		'scenario'
	],
	#category : #'Tome-Tools-WebApp-ViewFragment'
}

{ #category : #'instance creation' }
TomeScenarioViewFragment class >> failedFrom: aScenario [

	^ self new scenario: aScenario.
]

{ #category : #'instance creation' }
TomeScenarioViewFragment class >> passedFrom: aScenario [

	^ self new scenario: aScenario.
]

{ #category : #'instance creation' }
TomeScenarioViewFragment class >> withErrorFrom: aScenario [

	^ TomeScenarioErrorViewFragment new scenario: aScenario.
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
