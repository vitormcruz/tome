Class {
	#name : #SbddScenario,
	#superclass : #Object,
	#instVars : [
		'name',
		'definition',
		'executionBlock'
	],
	#category : 'Tome-Core'
}

{ #category : #'instance creation' }
SbddScenario class >> withName: scenarioName definition: scenarioDef executionBlock: aBlock [

	^ self new
		name: scenarioName;
		definition: scenarioDef;
		executionBlock: aBlock.
]

{ #category : #converting }
SbddScenario >> asString [

 ^ ('Scenario: ', name , '<n>' , 
	 definition , '<n>' , 
	 (self parseBlockClosure: executionBlock)) expandMacros.
]

{ #category : #accessing }
SbddScenario >> definition [
	^ definition
]

{ #category : #accessing }
SbddScenario >> definition: anObject [
	definition := anObject
]

{ #category : #accessing }
SbddScenario >> executionBlock [
	^ executionBlock
]

{ #category : #accessing }
SbddScenario >> executionBlock: anObject [
	executionBlock := anObject
]

{ #category : #accessing }
SbddScenario >> name [
	^ name
]

{ #category : #accessing }
SbddScenario >> name: anObject [
	name := anObject
]

{ #category : #converting }
SbddScenario >> parseBlockClosure: aBlockClosure [

	| blockSource blockSourceLines |
	
	blockSource  := aBlockClosure asString.
	blockSourceLines := {'          run: ', blockSource lines first}, 
	                    (blockSource lines allButFirst collect: [ :it | '              ', it ]).
	
	^ (Character cr join: blockSourceLines), '<n>'.
]

{ #category : #running }
SbddScenario >> run [
	| parameters |
	
	self validateScenario.
	
	parameters := definition chain
									allRegexMatches: '"[\w\d\s+-\.]*"';
									flattened;
									collect: [ :param | param copyWithoutAll: '"' ];
									collect: [ :param | [ param asNumber ] on: Exception do: [ :err | param ] ];
									subject.

	^ executionBlock valueWithPossibleArgs: parameters .

]

{ #category : #running }
SbddScenario >> validateScenario [
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
