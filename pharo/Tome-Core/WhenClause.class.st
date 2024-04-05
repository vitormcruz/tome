Class {
	#name : #WhenClause,
	#superclass : #Object,
	#instVars : [
		'whenBlock',
		'assertions'
	],
	#category : #'Tome-Core'
}

{ #category : #'instance creation' }
WhenClause class >> newFor: aBlock [

	^ self new whenBlock: aBlock.
]

{ #category : #configuration }
WhenClause >> actualValue: aBlock forAssertion: aTomeParamFeatureAssertion [
	
	"Schedule the validation of the actual value for an assertion to be done on the execution of
	this WhenClause. actualValue must be a block because the WhenClause should change it and 
	it's value should be validated before and after this happens.
	"

	aTomeParamFeatureAssertion assertionActualValue: aBlock.
	assertions add: aTomeParamFeatureAssertion.
]

{ #category : #execution }
WhenClause >> execute [

	assertions do: [ :assertion | 
		assertion testFail.		
	].

	whenBlock value.

	assertions do: [ :assertion | 
		assertion assertSuccess.
	].



	
]

{ #category : #initialization }
WhenClause >> initialize [ 

	assertions := OrderedCollection new.
]

{ #category : #configuration }
WhenClause >> whenBlock: aBlock [

	whenBlock := aBlock.
]
