"
I represent a Scenario ready to be executed. Usually you won't need to use me, see `TomeFeature`
"
Class {
	#name : #TomeScenario,
	#superclass : #Object,
	#instVars : [
		'name',
		'definition',
		'parameters',
		'whenClauses',
		'runBlock'
	],
	#category : #'Tome-Core'
}

{ #category : #running }
TomeScenario class >> tomeParamRegex [

	^ '"[\w\d\s+-\.'']*"'
]

{ #category : #'instance creation' }
TomeScenario class >> withName: scenarioName definition: scenarioDef executionBlock: aBlock [

	^ self new
		name: scenarioName;
		definition: scenarioDef;
		runBlock: aBlock.
]

{ #category : #accessing }
TomeScenario >> definition [
	^ definition
]

{ #category : #accessing }
TomeScenario >> definition: anObject [

	definition := anObject ifNotNil: [ anObject withBlanksCondensed ].
]

{ #category : #running }
TomeScenario >> extractParameters [

	| paramRegexMatches rawParameters |
	paramRegexMatches := (definition allRegexMatches: TomeScenario tomeParamRegex) flattened.
	rawParameters := paramRegexMatches collect: [ :param | param copyWithoutAll: '"' ].

	rawParameters ifEmpty: [
		TestFailure signal:
			'Feature without params. This means the feature is not linked to the test code which trumps'
			, ' the runnable specification objective'
		].

	^ rawParameters collect: [ :param | TomeParameter createParameterFor: param ]
]

{ #category : #initialization }
TomeScenario >> initialize [ 

	whenClauses := OrderedCollection new.
]

{ #category : #inspecting }
TomeScenario >> inspectScenarioDesc: specBuilder [

	<inspectorPresentationOrder: 1 title: 'Scenario Description'>

	^ specBuilder newText text: (self scenarioDescription); beNotEditable; yourself.
]

{ #category : #accessing }
TomeScenario >> name [
	^ name
]

{ #category : #accessing }
TomeScenario >> name: anObject [
	name := anObject
]

{ #category : #accessing }
TomeScenario >> parameters [

	^ parameters clone.
]

{ #category : #printing }
TomeScenario >> printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that
	identifies the receiver."
	
	aStream
		nextPutAll: 'Scenario: ';
		nextPutAll: name;
		nextPutAll: ' '.
		
	self extractParameters printElementsOn: aStream.

]

{ #category : #running }
TomeScenario >> run [

	self validateScenario.

	parameters := self extractParameters.
	runBlock valueWithPossibleArgs: parameters.
	whenClauses do: [ :whenClause | whenClause execute ].
	
	parameters do: [ :param | 
		param wasUsed ifFalse: [ 
			TestFailure signal: param asString, ' should be used so that scenario execution pass.' 
		]
	].

]

{ #category : #accessing }
TomeScenario >> runBlock [
	^ runBlock
]

{ #category : #accessing }
TomeScenario >> runBlock: aBlock [
	runBlock := aBlock
]

{ #category : #converting }
TomeScenario >> scenarioDescription [

		^ 'Scenario: ', name, String cr, definition.

]

{ #category : #running }
TomeScenario >> validateScenario [
	| errors |
	
	errors := OrderedCollection new.
	name ifNil: [ errors add: 'scenario_mandatory_name' ].
	definition ifNil: [ errors add: 'scenario_mandatory_step_definition' ].
	name ifNil: [ errors add: 'scenario_mandatory_executionBlock' ].
	
	errors ifNotEmpty: [ 
		Error signal: 'Following errors found while creating a new Feature: ', 
						  (', ' join: errors) 
	].
]

{ #category : #running }
TomeScenario >> when: aBlock [

	^ whenClauses add: (WhenClause newFor: aBlock). 
]
