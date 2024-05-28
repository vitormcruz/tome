Class {
	#name : #TomeScenarioParamViewFragment,
	#superclass : #Object,
	#instVars : [
		'spanClass',
		'title',
		'param'
	],
	#category : #'Tome-Tools-WebApp-ViewFragment'
}

{ #category : #'instance creation' }
TomeScenarioParamViewFragment class >> on: aTomeParameter [

	^ self new from: aTomeParameter.
]

{ #category : #'instance creation' }
TomeScenarioParamViewFragment >> configureNotUsed [

	spanClass := 'scenario-param-was-not-used'.
	title := 'Parameter not used by the Specification implementation, linkage to its execution is compromised'.
]

{ #category : #'instance creation' }
TomeScenarioParamViewFragment >> configureUsed [

	spanClass := 'scenario-param-was-used'.
	title := 'Parameter used by the Specification Implementation'.
]

{ #category : #'instance creation' }
TomeScenarioParamViewFragment >> from: aTomeParameter [

	param := aTomeParameter.
	aTomeParameter wasUsed 
		ifTrue: [ self configureUsed ] 
		ifFalse: [ self configureNotUsed ].
]

{ #category : #accessing }
TomeScenarioParamViewFragment >> paramDefString [

	"Return the parameter as it is definided, i.e. with quotation marks enclosing it. "

	^ '"', param stringParam , '"'.
]

{ #category : #accessing }
TomeScenarioParamViewFragment >> prettyParameter [

	^ param stringParam.
]

{ #category : #rendering }
TomeScenarioParamViewFragment >> renderOn: html [

	html span
		title: self title;
		class: self spanClass;
		with: self prettyParameter.
]

{ #category : #accessing }
TomeScenarioParamViewFragment >> spanClass [

	^ spanClass
]

{ #category : #private }
TomeScenarioParamViewFragment >> split: aLineDef [

	^ self paramDefString split: aLineDef
]

{ #category : #private }
TomeScenarioParamViewFragment >> splitDef: aLineDef [

	^ self paramDefString split: aLineDef
]

{ #category : #accessing }
TomeScenarioParamViewFragment >> title [

	^ title
]
