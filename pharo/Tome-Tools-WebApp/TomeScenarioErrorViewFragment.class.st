Class {
	#name : #TomeScenarioErrorViewFragment,
	#superclass : #TomeScenarioViewFragment,
	#instVars : [
		'testCaseInError'
	],
	#category : #'Tome-Tools-WebApp-ViewFragment'
}

{ #category : #rendering }
TomeScenarioErrorViewFragment >> body: html [

	html div
		class: 'definition-body-error-container';
		with: [
			html div
				class: 'scenario-text-body';
				with: [ super body: html ].

			html div
				class: 'error-body';
				with: [ html preformatted: self extractErrorStackTrace ]
			]
]

{ #category : #accessing }
TomeScenarioErrorViewFragment >> errorTestCase: aTestCaseInError [

	testCaseInError := aTestCaseInError.
]

{ #category : #rendering }
TomeScenarioErrorViewFragment >> extractErrorStackTrace [

	^ [ testCaseInError runCase ]
			on: Error
			do: [ :err | 
				String streamContents: [ :s | 
					err messageText printOn: s. 
					s cr. 
					err signalerContext printDebugStackOn: s 
				] 
			]
]
