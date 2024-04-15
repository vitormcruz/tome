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
		'executionBlock',
		'whenClauses'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
TomeScenario class >> withName: scenarioName definition: scenarioDef executionBlock: aBlock [

	^ self new
		name: scenarioName;
		definition: scenarioDef;
		executionBlock: aBlock.
]

{ #category : #accessing }
TomeScenario >> definition [
	^ definition
]

{ #category : #accessing }
TomeScenario >> definition: anObject [
	definition := anObject
]

{ #category : #accessing }
TomeScenario >> executionBlock [
	^ executionBlock
]

{ #category : #accessing }
TomeScenario >> executionBlock: anObject [
	executionBlock := anObject
]

{ #category : #running }
TomeScenario >> extractParameters [

   | paramRegexMatches rawParameters |
   paramRegexMatches := (definition allRegexMatches: '"[\w\d\s+-\.'']*"') flattened.
   rawParameters := paramRegexMatches collect: [ :param | param copyWithoutAll: '"' ].

	rawParameters ifEmpty: [ 
		TestFailure signal: 'Feature without params. This means the feature is not linked to the test code which trumps',
									 ' the runnable specification objective' 
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

{ #category : #converting }
TomeScenario >> parseBlockClosure: aBlockClosure [

	| blockSource blockSourceLines |
	
	blockSource  := aBlockClosure asString.
	blockSourceLines := {'          run: ', blockSource lines first}, 
	                    (blockSource lines allButFirst collect: [ :it | '              ', it ]).
	
	^ (Character cr join: blockSourceLines), '<n>'.
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
	executionBlock valueWithPossibleArgs: parameters.
	whenClauses do: [ :whenClause | whenClause execute ].
	
	parameters do: [ :param | 
		param wasUsed ifFalse: [ 
			TestFailure signal: param asString, ' should be used so that scenario execution pass.' 
		]
	].

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
