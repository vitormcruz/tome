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
WhenClause >> takeValue: aBlock andAssertWith: aTomeParamFeatureAssertion [
	
	"Configure aTomeParamFeatureAssertion so that it is verified against
	 the value calculated from aBlock when the WhenClause is executed.
	"

	aTomeParamFeatureAssertion assertionActualValue: aBlock.
	assertions add: aTomeParamFeatureAssertion.
]

{ #category : #configuration }
WhenClause >> whenBlock: aBlock [

	whenBlock := aBlock.
]
