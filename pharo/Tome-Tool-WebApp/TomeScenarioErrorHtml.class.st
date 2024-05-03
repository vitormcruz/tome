Class {
	#name : #TomeScenarioErrorHtml,
	#superclass : #TomeScenarioHtml,
	#category : #'Tome-Tool-WebApp'
}

{ #category : #rendering }
TomeScenarioErrorHtml >> body: html [

	html div class: 'definition-body-error-container'; with: [		
		html div
			class: 'scenario-text-body';
			with: [ super body: html ].
		
		html div 
			class: 'error-body';
			with: [ 
				[ scenario run ] on: Error do: [ :err | html preformatted: (String streamContents: [ :s | err signalerContext printDebugStackOn: s ]) ].
			]
	]
]
