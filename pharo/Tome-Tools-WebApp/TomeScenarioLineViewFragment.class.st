Class {
	#name : #TomeScenarioLineViewFragment,
	#superclass : #Object,
	#instVars : [
		'scenarioLine'
	],
	#category : #'Tome-Tools-WebApp-ViewFragment'
}

{ #category : #'instance creation' }
TomeScenarioLineViewFragment class >> on: aString [

	^ self new scenarioLine: aString.
]

{ #category : #rendering }
TomeScenarioLineViewFragment >> remainingLineFrom: defLineSplit splitedBy: htmlScenarioParam [

	defLineSplit size = 2 ifTrue: [ ^ defLineSplit at: 2 ]. "there is no other parameter with equal string representation"
	^ defLineSplit removeFirst; 
	               joinUsing: '"' , htmlScenarioParam , '"' "there is other parameter with equal representation, putting it back"
]

{ #category : #rendering }
TomeScenarioLineViewFragment >> renderOn: html usingHtmlParamsStream: htmlParamsStream [

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
TomeScenarioLineViewFragment >> scenarioLine: aString [

	scenarioLine := aString.
]

{ #category : #test }
TomeScenarioLineViewFragment >> scenarioLineUseNextParamFrom: htmlParamsStream [

	htmlParamsStream atEnd ifTrue: [ ^ false ].
	^ (scenarioLine findString: htmlParamsStream peek paramDefString) ~= 0.
	
]
