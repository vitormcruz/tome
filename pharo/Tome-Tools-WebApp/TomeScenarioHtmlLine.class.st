Class {
	#name : #TomeScenarioHtmlLine,
	#superclass : #Object,
	#instVars : [
		'scenarioLine'
	],
	#category : #'Tome-Tools-WebApp'
}

{ #category : #'instance creation' }
TomeScenarioHtmlLine class >> on: aString [

	^ self new scenarioLine: aString.
]

{ #category : #rendering }
TomeScenarioHtmlLine >> remainingLineFrom: defLineSplit splitedBy: htmlScenarioParam [

	defLineSplit size = 2 ifTrue: [ ^ defLineSplit at: 2 ]. "there is no other parameter with equal string representation"
	^ defLineSplit removeFirst; 
	               joinUsing: '"' , htmlScenarioParam , '"' "there is other parameter with equal representation, putting it back"
]

{ #category : #rendering }
TomeScenarioHtmlLine >> renderOn: html usingHtmlParamsStream: htmlParamsStream [

	| htmlScenarioParam lineSplitByParam |
	
	[ self scenarioLineUseNextParamFrom: htmlParamsStream ] whileTrue: [
		htmlScenarioParam := htmlParamsStream next.
		lineSplitByParam := htmlScenarioParam split: scenarioLine.
		html text: (lineSplitByParam at: 1).
		htmlScenarioParam renderOn: html.
		scenarioLine := self remainingLineFrom: lineSplitByParam splitedBy: htmlScenarioParam
	].

	html text: scenarioLine.
	html break
]

{ #category : #accessing }
TomeScenarioHtmlLine >> scenarioLine: aString [

	scenarioLine := aString.
]

{ #category : #test }
TomeScenarioHtmlLine >> scenarioLineUseNextParamFrom: htmlParamsStream [

	htmlParamsStream atEnd ifTrue: [ ^ false ].
	^ (scenarioLine findString: htmlParamsStream peek paramDefString) ~= 0.
	
]
