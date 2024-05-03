Class {
	#name : #TomeScenarioHtmlParam,
	#superclass : #Object,
	#instVars : [
		'spanClass',
		'title',
		'param'
	],
	#category : #'Tome-Tool-WebApp'
}

{ #category : #'instance creation' }
TomeScenarioHtmlParam class >> on: aTomeParameter [

	^ self new from: aTomeParameter.
]

{ #category : #'instance creation' }
TomeScenarioHtmlParam >> configureNotUsed [

	spanClass := 'scenario-param-was-not-used'.
	title := 'Parameter not used by the Specification implementation, linkage to its execution is compromised'.
]

{ #category : #'instance creation' }
TomeScenarioHtmlParam >> configureUsed [

	spanClass := 'scenario-param-was-used'.
	title := 'Parameter used by the Specification Implementation'.
]

{ #category : #'instance creation' }
TomeScenarioHtmlParam >> from: aTomeParameter [

	param := aTomeParameter.
	aTomeParameter wasUsed 
		ifTrue: [ self configureUsed ] 
		ifFalse: [ self configureNotUsed ].
]

{ #category : #accessing }
TomeScenarioHtmlParam >> paramDefString [

	"Return the parameter as it is definided, i.e. with quotation marks enclosing it. "

	^ '"', param stringParam , '"'.
]

{ #category : #accessing }
TomeScenarioHtmlParam >> prettyParameter [

	^ param stringParam.
]

{ #category : #rendering }
TomeScenarioHtmlParam >> renderOn: html [

	html span
		title: self title;
		class: self spanClass;
		with: self prettyParameter.
]

{ #category : #accessing }
TomeScenarioHtmlParam >> spanClass [

	^ spanClass
]

{ #category : #private }
TomeScenarioHtmlParam >> split: aLineDef [

	^ self paramDefString split: aLineDef
]

{ #category : #private }
TomeScenarioHtmlParam >> splitDef: aLineDef [

	^ self paramDefString split: aLineDef
]

{ #category : #accessing }
TomeScenarioHtmlParam >> title [

	^ title
]
