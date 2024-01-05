"
I represent a Scenario ready to be executed. Usually you won't need to use me, see `TomeFeature`
"
Class {
	#name : #TomeScenario,
	#superclass : #Object,
	#instVars : [
		'name',
		'definition',
		'executionBlock'
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

{ #category : #converting }
TomeScenario >> asString [

 ^ ('Scenario: ', name , '<n>' , 
	 definition , '<n>' , 
	 (self parseBlockClosure: executionBlock)) expandMacros.
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

   ^ rawParameters collect: [ :param | TomeParameter createParameterFor: param ]
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

{ #category : #running }
TomeScenario >> run [

   | parameters result |
   self validateScenario.

   parameters := self extractParameters.

	result := executionBlock valueWithPossibleArgs: parameters.
	parameters do: [ :param | 
		    param wasUsed ifFalse: [ 
		    TestFailure signal: param asString, ' should be used so that scenario execution pass.' 
		]
	].

   ^ result.
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
