Class {
	#name : #TomeScenarioHtmlParam,
	#superclass : #Object,
	#instVars : [
		'parameterString',
		'spanClass'
	],
	#category : #'Tome-Tool-WebApp'
}

{ #category : #'instance creation' }
TomeScenarioHtmlParam class >> on: aTomeParameter [

	^ self new from: aTomeParameter.
]

{ #category : #'instance creation' }
TomeScenarioHtmlParam >> from: aTomeParameter [

	parameterString := aTomeParameter stringParam.
	spanClass := aTomeParameter wasUsed 
		ifTrue: [ 'scenario-param-was-used' ] 
		ifFalse: [ 'scenario-param-was-not-used' ].
]

{ #category : #accessing }
TomeScenarioHtmlParam >> paramDefString [

	"Return the parameter as it is definided, i.e. with quotation marks enclosing it. "

	^ '"', parameterString , '"'.
]

{ #category : #rendering }
TomeScenarioHtmlParam >> renderOn: html [

	html span
		class: spanClass;
		with: parameterString.
]

{ #category : #private }
TomeScenarioHtmlParam >> split: aLineDef [

	^ self paramDefString split: aLineDef
]

{ #category : #private }
TomeScenarioHtmlParam >> splitDef: aLineDef [

	^ self paramDefString split: aLineDef
]
