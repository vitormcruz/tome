Class {
	#name : #TomeScenarioHtml,
	#superclass : #Object,
	#instVars : [
		'scenario'
	],
	#category : #'Tome-Tool-WebApp'
}

{ #category : #'instance creation' }
TomeScenarioHtml class >> failedFrom: aScenario [

	^ self new scenario: aScenario.
]

{ #category : #'instance creation' }
TomeScenarioHtml class >> passedFrom: aScenario [

	^ self new scenario: aScenario.
]

{ #category : #'instance creation' }
TomeScenarioHtml class >> withErrorFrom: aScenario [

	^ TomeScenarioErrorHtml new scenario: aScenario.
]

{ #category : #'rendering-scenarios' }
TomeScenarioHtml >> body: html [

	| htmlLines htmlParamsStream |
	htmlLines := scenario definition lines collect: [ :line | TomeScenarioHtmlLine on: line ].
	htmlParamsStream := ReadStream on: (scenario parameters collect: [ :param | param asHtmlParam ]).
	^ htmlLines do: [ :htmlLine | htmlLine renderOn: html usingHtmlParamsStream: htmlParamsStream ]
]

{ #category : #accessing }
TomeScenarioHtml >> header: html [

	html text: scenario name.
]

{ #category : #'rendering-scenarios' }
TomeScenarioHtml >> renderOn: html [

	html span
		class: 'scenario-header';
		with: [ self header: html ].

	html div
		class: 'definition-body';
		with: [ self body: html ].
]

{ #category : #accessing }
TomeScenarioHtml >> scenario: aScenario [

	scenario := aScenario.
]
